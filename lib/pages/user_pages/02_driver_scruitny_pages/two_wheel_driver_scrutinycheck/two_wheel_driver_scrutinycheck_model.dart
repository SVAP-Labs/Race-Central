import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'two_wheel_driver_scrutinycheck_widget.dart'
    show TwoWheelDriverScrutinycheckWidget;
import 'package:flutter/material.dart';

class TwoWheelDriverScrutinycheckModel
    extends FlutterFlowModel<TwoWheelDriverScrutinycheckWidget> {
  ///  Local state fields for this page.

  String? psSignature;

  int? psDriverAge;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in twoWheel_driverScrutinycheck widget.
  List<EventRegistrationsRow>? eventRegRow;
  // Stores action output result for [Backend Call - Query Rows] action in twoWheel_driverScrutinycheck widget.
  List<AppUsersRow>? appUserAge;
  // State field(s) for HelmetCheckbox widget.
  bool? helmetCheckboxValue;
  // State field(s) for helmetStandard widget.
  FocusNode? helmetStandardFocusNode;
  TextEditingController? helmetStandardTextController;
  String? Function(BuildContext, String?)?
      helmetStandardTextControllerValidator;
  // State field(s) for helmetSerialNumber widget.
  FocusNode? helmetSerialNumberFocusNode;
  TextEditingController? helmetSerialNumberTextController;
  String? Function(BuildContext, String?)?
      helmetSerialNumberTextControllerValidator;
  // State field(s) for fhrbodyProtectCheckbox widget.
  bool? fhrbodyProtectCheckboxValue;
  // State field(s) for fhrStandard widget.
  FocusNode? fhrStandardFocusNode;
  TextEditingController? fhrStandardTextController;
  String? Function(BuildContext, String?)? fhrStandardTextControllerValidator;
  // State field(s) for fhrSerialNumber widget.
  FocusNode? fhrSerialNumberFocusNode;
  TextEditingController? fhrSerialNumberTextController;
  String? Function(BuildContext, String?)?
      fhrSerialNumberTextControllerValidator;
  // State field(s) for OverallsCheckbox widget.
  bool? overallsCheckboxValue;
  // State field(s) for overallProtStandard widget.
  FocusNode? overallProtStandardFocusNode;
  TextEditingController? overallProtStandardTextController;
  String? Function(BuildContext, String?)?
      overallProtStandardTextControllerValidator;
  // State field(s) for overallProtSerialNumber widget.
  FocusNode? overallProtSerialNumberFocusNode;
  TextEditingController? overallProtSerialNumberTextController;
  String? Function(BuildContext, String?)?
      overallProtSerialNumberTextControllerValidator;
  // State field(s) for glovesCheckbox widget.
  bool? glovesCheckboxValue;
  // State field(s) for glovesStandard widget.
  FocusNode? glovesStandardFocusNode;
  TextEditingController? glovesStandardTextController;
  String? Function(BuildContext, String?)?
      glovesStandardTextControllerValidator;
  // State field(s) for shoesCheckbox widget.
  bool? shoesCheckboxValue;
  // State field(s) for shoesStandard widget.
  FocusNode? shoesStandardFocusNode;
  TextEditingController? shoesStandardTextController;
  String? Function(BuildContext, String?)? shoesStandardTextControllerValidator;
  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedSignatureCopy;
  // State field(s) for scrutineerName widget.
  FocusNode? scrutineerNameFocusNode;
  TextEditingController? scrutineerNameTextController;
  String? Function(BuildContext, String?)?
      scrutineerNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    helmetStandardFocusNode?.dispose();
    helmetStandardTextController?.dispose();

    helmetSerialNumberFocusNode?.dispose();
    helmetSerialNumberTextController?.dispose();

    fhrStandardFocusNode?.dispose();
    fhrStandardTextController?.dispose();

    fhrSerialNumberFocusNode?.dispose();
    fhrSerialNumberTextController?.dispose();

    overallProtStandardFocusNode?.dispose();
    overallProtStandardTextController?.dispose();

    overallProtSerialNumberFocusNode?.dispose();
    overallProtSerialNumberTextController?.dispose();

    glovesStandardFocusNode?.dispose();
    glovesStandardTextController?.dispose();

    shoesStandardFocusNode?.dispose();
    shoesStandardTextController?.dispose();

    scrutineerNameFocusNode?.dispose();
    scrutineerNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController10?.dispose();

    remarksTextFieldFocusNode?.dispose();
    remarksTextFieldTextController?.dispose();
  }
}
