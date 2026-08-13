import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'engine_seal_page_widget.dart' show EngineSealPageWidget;
import 'package:flutter/material.dart';

class EngineSealPageModel extends FlutterFlowModel<EngineSealPageWidget> {
  ///  Local state fields for this page.

  String? psRepSign;

  String? psScruitneerSignature;

  DateTime? psSelectedDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in engineSealPage widget.
  List<SealingRow>? sealingIDQueried;
  // State field(s) for seal_1 widget.
  FocusNode? seal1FocusNode;
  TextEditingController? seal1TextController;
  String? Function(BuildContext, String?)? seal1TextControllerValidator;
  String? _seal1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Rotax Seal Number';
    }

    if (val.length < 6) {
      return 'Minimum Six Digits Required !';
    }

    return null;
  }

  // State field(s) for seal_2 widget.
  FocusNode? seal2FocusNode;
  TextEditingController? seal2TextController;
  String? Function(BuildContext, String?)? seal2TextControllerValidator;
  String? _seal2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Meco Seal  1';
    }

    if (val.length < 4) {
      return 'Minimum Four Digits Required !';
    }

    return null;
  }

  // State field(s) for seal_3 widget.
  FocusNode? seal3FocusNode;
  TextEditingController? seal3TextController;
  String? Function(BuildContext, String?)? seal3TextControllerValidator;
  String? _seal3TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Meco Seal  1';
    }

    if (val.length < 4) {
      return 'Minimum Four Digits Required !';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading_uploadDataIdCard = false;
  FFUploadedFile uploadedLocalFile_uploadDataIdCard =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TeamRepTextField widget.
  final teamRepTextFieldKey = GlobalKey();
  FocusNode? teamRepTextFieldFocusNode;
  TextEditingController? teamRepTextFieldTextController;
  String? teamRepTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      teamRepTextFieldTextControllerValidator;
  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedSignatureCopy;
  // State field(s) for scruitneerDropDown widget.
  String? scruitneerDropDownValue;
  FormFieldController<String>? scruitneerDropDownValueController;
  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedScruitneerSignature;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? sealFormValidator;
  bool isDataUploading_uploadDataSeal = false;
  FFUploadedFile uploadedLocalFile_uploadDataSeal =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataSeal = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? queriedSealKartRow;

  @override
  void initState(BuildContext context) {
    seal1TextControllerValidator = _seal1TextControllerValidator;
    seal2TextControllerValidator = _seal2TextControllerValidator;
    seal3TextControllerValidator = _seal3TextControllerValidator;
  }

  @override
  void dispose() {
    seal1FocusNode?.dispose();
    seal1TextController?.dispose();

    seal2FocusNode?.dispose();
    seal2TextController?.dispose();

    seal3FocusNode?.dispose();
    seal3TextController?.dispose();

    teamRepTextFieldFocusNode?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
