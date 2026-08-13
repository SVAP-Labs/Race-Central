import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'sporting_s_o_m_widget.dart' show SportingSOMWidget;
import 'package:flutter/material.dart';

class SportingSOMModel extends FlutterFlowModel<SportingSOMWidget> {
  ///  Local state fields for this page.

  String? psSelectedTeam;

  String? psSelectedCategory;

  String? psApprovedSelectedTeam;

  String? psApprovedSelectedCatgory;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ApprovedTeamDropdown widget.
  String? approvedTeamDropdownValue;
  FormFieldController<String>? approvedTeamDropdownValueController;
  // State field(s) for ApprovedCategoryDropdown widget.
  String? approvedCategoryDropdownValue;
  FormFieldController<String>? approvedCategoryDropdownValueController;
  Completer<List<EventRegistrationsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
