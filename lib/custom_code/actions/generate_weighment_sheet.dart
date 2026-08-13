// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// `logoImagePath` is optional — give it FlutterFlow's "ImagePath" argument
// type and pick the logo from your project's Assets. FlutterFlow passes
// this through as a plain String: a bundled asset path (e.g.
// "assets/images/logo.png") if it's a project Asset, or an http(s) URL if
// it ever comes from an uploaded/hosted image instead — both are handled
// below. It's loaded once and stamped as a small banner at the top of every
// page. Pass null / omit to skip it.
Future<void> generateWeighmentSheet(
  String eventId,
  String? logoImagePath,
) async {
  final supabase = Supabase.instance.client;

  // 1. Event
  final eventRow = await supabase
      .from('events')
      .select('event_name')
      .eq('event_uid', eventId)
      .maybeSingle();
  final String eventName = (eventRow?['event_name'] ?? 'Event').toString();

  // 2. Categories (for name + display order)
  final categories = await supabase
      .from('event_categories')
      .select('id, category_name, category_order')
      .eq('event_id', eventId)
      .order('category_order', ascending: true);
  final Map<String, String> categoryNameById = {
    for (final c in categories)
      c['id'].toString(): (c['category_name'] ?? '').toString()
  };
  final Map<String, int> categoryOrderById = {
    for (final c in categories)
      c['id'].toString(): ((c['category_order'] ?? 0) as num).toInt()
  };

  // 3. Races — one page each. Ordered by category, then race order.
  final races = await supabase
      .from('event_races')
      .select('race_name, category_id, race_order')
      .eq('event_id', eventId)
      .order('race_order', ascending: true);
  final raceList = List<dynamic>.from(races)
    ..sort((a, b) {
      final ca = categoryOrderById[a['category_id']?.toString()] ?? 0;
      final cb = categoryOrderById[b['category_id']?.toString()] ?? 0;
      if (ca != cb) return ca.compareTo(cb);
      final ra = ((a['race_order'] ?? 0) as num).toInt();
      final rb = ((b['race_order'] ?? 0) as num).toInt();
      return ra.compareTo(rb);
    });

  // 4. Registrations — APPROVED only.
  final registrations = await supabase
      .from('event_registrations')
      .select('driver_id, category, entry_number')
      .eq('event_id', eventId)
      .eq('status', 'approved');

  // 5. Driver names
  final driverIds = registrations
      .map((r) => r['driver_id'])
      .where((id) => id != null)
      .toSet()
      .toList();
  final Map<String, String> driverNames = {};
  if (driverIds.isNotEmpty) {
    final users = await supabase
        .from('app_users')
        .select('id, name')
        .inFilter('id', driverIds);
    for (final u in users) {
      driverNames[u['id'].toString()] = (u['name'] ?? '').toString();
    }
  }

  // ---------------------------------------------------------------------------
  // Group every approved entry by its own category text (guarantees entries
  // always appear, regardless of category-table spelling drift).
  // ---------------------------------------------------------------------------
  final Map<String, List<dynamic>> byCategory = {};
  for (final r in registrations) {
    final key = _norm((r['category'] ?? 'NA').toString());
    byCategory.putIfAbsent(key, () => []).add(r);
  }

  // Load the logo once (if provided) and reuse it on every page.
  pw.MemoryImage? logoImage;
  if (logoImagePath != null && logoImagePath.trim().isNotEmpty) {
    final path = logoImagePath.trim();
    try {
      if (path.startsWith('http://') || path.startsWith('https://')) {
        final response = await http.get(Uri.parse(path));
        if (response.statusCode == 200 && response.bodyBytes.isNotEmpty) {
          logoImage = pw.MemoryImage(response.bodyBytes);
        }
      } else {
        // Bundled project asset, e.g. "assets/images/logo.png".
        final data = await rootBundle.load(path);
        logoImage = pw.MemoryImage(data.buffer.asUint8List());
      }
    } catch (_) {
      // If the logo fails to load, silently continue without it rather
      // than failing the whole PDF.
      logoImage = null;
    }
  }

  // ---------------------------------------------------------------------------
  // Build PDF — one page per race (category × race), all categories.
  // ---------------------------------------------------------------------------
  final doc = pw.Document();

  final pages = raceList.isNotEmpty
      ? raceList
      : [
          {'race_name': '', 'category_id': null}
        ];

  for (final race in pages) {
    final categoryName =
        categoryNameById[race['category_id']?.toString()] ?? '';
    final raceName = (race['race_name'] ?? '').toString();
    final entries = List<dynamic>.from(byCategory[_norm(categoryName)] ?? [])
      ..sort((a, b) => ((a['entry_number'] ?? 1 << 30) as int)
          .compareTo((b['entry_number'] ?? 1 << 30) as int));

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(28, 28, 28, 28),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              // ----- Logo (optional) -----------------------------------------
              if (logoImage != null) ...[
                pw.Center(
                  child: pw.Image(logoImage, height: 36),
                ),
                pw.SizedBox(height: 4),
              ],

              // ----- Header --------------------------------------------------
              pw.Center(
                child: pw.Text(eventName,
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 2),
              pw.Center(
                child: pw.Text('Category: $categoryName',
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 2),

              // Race name — centered, below Category.
              pw.Center(
                child: pw.Text(raceName,
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 6),

              // Minimum Weight (left) and Date & Time (right).
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Text('Minimum Weight: ',
                        style: pw.TextStyle(
                            fontSize: 11, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Text('Date & Time: ______________',
                      style: const pw.TextStyle(fontSize: 11)),
                ],
              ),
              pw.SizedBox(height: 6),

              // ----- Entry table (natural height) ---------------------------
              _buildTable(
                entries,
                driverNames,
                extraReserve: logoImage != null ? 42 : 0,
              ),

              // Push signatures to the very bottom of the page.
              pw.Spacer(),

              // Chief Scrutineer — bottom LEFT. Technical Delegate — bottom RIGHT.
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  _signatureBlock('Chief Scrutineer',
                      align: pw.CrossAxisAlignment.start),
                  _signatureBlock('Technical Delegate',
                      align: pw.CrossAxisAlignment.end),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  final bytes = await doc.save();
  final safeName = eventName.trim().replaceAll(RegExp(r'[^\w\-]+'), '_');

  // Triggers a real file download (browser download on web, native
  // save/share sheet on mobile/desktop) instead of just opening a preview.
  await Printing.sharePdf(
    bytes: bytes,
    filename: '${safeName}_weighment_sheet.pdf',
  );
}

String _norm(String s) => s.trim().toLowerCase();

// -----------------------------------------------------------------------------
// Entry table: S.No | Comp No | Name | Weight (kgs) | Signature
// Comp No + Name populated; Weight & Signature blank.
// Row height auto-shrinks so all entries fit on one page while leaving room
// for the logo, header, and signature block.
// -----------------------------------------------------------------------------
pw.Widget _buildTable(
  List<dynamic> entries,
  Map<String, String> driverNames, {
  double extraReserve = 0,
}) {
  const headers = ['S.No', 'Comp No', 'Name', 'Meas Weight (kgs)', 'Signature'];
  const columnWidths = {
    0: pw.FixedColumnWidth(33),
    1: pw.FixedColumnWidth(77),
    2: pw.FlexColumnWidth(3),
    3: pw.FixedColumnWidth(100),
    4: pw.FlexColumnWidth(2),
  };

  // Exactly one row per entry.
  final int rowCount = entries.length;

  // Usable page height (A4 minus margins) budget for the table, keeping room
  // reserved for the header block, optional logo, and signatures. Shrink row
  // height to fit.
  final double available =
      842 - 56 - 110 - extraReserve; // page - margins - header/sign block
  double rowHeight = available / (rowCount + 1); // +1 for header row
  if (rowHeight > 22) rowHeight = 22; // don't over-stretch small lists
  if (rowHeight < 12) rowHeight = 12; // floor for readability
  final double fontSize = rowHeight <= 14 ? 8 : 10;
  // Comp No is the most important field to spot at a glance — bump it up.
  final double compFontSize = fontSize + 4;

  final rows = <pw.TableRow>[
    pw.TableRow(
      decoration: const pw.BoxDecoration(color: PdfColors.grey300),
      children: headers
          .map((h) => pw.Container(
                height: rowHeight,
                alignment: pw.Alignment.center,
                padding: const pw.EdgeInsets.symmetric(horizontal: 4),
                child: pw.Text(h,
                    style: pw.TextStyle(
                        fontSize: fontSize, fontWeight: pw.FontWeight.bold)),
              ))
          .toList(),
    ),
  ];

  for (var i = 0; i < rowCount; i++) {
    String compNo = '';
    String name = '';
    if (i < entries.length) {
      final e = entries[i];
      compNo = (e['entry_number'] ?? '').toString();
      name = driverNames[e['driver_id']?.toString()] ?? '';
    }
    rows.add(
      pw.TableRow(
        children: [
          _cell('${i + 1}', rowHeight, fontSize),
          // Comp No — centered + bold + larger font for visibility
          _cell(compNo, rowHeight, compFontSize,
              align: pw.Alignment.center, bold: true),
          _cell(name, rowHeight, fontSize),
          _cell('', rowHeight, fontSize), // Weight — blank
          _cell('', rowHeight, fontSize), // Signature — blank
        ],
      ),
    );
  }

  return pw.Table(
    border: pw.TableBorder.all(width: 0.5, color: PdfColors.grey600),
    columnWidths: columnWidths,
    children: rows,
  );
}

pw.Widget _cell(
  String text,
  double height,
  double fontSize, {
  pw.Alignment align = pw.Alignment.centerLeft,
  bool bold = false,
}) =>
    pw.Container(
      height: height,
      padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      alignment: align,
      child: pw.Text(text,
          style: pw.TextStyle(
              fontSize: fontSize,
              fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal)),
    );

pw.Widget _signatureBlock(String label,
        {pw.CrossAxisAlignment align = pw.CrossAxisAlignment.start}) =>
    pw.Column(
      crossAxisAlignment: align,
      children: [
        pw.Container(width: 160, height: 1, color: PdfColors.black),
        pw.SizedBox(height: 3),
        pw.Text(label,
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
      ],
    );
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
