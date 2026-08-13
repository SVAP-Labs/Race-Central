import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 're_seal_karting_component_widget.dart'
    show ReSealKartingComponentWidget;
import 'package:flutter/material.dart';

class ReSealKartingComponentModel
    extends FlutterFlowModel<ReSealKartingComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SealRadioButton widget.
  FormFieldController<String>? sealRadioButtonValueController;
  // State field(s) for eventName widget.
  String? eventNameValue;
  FormFieldController<String>? eventNameValueController;
  // State field(s) for roundNumber widget.
  String? roundNumberValue;
  FormFieldController<String>? roundNumberValueController;
  // State field(s) for year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;
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

    if (val.length < 6) {
      return 'Enter Engine Number';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (createUniqueNumber)] action in Button widget.
  ApiCallResponse? generatedUniqueNumber;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SealingRow? sealCutKartDocument;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SealingRow>? queriedSeadID;
  // Stores action output result for [Backend Call - API (createEmptyAndCopyKartingChecks)] action in Button widget.
  ApiCallResponse? apiEmptyReturnvalue;
  // Stores action output result for [Backend Call - API (createUniqueNumber)] action in Button widget.
  ApiCallResponse? generatedFCUniqueNumber;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SealingRow? fullCheckKartDocument;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SealingRow>? queriedFCSeadID;
  // Stores action output result for [Backend Call - API (createEmptyKartingCheck)] action in Button widget.
  ApiCallResponse? apiResultu4z;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get sealRadioButtonValue => sealRadioButtonValueController?.value;
}
