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

List<bool>? upDatePageStatesAction(
  String sealingId,
  List<KsKartingChecksDataRow>? inputSupabaseRows,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // 1. Handle empty states to prevent null errors
  if (inputSupabaseRows == null || inputSupabaseRows.isEmpty) {
    return [false, false, false, false, false, false, false];
  }

  // 2. Filter the passed rows by sealingId directly in memory
  // Note: FlutterFlow generates Supabase columns as camelCase properties
  final filteredRows =
      inputSupabaseRows.where((row) => row.sealingId == sealingId).toList();

  // 3. Helper function: checks if ALL required item codes are present and true
  bool checkTab(List<String> requiredCodes) {
    for (String code in requiredCodes) {
      // Look for at least one row matching the code where booleanValue is true
      final hasTrueRow = filteredRows
          .any((row) => row.itemCode == code && row.booleanValue == true);

      // If any required code is missing or false, the whole category fails
      if (!hasTrueRow) {
        return false;
      }
    }
    return true; // All required codes were found and are true
  }

  // 4. Evaluate each technical inspection category
  bool psCrankCase = checkTab(['T.1.1', 'T.1.2', 'T.1.3']);
  bool psBalanceShaft = checkTab(['T.2.1', 'T.2.2', 'T.2.3']);
  bool psCrankShaft = checkTab(['T.3.1', 'T.3.2', 'T.3.3']);
  bool psPiston = checkTab(['T.4.1', 'T.4.2', 'T.4.3']);
  bool psCylinder = checkTab(['T.5.1', 'T.5.2', 'T.5.3']);
  bool psInletSystem = checkTab(['T.6.1', 'T.6.2', 'T.6.3']);
  bool psSquishGap = checkTab(['T.7.1', 'T.7.2', 'T.7.3']);

  // 5. Return the results as a List of booleans
  // Index mapping for when you update your Page States in the Action Flow:
  // [0]: psCrankCase
  // [1]: psBalanceShaft
  // [2]: psCrankShaft
  // [3]: psPiston
  // [4]: psCylinder
  // [5]: psInletSystem
  // [6]: psSquishGap
  return [
    psCrankCase,
    psBalanceShaft,
    psCrankShaft,
    psPiston,
    psCylinder,
    psInletSystem,
    psSquishGap
  ];

//
  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
