import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'adult_driver_scrutinycheck_widget.dart'
    show AdultDriverScrutinycheckWidget;
import 'package:flutter/material.dart';

class AdultDriverScrutinycheckModel
    extends FlutterFlowModel<AdultDriverScrutinycheckWidget> {
  ///  Local state fields for this page.

  String? psSignature;

  int? psDriverAge;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in adult_driverScrutinycheck widget.
  List<EventRegistrationsRow>? eventRegRow;
  // Stores action output result for [Backend Call - Query Rows] action in adult_driverScrutinycheck widget.
  List<AppUsersRow>? appUserAge;
  // State field(s) for HelmetCheckbox widget.
  bool? helmetCheckboxValue;
  // State field(s) for helmetStandard widget.
  String? helmetStandardValue;
  FormFieldController<String>? helmetStandardValueController;
  // State field(s) for helmetSerialNumber widget.
  FocusNode? helmetSerialNumberFocusNode;
  TextEditingController? helmetSerialNumberTextController;
  String? Function(BuildContext, String?)?
      helmetSerialNumberTextControllerValidator;
  String? _helmetSerialNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Helmet Serial Number is Required';
    }

    return null;
  }

  // State field(s) for fhrbodyProtectCheckbox widget.
  bool? fhrbodyProtectCheckboxValue;
  // State field(s) for fhrStandard widget.
  String? fhrStandardValue;
  FormFieldController<String>? fhrStandardValueController;
  // State field(s) for fhrSerialNumber widget.
  FocusNode? fhrSerialNumberFocusNode;
  TextEditingController? fhrSerialNumberTextController;
  String? Function(BuildContext, String?)?
      fhrSerialNumberTextControllerValidator;
  String? _fhrSerialNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'FHR Serial Number is Required';
    }

    return null;
  }

  // State field(s) for OverallsCheckbox widget.
  bool? overallsCheckboxValue;
  // State field(s) for overallProtStandard widget.
  String? overallProtStandardValue;
  FormFieldController<String>? overallProtStandardValueController;
  // State field(s) for overallProtSerialNumber widget.
  FocusNode? overallProtSerialNumberFocusNode;
  TextEditingController? overallProtSerialNumberTextController;
  String? Function(BuildContext, String?)?
      overallProtSerialNumberTextControllerValidator;
  String? _overallProtSerialNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Body Protection Number is Required.';
    }

    return null;
  }

  // State field(s) for balaclavaStandard widget.
  String? balaclavaStandardValue;
  FormFieldController<String>? balaclavaStandardValueController;
  // State field(s) for undergarmentsStandard widget.
  String? undergarmentsStandardValue;
  FormFieldController<String>? undergarmentsStandardValueController;
  // State field(s) for glovesCheckbox widget.
  bool? glovesCheckboxValue;
  // State field(s) for glovesStandard widget.
  String? glovesStandardValue;
  FormFieldController<String>? glovesStandardValueController;
  // State field(s) for shoesCheckbox widget.
  bool? shoesCheckboxValue;
  // State field(s) for shoesStandard widget.
  String? shoesStandardValue;
  FormFieldController<String>? shoesStandardValueController;
  // State field(s) for socksStandard widget.
  String? socksStandardValue;
  FormFieldController<String>? socksStandardValueController;
  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedSignatureCopy;
  // State field(s) for scrutineerName widget.
  FocusNode? scrutineerNameFocusNode;
  TextEditingController? scrutineerNameTextController;
  String? Function(BuildContext, String?)?
      scrutineerNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for RemarksTextField widget.
  FocusNode? remarksTextFieldFocusNode;
  TextEditingController? remarksTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarksTextFieldTextControllerValidator;
  // State field(s) for WorkSwitchListTile widget.
  bool? workSwitchListTileValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<DriverScrutinyRow>? aOVDriverScrSave;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<DriverScrutinyRow>? aOVDriverScrSubmit;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<DriverScrutinyRow>? aOVScruitneerApproval;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? aOVDriverOK;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventRegistrationsRow>? queriedOKNOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? aOFinalOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? aOFinalNOK;

  @override
  void initState(BuildContext context) {
    helmetSerialNumberTextControllerValidator =
        _helmetSerialNumberTextControllerValidator;
    fhrSerialNumberTextControllerValidator =
        _fhrSerialNumberTextControllerValidator;
    overallProtSerialNumberTextControllerValidator =
        _overallProtSerialNumberTextControllerValidator;
  }

  @override
  void dispose() {
    helmetSerialNumberFocusNode?.dispose();
    helmetSerialNumberTextController?.dispose();

    fhrSerialNumberFocusNode?.dispose();
    fhrSerialNumberTextController?.dispose();

    overallProtSerialNumberFocusNode?.dispose();
    overallProtSerialNumberTextController?.dispose();

    scrutineerNameFocusNode?.dispose();
    scrutineerNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();

    remarksTextFieldFocusNode?.dispose();
    remarksTextFieldTextController?.dispose();
  }
}
