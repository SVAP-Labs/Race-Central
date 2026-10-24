// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/nav/nav.dart';

Future previewButton(
  String eventId,
  String driverId,
  String category,
) async {
  final context = appNavigatorKey.currentContext;
  if (context == null) return;

  String v(String? s) => (s == null || s.trim().isEmpty) ? '-' : s.trim();
  String join(List<String?> p) =>
      p.where((x) => x != null && x.trim().isNotEmpty).join(', ');

  // 'NA' / '-' / empty are placeholders, not real uploaded files
  bool hasFile(String? s) {
    final t = (s ?? '').trim();
    return t.isNotEmpty && t.toUpperCase() != 'NA' && t != '-';
  }

  // ---------- event_registrations ----------
  final rows = await EventRegistrationsTable().querySingleRow(
    queryFn: (q) => q
        .eqOrNull('driver_id', driverId)
        .eqOrNull('event_id', eventId)
        .eqOrNull('category', category),
  );
  final r = rows.isNotEmpty ? rows.first : null;

  // ---------- app_users (phone, parent contact, blood group, gender, address) ----------
  final userRows = await AppUsersTable().querySingleRow(
    queryFn: (q) => q.eqOrNull('id', driverId),
  );
  final au = userRows.isNotEmpty ? userRows.first : null;

  // ---------- category type ----------
  // 1) event_categories -> championship_category_id
  final eventCatRows = await EventCategoriesTable().querySingleRow(
    queryFn: (q) =>
        q.eqOrNull('event_id', eventId).eqOrNull('category_name', category),
  );
  final championshipCategoryId = eventCatRows.isNotEmpty
      ? eventCatRows.first.championshipCategoryId
      : null;

  // 2) championship_categories -> category_type
  String? categoryType;
  if (championshipCategoryId != null) {
    final champRows = await ChampionshipCategoriesTable().querySingleRow(
      queryFn: (q) => q.eqOrNull('id', championshipCategoryId),
    );
    categoryType = champRows.isNotEmpty ? champRows.first.categoryType : null;
  }

  final type = (categoryType ?? '').trim().toLowerCase();
  final is2W = type == 'onemake_2w';
  final is4W = type == 'onemake_4w';
  final isOneMake = is2W || is4W;
  final isTouring = type == 'touring';
  final isF4 = type.contains('f4');

  // What to show
  final showRookie = !isTouring && !isOneMake; // F4 shows rookie
  final showVehicleTyre = !isF4 && !isOneMake; // touring shows vehicle & tyre
  final showCompNumber = !is2W; // hidden only for onemake_2w
  final showTeam = !isOneMake;

  final u = currentUserDocument;
  final a = u?.address;
  final e = u?.eventEmegencyDetails;
  final p = u?.userDetailProfile;

  // Address: app_users first, fall back to the Firebase user document
  final lane1 = au?.getField<String>('address_lane_1') ?? a?.addressLane;
  final lane2 = au?.getField<String>('address_lane_2') ?? a?.streetLane;
  final city = au?.getField<String>('city') ?? a?.city;
  final state = au?.getField<String>('state') ?? a?.state;
  final zip = au?.getField<String>('zipcode') ?? a?.pincode;
  final country = au?.getField<String>('country') ?? a?.country;

  final addressText = [
    v(lane1),
    v(lane2),
    v(join([city, state, zip, country])),
  ].join('\n');

  final sections = <String, Map<String, String>>{
    'Registration': {
      'Category': v(r?.category),
      if (showRookie) 'Rookie': r?.isRookie == true ? 'Yes' : 'No',
      if (showVehicleTyre) 'Vehicle': v(r?.vehicleModel),
      if (showVehicleTyre) 'Tyre size': v(r?.tyreSize),
      'Issuing ASN': v(r?.issuingASN),
      'License no.': v(r?.fmsciLicenseNumber),
    },
    if (showCompNumber)
      'Competition Number': {
        'Option 1': v(r?.entryNumber?.toString()),
        'Option 2': v(r?.entryNumber2),
        'Option 3': v(r?.entryNumber3),
      },
    'Applicant': {
      'Name': v(u?.displayName),
      'Email': v(u?.email),
      //'Phone': v(au?.getField<String>('phone')),
      'Phone': v(au?.getField<String>('parentContact')),
      'Blood group': v(au?.getField<String>('bloodGroup')),
      'Gender': v(au?.getField<String>('gender')),
      'Address': addressText,
    },
    'Emergency Contact': {
      'Name': v(e?.emergencyName),
      'Relationship': v(e?.relationship),
      'Phone': v(e?.emergencyPhone),
      'Email': v(e?.emergencyEmail),
      'Address': v(join([
        e?.emergencyAddressLane,
        e?.emergencyStreetlane,
        e?.emergencyCity,
        e?.emergencyState,
        e?.emergencyPincode,
        e?.emergencyCountry
      ])),
    },
    'Driver Profile': {
      'Food': p?.isNonVeg == true ? 'Non-Veg' : 'Veg',
      'Nationality': v(p?.nationality),
      'Facebook': v(p?.facebookHandle),
      'Instagram': v(p?.instagramHandle),
      'Racing since': v(p?.racingSince),
      'Races': v(p?.numberOfRacesParticpated),
      'Podiums': v(p?.noOfPodiums),
      'Hobby': v(p?.hobby),
      'Idol': v(p?.motorsportIdol),
      'Aim': v(p?.aim),
    },
    if (showTeam)
      'Team': {
        'Team': v(r?.teamName),
        'Manager': v(r?.teamManager),
        'Mobile': v(r?.teamMangerPhone),
        'Email': v(r?.teamEmail),
      },
    'Documents': {
      'ID proof': hasFile(u?.userIdProof) ? 'Uploaded' : 'Not uploaded',
      'Insurance PDF': hasFile(r?.attachmentLink) ? 'Uploaded' : 'Not uploaded',
    },
  };

  final theme = FlutterFlowTheme.of(context);
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: theme.primaryBackground,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (sheetContext) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
            child: Row(children: [
              Expanded(
                  child:
                      Text('Preview of your entry', style: theme.titleLarge)),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(sheetContext),
              ),
            ]),
          ),
          Expanded(
            child: ListView(
              controller: controller,
              padding: const EdgeInsets.all(16),
              children: sections.entries.map((s) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.key,
                          style: theme.titleMedium.override(
                              fontFamily: 'Inter Tight',
                              color: const Color(0xFFD4B91F),
                              fontWeight: FontWeight.bold)),
                      const Divider(height: 16),
                      ...s.value.entries.map((f) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(f.key,
                                      style: theme.bodySmall.override(
                                          fontFamily: 'Inter',
                                          color: theme.secondaryText)),
                                ),
                                Expanded(
                                  child: Text(f.value,
                                      style: theme.bodyMedium.override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
