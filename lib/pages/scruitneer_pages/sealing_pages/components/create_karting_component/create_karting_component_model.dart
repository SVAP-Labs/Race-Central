import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_karting_component_widget.dart' show CreateKartingComponentWidget;
import 'package:flutter/material.dart';

class CreateKartingComponentModel
    extends FlutterFlowModel<CreateKartingComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for eventName widget.
  String? eventNameValue;
  FormFieldController<String>? eventNameValueController;
  // State field(s) for roundNumber widget.
  String? roundNumberValue;
  FormFieldController<String>? roundNumberValueController;
  // State field(s) for year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;
  // State field(s) for category widget.
  KSKartingCategory? categoryValue;
  FormFieldController<KSKartingCategory>? categoryValueController;
  // State field(s) for teamNameDropDown widget.
  String? teamNameDropDownValue;
  FormFieldController<String>? teamNameDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g. ENG-2024-XXXXXX is required';
    }

    if (val.length < 7) {
      return 'Enter Engine Number';
    }
    if (val.length > 7) {
      return 'Maximum 7 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SealingRow? createdKartDocument;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SealingRow>? queriedSeadID;
  // Stores action output result for [Backend Call - API (createEmptyKartingCheck)] action in Button widget.
  ApiCallResponse? apiEmptyReturnvalue;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
