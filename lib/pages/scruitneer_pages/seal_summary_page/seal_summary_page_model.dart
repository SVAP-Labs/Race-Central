import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'seal_summary_page_widget.dart' show SealSummaryPageWidget;
import 'package:flutter/material.dart';

class SealSummaryPageModel extends FlutterFlowModel<SealSummaryPageWidget> {
  ///  Local state fields for this page.

  bool? psVisible = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for eventDrop widget.
  String? eventDropValue;
  FormFieldController<String>? eventDropValueController;
  // State field(s) for roundDrop widget.
  String? roundDropValue;
  FormFieldController<String>? roundDropValueController;
  // State field(s) for yearDrop widget.
  String? yearDropValue;
  FormFieldController<String>? yearDropValueController;
  // Stores action output result for [Backend Call - API (noOfSealPerTeam)] action in IconButton widget.
  ApiCallResponse? apiResult1l7;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<SealingRow>? queriedDetailedSealList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
