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

import 'dart:typed_data';
import 'dart:io' as io; // Added for Mobile file saving
import 'package:flutter/foundation.dart' show kIsWeb; // Added to check platform
import 'package:path_provider/path_provider.dart'; // Added for Mobile directory paths
import 'package:universal_html/html.dart'
    as html; // Added for Web blob downloads
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

Future<String?> generateFullEventEntryList(String eventId) async {
  try {
    // 1. Query data directly from view_pdf_entry_lists.
    final List<dynamic> rawData = await SupaFlow.client
        .from('view_pdf_entry_lists')
        .select('*')
        .eq('event_id', eventId)
        .neq('status', 'pending_submission')
        .order('entry_number', ascending: true);

    if (rawData.isEmpty) {
      print('⚠️ No entries found for this event');
      return null;
    }

    print('✅ Fetched ${rawData.length} entries from database');

    // 1b. Fetch event categories with order from database
    final List<dynamic> categoriesData = await SupaFlow.client
        .from('event_categories')
        .select('category_name, category_order')
        .eq('event_id', eventId)
        .order('category_order', ascending: true);

    // Create a map of category order for sorting
    final Map<String, int> categoryOrderMap = {};
    for (var cat in categoriesData) {
      categoryOrderMap[cat['category_name']?.toString().toUpperCase() ?? ''] =
          cat['category_order'] ?? 999;
    }

    // 1c. Fetch event details from events table
    final eventDetails = await SupaFlow.client
        .from('events')
        .select('event_name, eventBanner')
        .eq('event_uid', eventId)
        .single();

    String eventTitle = eventDetails['event_name'] ?? 'Event';
    String? eventBannerUrl = eventDetails['eventBanner'];

    // Download Image
    pw.MemoryImage? bannerImage;

    if (eventBannerUrl != null && eventBannerUrl.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(eventBannerUrl));

        if (response.statusCode == 200) {
          bannerImage = pw.MemoryImage(response.bodyBytes);
        }
      } catch (e) {
        print('⚠️ Unable to load banner image: $e');
      }
    }

    // 2. Parse and group data by category dynamically
    final List<Map<String, dynamic>> entries =
        rawData.map((item) => Map<String, dynamic>.from(item as Map)).toList();

    String eventName =
        entries.isNotEmpty ? (entries[0]['event_name'] ?? '') : '';

    // Group by category and auto-discover categories
    final Map<String, List<Map<String, dynamic>>> groupedByCategory = {};
    final List<String> dynamicCategoryOrder = [];

    for (var entry in entries) {
      final category = entry['category']?.toString().toUpperCase() ?? 'UNKNOWN';

      if (!groupedByCategory.containsKey(category)) {
        groupedByCategory[category] = [];
        dynamicCategoryOrder.add(category); // Auto-discover categories
      }
      groupedByCategory[category]!.add(entry);
    }

    // 3. Sort categories by database order
    dynamicCategoryOrder.sort((a, b) {
      final aOrder = categoryOrderMap[a] ?? 999;
      final bOrder = categoryOrderMap[b] ?? 999;
      return aOrder.compareTo(bOrder);
    });

    // --- Dynamic Compression Budget calculations ---
    int totalEntries =
        groupedByCategory.values.fold(0, (sum, list) => sum + list.length);

    int estimatedRowsPerPage = 42;

    double overflowPercentage =
        ((totalEntries % estimatedRowsPerPage) / estimatedRowsPerPage) * 100;

    bool shouldCompress = overflowPercentage > 0 && overflowPercentage < 15;

    double dynamicFontSize = shouldCompress ? 7.0 : 7.5;
    double dynamicHeaderFontSize = shouldCompress ? 7.5 : 8.0;
    double dynamicCellPadding = shouldCompress ? 0.6 : 1.2;
    double tableGap = shouldCompress ? 2.0 : 3.0;

    print(
        '📊 Entries: $totalEntries | Overflow: ${overflowPercentage.toStringAsFixed(1)}% | Compress: $shouldCompress');

    // 4. Create PDF document
    final pdf = pw.Document();
    final List<pw.Widget> allCategoryTables = [];

    // Event Banner
    if (bannerImage != null) {
      allCategoryTables.add(pw.SizedBox(height: 2));
      allCategoryTables.add(
        pw.Center(
          child: pw.Image(
            bannerImage,
            width: PdfPageFormat.a4.availableWidth * 0.8,
            fit: pw.BoxFit.contain,
          ),
        ),
      );
      allCategoryTables.add(
        pw.Divider(color: PdfColors.black, thickness: 1, height: 3),
      );
    }

    // Add Title section
    allCategoryTables.add(pw.Center(
      child: pw.Text(
        eventTitle,
        style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
      ),
    ));
    allCategoryTables.add(
      pw.Divider(color: PdfColors.black, thickness: 1, height: 2),
    );

    // Add "FINAL ENTRY LIST" section
    allCategoryTables.add(
      pw.Center(
        child: pw.Text(
          'FINAL ENTRY LIST',
          style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
          textAlign: pw.TextAlign.center,
        ),
      ),
    );
    allCategoryTables.add(
      pw.Divider(color: PdfColors.black, thickness: 1, height: 2),
    );

    for (final category in dynamicCategoryOrder) {
      if (groupedByCategory.containsKey(category)) {
        final categoryEntries = groupedByCategory[category]!;

        allCategoryTables.add(pw.Center(
          child: pw.Text(
            _getCategoryDisplayName(category),
            style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
          ),
        ));
        allCategoryTables.add(pw.SizedBox(height: 2));

        allCategoryTables.add(
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black, width: 0.7),
            columnWidths: const {
              0: pw.FixedColumnWidth(12),
              1: pw.FixedColumnWidth(28),
              2: pw.FixedColumnWidth(90),
              3: pw.FixedColumnWidth(66),
              4: pw.FixedColumnWidth(35),
              5: pw.FixedColumnWidth(30),
              6: pw.FixedColumnWidth(40),
            },
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.grey300),
                children: [
                  _buildHeader(
                      'S.No', dynamicHeaderFontSize, dynamicCellPadding),
                  _buildHeaderBold(
                      'Comp #', dynamicHeaderFontSize, dynamicCellPadding),
                  _buildHeader(
                      'Name', dynamicHeaderFontSize, dynamicCellPadding),
                  _buildHeader(
                      'Team', dynamicHeaderFontSize, dynamicCellPadding),
                  _buildHeader(
                      'License', dynamicHeaderFontSize, dynamicCellPadding),
                  _buildHeader(
                      'Blood Group', dynamicHeaderFontSize, dynamicCellPadding),
                  _buildHeader(
                      'City', dynamicHeaderFontSize, dynamicCellPadding),
                ],
              ),
              ...categoryEntries.asMap().entries.map((entry) {
                final sNo = entry.key + 1;
                final data = entry.value;

                return pw.TableRow(
                  children: [
                    _buildCellCenter(
                        sNo.toString(), dynamicFontSize, dynamicCellPadding),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      padding: pw.EdgeInsets.all(dynamicCellPadding),
                      child: pw.Text(
                        data['entry_number']?.toString() ?? '-',
                        style: pw.TextStyle(
                            fontSize: 8.0,
                            fontWeight: pw.FontWeight.bold,
                            letterSpacing: 0.5),
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                    _buildCell(data['driver_name']?.toString() ?? '-',
                        dynamicFontSize, dynamicCellPadding),
                    _buildCellCenter(data['teamName']?.toString() ?? '-',
                        dynamicFontSize, dynamicCellPadding),
                    _buildCellCenter(
                        data['fmsci_licenseNumber']?.toString() ?? '-',
                        dynamicFontSize,
                        dynamicCellPadding),
                    _buildCellCenter(data['blood_group']?.toString() ?? '-',
                        dynamicFontSize, dynamicCellPadding),
                    _buildCellCenter(data['city']?.toString() ?? '-',
                        dynamicFontSize, dynamicCellPadding),
                  ],
                );
              }).toList(),
            ],
          ),
        );
        allCategoryTables.add(pw.SizedBox(height: tableGap));
      }
    }

    allCategoryTables.add(pw.SizedBox(height: 10));
    allCategoryTables.add(pw.Divider(color: PdfColors.black, thickness: 1));
    allCategoryTables.add(pw.SizedBox(height: 2));
    allCategoryTables.add(
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'Generated: ${DateFormat('dd MMM yyyy HH:mm a').format(DateTime.now())}',
            style: pw.TextStyle(fontSize: 7, fontStyle: pw.FontStyle.italic),
          ),
          pw.Text(
            eventTitle,
            style: pw.TextStyle(fontSize: 7, fontStyle: pw.FontStyle.italic),
          ),
        ],
      ),
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin:
            const pw.EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 10),
        build: (context) => [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: allCategoryTables,
          ),
        ],
      ),
    );

    // --- CUSTOMIZED DEFAULT DOWNLOAD NAMING STRATEGY ---
    final String cleanEventName =
        eventName.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_');
    final String formattedDate = DateFormat('ddMMyyyy').format(DateTime.now());
    final String finalFileName =
        '${cleanEventName}_Entry_List_$formattedDate.pdf';

    final Uint8List pdfData = await pdf.save();

    if (kIsWeb) {
      // --- WEB STRATEGY ---
      // Force an anchor download link in the browser using the calculated clean layout name
      final blob = html.Blob([pdfData], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", finalFileName)
        ..click();

      html.Url.revokeObjectUrl(url);
      return url; // Returns blob link cleanly to UI flow
    } else {
      // --- MOBILE STRATEGY (Android & iOS ready) ---
      // Instead of browser routing, write directly to temporary device storage cache safely
      final directory = await getTemporaryDirectory();
      final file = io.File('${directory.path}/$finalFileName');
      await file.writeAsBytes(pdfData);

      return file.path; // Returns local path string (e.g., file://...)
    }
  } catch (e) {
    print('❌ Error generating PDF: $e');
    return null;
  }
}

