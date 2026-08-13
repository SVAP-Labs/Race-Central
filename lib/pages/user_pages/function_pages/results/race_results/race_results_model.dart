import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'race_results_widget.dart' show RaceResultsWidget;
import 'package:flutter/material.dart';

class RaceResultsModel extends FlutterFlowModel<RaceResultsWidget> {
  ///  Local state fields for this page.

  List<RaceResultsRow> psResultsFetchec = [];
  void addToPsResultsFetchec(RaceResultsRow item) => psResultsFetchec.add(item);
  void removeFromPsResultsFetchec(RaceResultsRow item) =>
      psResultsFetchec.remove(item);
  void removeAtIndexFromPsResultsFetchec(int index) =>
      psResultsFetchec.removeAt(index);
  void insertAtIndexInPsResultsFetchec(int index, RaceResultsRow item) =>
      psResultsFetchec.insert(index, item);
  void updatePsResultsFetchecAtIndex(
          int index, Function(RaceResultsRow) updateFn) =>
      psResultsFetchec[index] = updateFn(psResultsFetchec[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CategoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for RaceDropdown widget.
  String? raceDropdownValue;
  FormFieldController<String>? raceDropdownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<EventRacesRow>? quereidRaceID;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<RaceResultsRow>? fetchedResults;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
