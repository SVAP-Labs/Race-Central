import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kart_scrutinycheck_widget.dart' show KartScrutinycheckWidget;
import 'package:flutter/material.dart';

class KartScrutinycheckModel extends FlutterFlowModel<KartScrutinycheckWidget> {
  ///  Local state fields for this page.

  String? psScruitneerSignature;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CCMake widget.
  FocusNode? cCMakeFocusNode;
  TextEditingController? cCMakeTextController;
  String? Function(BuildContext, String?)? cCMakeTextControllerValidator;
  String? _cCMakeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Chassis Make is Required.';
    }

    return null;
  }

  // State field(s) for CCNumber widget.
  FocusNode? cCNumberFocusNode;
  TextEditingController? cCNumberTextController;
  String? Function(BuildContext, String?)? cCNumberTextControllerValidator;
  String? _cCNumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Chassis Number is Required.';
    }

    return null;
  }

  // State field(s) for EngineNumber widget.
  FocusNode? engineNumberFocusNode;
  TextEditingController? engineNumberTextController;
  String? Function(BuildContext, String?)? engineNumberTextControllerValidator;
  String? _engineNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Engine Number is Required';
    }

    return null;
  }

  // State field(s) for EngineSealNo widget.
  FocusNode? engineSealNoFocusNode;
  TextEditingController? engineSealNoTextController;
  String? Function(BuildContext, String?)? engineSealNoTextControllerValidator;
  String? _engineSealNoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Engine Seal Number is Required';
    }

    return null;
  }

  // State field(s) for spareEngine widget.
  bool? spareEngineValue;
  // State field(s) for SpareEngineNo widget.
  FocusNode? spareEngineNoFocusNode;
  TextEditingController? spareEngineNoTextController;
  String? Function(BuildContext, String?)? spareEngineNoTextControllerValidator;
  // State field(s) for SpareEngSealNo widget.
  FocusNode? spareEngSealNoFocusNode;
  TextEditingController? spareEngSealNoTextController;
  String? Function(BuildContext, String?)?
      spareEngSealNoTextControllerValidator;
  // State field(s) for SpareKartNo widget.
  FocusNode? spareKartNoFocusNode;
  TextEditingController? spareKartNoTextController;
  String? Function(BuildContext, String?)? spareKartNoTextControllerValidator;
  // State field(s) for Ballast widget.
  bool? ballastValue;
  // State field(s) for BallastWeight widget.
  FocusNode? ballastWeightFocusNode;
  TextEditingController? ballastWeightTextController;
  String? Function(BuildContext, String?)? ballastWeightTextControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for chkChassis widget.
  bool? chkChassisValue;
  // State field(s) for chkAxles widget.
  bool? chkAxlesValue;
  // State field(s) for chkWheels widget.
  bool? chkWheelsValue;
  // State field(s) for chkSteering widget.
  bool? chkSteeringValue;
  // State field(s) for chkSeatFit widget.
  bool? chkSeatFitValue;
  // State field(s) for chkBodyWork widget.
  bool? chkBodyWorkValue;
  // State field(s) for chkBumperFront widget.
  bool? chkBumperFrontValue;
  // State field(s) for chkExhaust widget.
  bool? chkExhaustValue;
  // State field(s) for chkCarburetor widget.
  bool? chkCarburetorValue;
  // State field(s) for chkBattery widget.
  bool? chkBatteryValue;
  // State field(s) for chkKillSwitch widget.
  bool? chkKillSwitchValue;
  // State field(s) for chkRacingNos widget.
  bool? chkRacingNosValue;
  // State field(s) for chkFuelLines widget.
  bool? chkFuelLinesValue;
  // State field(s) for chkTransponder widget.
  bool? chkTransponderValue;
  // State field(s) for chkChainGuard widget.
  bool? chkChainGuardValue;
  // State field(s) for chkBallast widget.
  bool? chkBallastValue;
  // State field(s) for chkSeatMount widget.
  bool? chkSeatMountValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for CommentsTextField widget.
  FocusNode? commentsTextFieldFocusNode;
  TextEditingController? commentsTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentsTextFieldTextControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedSignatureCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KartScrutinyCheckRow>? aOVScruitneerUpdate;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventRegistrationsRow>? queriedKartScrutineerOKNOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? aOFinalOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? aOFinalNOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KartScrutinyCheckRow>? aOVDriverUpdate;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? kartFormValidate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KartScrutinyCheckRow>? aOVDriverUpdateSave;

  @override
  void initState(BuildContext context) {
    cCMakeTextControllerValidator = _cCMakeTextControllerValidator;
    cCNumberTextControllerValidator = _cCNumberTextControllerValidator;
    engineNumberTextControllerValidator = _engineNumberTextControllerValidator;
    engineSealNoTextControllerValidator = _engineSealNoTextControllerValidator;
  }

  @override
  void dispose() {
    cCMakeFocusNode?.dispose();
    cCMakeTextController?.dispose();

    cCNumberFocusNode?.dispose();
    cCNumberTextController?.dispose();

    engineNumberFocusNode?.dispose();
    engineNumberTextController?.dispose();

    engineSealNoFocusNode?.dispose();
    engineSealNoTextController?.dispose();

    spareEngineNoFocusNode?.dispose();
    spareEngineNoTextController?.dispose();

    spareEngSealNoFocusNode?.dispose();
    spareEngSealNoTextController?.dispose();

    spareKartNoFocusNode?.dispose();
    spareKartNoTextController?.dispose();

    ballastWeightFocusNode?.dispose();
    ballastWeightTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController9?.dispose();

    textFieldFocusNode2?.dispose();
    textController10?.dispose();

    commentsTextFieldFocusNode?.dispose();
    commentsTextFieldTextController?.dispose();
  }
}