// Helper functions remain completely unchanged below...
String _getCategoryDisplayName(String category) {
  final Map<String, String> categoryNames = {
    'MICRO': 'MICROMAX',
    'MINI': 'MINIMAX',
    'JUNIOR': 'OK-JUNIOR',
    'SENIOR': 'SENIOR MAX',
  };
  return categoryNames[category] ?? category;
}

pw.Widget _buildHeader(String text, double fontSize, double padding) {
  return pw.Container(
    alignment: pw.Alignment.center,
    padding: pw.EdgeInsets.all(padding),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontSize: fontSize, fontWeight: pw.FontWeight.normal),
      textAlign: pw.TextAlign.center,
      maxLines: 2,
    ),
  );
}

pw.Widget _buildHeaderBold(String text, double fontSize, double padding) {
  return pw.Container(
    alignment: pw.Alignment.center,
    padding: pw.EdgeInsets.all(padding),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontSize: fontSize, fontWeight: pw.FontWeight.bold),
      textAlign: pw.TextAlign.center,
      maxLines: 2,
    ),
  );
}

pw.Widget _buildCell(String text, double fontSize, double padding) {
  return pw.Container(
    alignment: pw.Alignment.centerLeft,
    padding: pw.EdgeInsets.only(left: 2.0, top: padding + 0.3, bottom: padding),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontSize: fontSize),
      maxLines: 2,
      textAlign: pw.TextAlign.left,
      overflow: pw.TextOverflow.clip,
    ),
  );
}

pw.Widget _buildCellCenter(String text, double fontSize, double padding) {
  return pw.Container(
    alignment: pw.Alignment.center,
    padding: pw.EdgeInsets.all(padding),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontSize: fontSize),
      textAlign: pw.TextAlign.center,
      maxLines: 2,
      overflow: pw.TextOverflow.clip,
    ),
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
