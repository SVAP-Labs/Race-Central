import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'driver_scrutinycheck_widget.dart' show DriverScrutinycheckWidget;
import 'package:flutter/material.dart';

class DriverScrutinycheckModel
    extends FlutterFlowModel<DriverScrutinycheckWidget> {
  ///  Local state fields for this page.

  String? psSignature;

  int? psDriverAge;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in driverScrutinycheck widget.
  List<EventRegistrationsRow>? eventRegRow;
  // Stores action output result for [Backend Call - Query Rows] action in driverScrutinycheck widget.
  List<AppUsersRow>? appUserAge;
  // State field(s) for competitionNumber widget.
  FocusNode? competitionNumberFocusNode;
  TextEditingController? competitionNumberTextController;
  String? Function(BuildContext, String?)?
      competitionNumberTextControllerValidator;
  // State field(s) for HelmetCheckbox widget.
  bool? helmetCheckboxValue;
  // State field(s) for helmetStandardU15 widget.
  String? helmetStandardU15Value;
  FormFieldController<String>? helmetStandardU15ValueController;
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

  // State field(s) for OverallsCheckbox widget.
  bool? overallsCheckboxValue;
  // State field(s) for overallsStandard widget.
  String? overallsStandardValue;
  FormFieldController<String>? overallsStandardValueController;
  // State field(s) for overallsSerialNumber widget.
  FocusNode? overallsSerialNumberFocusNode;
  TextEditingController? overallsSerialNumberTextController;
  String? Function(BuildContext, String?)?
      overallsSerialNumberTextControllerValidator;
  String? _overallsSerialNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Overalls Serial Number is Required';
    }

    return null;
  }

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
  // State field(s) for bodyProtectCheckbox widget.
  bool? bodyProtectCheckboxValue;
  // State field(s) for bodyProtStandard widget.
  String? bodyProtStandardValue;
  FormFieldController<String>? bodyProtStandardValueController;
  // State field(s) for bodyProtSerialNumber widget.
  FocusNode? bodyProtSerialNumberFocusNode;
  TextEditingController? bodyProtSerialNumberTextController;
  String? Function(BuildContext, String?)?
      bodyProtSerialNumberTextControllerValidator;
  String? _bodyProtSerialNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Body Protection Number is Required.';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedSignatureCopy;
  // State field(s) for scrutineerName widget.
  FocusNode? scrutineerNameFocusNode;
  TextEditingController? scrutineerNameTextController;
  String? Function(BuildContext, String?)?
      scrutineerNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
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
  List<DriverScrutinyRow>? aOVDriverScrUpdate;
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
    overallsSerialNumberTextControllerValidator =
        _overallsSerialNumberTextControllerValidator;
    bodyProtSerialNumberTextControllerValidator =
        _bodyProtSerialNumberTextControllerValidator;
  }

  @override
  void dispose() {
    competitionNumberFocusNode?.dispose();
    competitionNumberTextController?.dispose();

    helmetSerialNumberFocusNode?.dispose();
    helmetSerialNumberTextController?.dispose();

    overallsSerialNumberFocusNode?.dispose();
    overallsSerialNumberTextController?.dispose();

    bodyProtSerialNumberFocusNode?.dispose();
    bodyProtSerialNumberTextController?.dispose();

    scrutineerNameFocusNode?.dispose();
    scrutineerNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();

    remarksTextFieldFocusNode?.dispose();
    remarksTextFieldTextController?.dispose();
  }
}
