import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'of_entry_list_page_widget.dart' show OfEntryListPageWidget;
import 'package:flutter/material.dart';

class OfEntryListPageModel extends FlutterFlowModel<OfEntryListPageWidget> {
  ///  Local state fields for this page.

  String? psSelectedCategory = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for FilterDropDown widget.
  String? filterDropDownValue;
  FormFieldController<String>? filterDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
