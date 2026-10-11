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
import 'package:cloud_firestore/cloud_firestore.dart';
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
