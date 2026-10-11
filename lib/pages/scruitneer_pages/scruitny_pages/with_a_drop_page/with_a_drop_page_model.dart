import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'with_a_drop_page_widget.dart' show WithADropPageWidget;
import 'package:flutter/material.dart';

class WithADropPageModel extends FlutterFlowModel<WithADropPageWidget> {
  ///  Local state fields for this page.

  bool? psDriver;

  bool? psKart;

  String? psSelectedTeam;

  bool? psSelectedStatus;

  String? psCategory;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TeamDropdown widget.
  String? teamDropdownValue;
  FormFieldController<String>? teamDropdownValueController;
  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // State field(s) for statusDropdown widget.
  String? statusDropdownValue;
  FormFieldController<String>? statusDropdownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChampionshipCategoriesRow>? queriedEventCategory;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChampionshipCategoriesRow>? queriedEventCategoryVheicle;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
