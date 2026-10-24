import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String? sessionTime(
  DateTime? startTime,
  DateTime? endTime,
) {
  if (startTime == null || endTime == null) {
    return '0';
  }

  Duration difference = endTime.difference(startTime);
  return difference.inMinutes.toString();
}

int? calculateAge(DateTime? dob) {
  if (dob == null) return 0;

  final today = DateTime.now();

  int age = today.year - dob.year;

  // Adjust if birthday hasn't occurred yet this year
  if (today.month < dob.month ||
      (today.month == dob.month && today.day < dob.day)) {
    age--;
  }

  return age;
}

List<String>? getEntryNumbers(String? category) {
  List<String> numbers = [];
  int start = 0;
  int end = 0;

  // 1. ADD THIS SAFETY CHECK: If category is null, return an empty list immediately
  if (category == null) {
    return [];
  }

  // 2. Now it is 100% safe to clean up the string
  String cat = category.toLowerCase().trim();

  if (cat == 'MicroMAX') {
    start = 1;
    end = 50;
  } else if (cat == 'MiniMAX') {
    start = 51;
    end = 99;
  } else if (cat == 'JuniorMAX') {
    start = 101;
    end = 150;
  } else if (cat == 'SeniorMAX') {
    start = 151; // To prevent overlap with Junior ending at 75
    end = 199;
  } else {
    return []; // Return empty if no valid category matches
  }

  for (int i = start; i <= end; i++) {
    numbers.add(i.toString());
  }

  return numbers;
}

List<String>? addAllToDropdown(
  List<String> inputList,
  String? fieldName,
) {
  List<String> updatedList = ['ALL'];

  for (var item in inputList) {
    if (item is String) {
      // Handle enum strings
      updatedList.add(item);
    } else if (item is Map) {
      // Handle Supabase JSON objects
      try {
        String value = (item as Map<String, dynamic>)[fieldName].toString();
        if (value.isNotEmpty && value != 'null') {
          updatedList.add(value);
        }
      } catch (e) {
        // Skip if field doesn't exist.
      }
    }
  }

  return updatedList;

  return updatedList;
  // List<String> updatedList = ['ALL']; // Line 13: Initialize list with 'ALL'
  // updatedList.addAll(inputList); // Line 14: Append the Firebase categories
  // return updatedList;
}

String? formatRacePosition(String? dbPosition) {
  return (dbPosition == null || dbPosition == 0)
      ? '-'
      : switch (dbPosition) {
          -1 => 'DNF',
          -2 => 'DQ',
          -3 => 'DNS',
          -4 => 'X',
          _ => dbPosition.toString(),
        };
}

bool? isPDF(FFUploadedFile? uploadedFile) {
  return uploadedFile?.name?.toLowerCase().endsWith('.pdf');
}

bool isUrlPDF(String? inputUrlString) {
  return inputUrlString!.toLowerCase().contains('.pdf');
}

String? calculateMinimumWeight(
  String categoryName,
  String cubicCapacity,
  bool? isTurbo,
) {
  // Returns e.g. "840 Kg" or "1758.62 Kg".
  // Returns null when the weight can't be worked out (unknown category,
  // empty CC, or CC out of range), so no junk text is saved.

  if (categoryName == null || categoryName.trim().isEmpty) return null;

  // CC from the TextField as text, e.g. "1598" or "1,598 cc"
  final double? cc =
      double.tryParse((cubicCapacity ?? '').replaceAll(RegExp(r'[^0-9.]'), ''));

  final bool turbo = isTurbo ?? false;

  // Normalise the FULL name: lowercase, letters & digits only.
  // "JK Tyre Levitas Cup - Media Category" -> "jktyrelevitascupmediacategory"
  // "LGB_F4" / "LGB F4" / "LGB-F4"          -> "lgbf4"
  final String name =
      categoryName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  // ---- Exact full-name / code lookup (no partial matching) ----
  const Map<String, String> categoryMap = {
    // JK Tyre Levitas Cup -> 840 Kg
    'jktyrelevitascupmediacategory': 'LEVITAS',
    'jktyrelevitascupgentlemancategory': 'LEVITAS',
    'jktyrelevitascuprookiecategory': 'LEVITAS',
    'jktyrelevitascup': 'LEVITAS',
    'levitas': 'LEVITAS',

    // Formula LGB F4 -> 535 Kg
    'lgbf4': 'LGB_F4',
    'formulalgbf4': 'LGB_F4',
    'formulalgbf4rookie': 'LGB_F4',
    'formulalbgf4rookie': 'LGB_F4', // spelling as given ("LBG")

    // F1300 Novice Cup -> 530 Kg
    'f1300': 'F1300',
    'f1300novicecup': 'F1300',

    // Indian Super Touring Cars -> table
    'istc': 'ISTC',
    'ist': 'ISTC',
    'indiansupertouringcars': 'ISTC',
    'indiansupertouringcarsistc': 'ISTC',

    // Indian Touring Cars -> CC / 1.55
    'itc': 'ITC',
    'indiantouringcars': 'ITC',
    'indiantouringcarsitc': 'ITC',

    // Indian Junior Touring Cars -> CC / 1.65
    'ijtc': 'IJTC',
    'indianjuniortouringcars': 'IJTC',
    'indianjuniortouringcarsijtc': 'IJTC',

    // Super Stock -> NA: CC / 1.5, Turbo: CC x 1.7 / 1.45
    'ss': 'SUPER_STOCK',
    'superstock': 'SUPER_STOCK',
    'superstockss': 'SUPER_STOCK',
  };

  final String? category = categoryMap[name];
  if (category == null) return null; // Unknown category

  // ---- Fixed-weight categories (CC not needed) ----
  if (category == 'LEVITAS') return '840 Kg';
  if (category == 'LGB_F4') return '535 Kg';
  if (category == 'F1300') return '530 Kg';

  // ---- CC-based categories ----
  if (cc == null || cc <= 0) return null;

  double result;

  switch (category) {
    case 'ISTC':
      // [upper CC limit, minimum weight]
      final List<List<double>> naTable = [
        [1389, 880],
        [1609, 930],
        [2009, 980],
        [2409, 1030],
        [2809, 1080],
        [3210, 1130],
      ];
      final List<List<double>> turboTable = [
        [926, 930],
        [1072, 980],
        [1339, 1030],
        [1606, 1080],
        [1873, 1130],
        [2140, 1180],
      ];
      final List<List<double>> table = turbo ? turboTable : naTable;
      for (final List<double> row in table) {
        if (cc <= row[0]) {
          return '${row[1].toInt()} Kg';
        }
      }
      return null; // CC above max allowed

    case 'ITC':
      result = cc / 1.55;
      break;

    case 'IJTC':
      result = cc / 1.65;
      break;

    case 'SUPER_STOCK':
      result = turbo ? (cc * 1.7) / 1.45 : cc / 1.5;
      break;

    default:
      return null;
  }

  // 2 decimal places, e.g. "1758.62 Kg"
  return '${result.toStringAsFixed(2)} Kg';
}
