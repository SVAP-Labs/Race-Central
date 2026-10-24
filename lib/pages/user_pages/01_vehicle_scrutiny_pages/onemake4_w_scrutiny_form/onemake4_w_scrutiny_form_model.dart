import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'onemake4_w_scrutiny_form_widget.dart' show Onemake4WScrutinyFormWidget;
import 'package:flutter/material.dart';

class Onemake4WScrutinyFormModel
    extends FlutterFlowModel<Onemake4WScrutinyFormWidget> {
  ///  Local state fields for this page.

  String? psScruitneerSignature;

  String? psMinimumVehicleWeight;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getallowedCarsinCategory)] action in onemake4WScrutinyForm widget.
  ApiCallResponse? queriedCarsCollection;
  // State field(s) for make_model widget.
  FocusNode? makeModelFocusNode;
  TextEditingController? makeModelTextController;
  String? Function(BuildContext, String?)? makeModelTextControllerValidator;
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

  // State field(s) for cubicCapacity widget.
  FocusNode? cubicCapacityFocusNode;
  TextEditingController? cubicCapacityTextController;
  String? Function(BuildContext, String?)? cubicCapacityTextControllerValidator;
  String? _cubicCapacityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cubic Capacity is required';
    }

    return null;
  }

  // State field(s) for minimumweight widget.
  FocusNode? minimumweightFocusNode;
  TextEditingController? minimumweightTextController;
  String? Function(BuildContext, String?)? minimumweightTextControllerValidator;
  // State field(s) for Turbo widget.
  bool? turboValue;
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
  // State field(s) for TurboSealNumber widget.
  FocusNode? turboSealNumberFocusNode;
  TextEditingController? turboSealNumberTextController;
  String? Function(BuildContext, String?)?
      turboSealNumberTextControllerValidator;
  // State field(s) for GeraBoxSealNo widget.
  FocusNode? geraBoxSealNoFocusNode;
  TextEditingController? geraBoxSealNoTextController;
  String? Function(BuildContext, String?)? geraBoxSealNoTextControllerValidator;
  // State field(s) for Ballast widget.
  bool? ballastValue;
  // State field(s) for BallastWeight widget.
  FocusNode? ballastWeightFocusNode;
  TextEditingController? ballastWeightTextController;
  String? Function(BuildContext, String?)? ballastWeightTextControllerValidator;
  // State field(s) for seatStandard widget.
  String? seatStandardValue;
  FormFieldController<String>? seatStandardValueController;
  // State field(s) for SeatSerialNo widget.
  FocusNode? seatSerialNoFocusNode;
  TextEditingController? seatSerialNoTextController;
  String? Function(BuildContext, String?)? seatSerialNoTextControllerValidator;
  // State field(s) for seatbeltStandard widget.
  String? seatbeltStandardValue;
  FormFieldController<String>? seatbeltStandardValueController;
  // State field(s) for SeatbeltSerialNo widget.
  FocusNode? seatbeltSerialNoFocusNode;
  TextEditingController? seatbeltSerialNoTextController;
  String? Function(BuildContext, String?)?
      seatbeltSerialNoTextControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for chkRearViewmirrors widget.
  bool? chkRearViewmirrorsValue;
  // State field(s) for chkCompNos widget.
  bool? chkCompNosValue;
  // State field(s) for chkNameAxles widget.
  bool? chkNameAxlesValue;
  // State field(s) for chkemgyStickWheels widget.
  bool? chkemgyStickWheelsValue;
  // State field(s) for chkAdverStickSteer widget.
  bool? chkAdverStickSteerValue;
  // State field(s) for chkSeatFit widget.
  bool? chkSeatFitValue;
  // State field(s) for chkSeatMount widget.
  bool? chkSeatMountValue;
  // State field(s) for chkRollbarBodyWork widget.
  bool? chkRollbarBodyWorkValue;
  // State field(s) for chk2clearBumperFront widget.
  bool? chk2clearBumperFrontValue;
  // State field(s) for chk_starter_Exhaust widget.
  bool? chkStarterExhaustValue;
  // State field(s) for chk_windowlassCarburetor widget.
  bool? chkWindowlassCarburetorValue;
  // State field(s) for chkBattery widget.
  bool? chkBatteryValue;
  // State field(s) for chkFuelLines widget.
  bool? chkFuelLinesValue;
  // State field(s) for chk_oilcan_ChainGuard widget.
  bool? chkOilcanChainGuardValue;
  // State field(s) for chkBallast widget.
  bool? chkBallastValue;
  // State field(s) for chkKillSwitch widget.
  bool? chkKillSwitchValue;
  // State field(s) for chkwindscreenwash widget.
  bool? chkwindscreenwashValue;
  // State field(s) for chkwindscreenlamina widget.
  bool? chkwindscreenlaminaValue;
  // State field(s) for chktoweye widget.
  bool? chktoweyeValue;
  // State field(s) for chkdriverdoor widget.
  bool? chkdriverdoorValue;
  // State field(s) for chkfirewallbulkhead widget.
  bool? chkfirewallbulkheadValue;
  // State field(s) for chkfireextfix widget.
  bool? chkfireextfixValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for CommentsTextField widget.
  FocusNode? commentsTextFieldFocusNode;
  TextEditingController? commentsTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentsTextFieldTextControllerValidator;
  // State field(s) for ScrutinyOK widget.
  bool? scrutinyOKValue;
  // Stores action output result for [Bottom Sheet - signatureComponent] action in Container widget.
  String? returnedSignatureCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveScrutinyCheck widget.
  List<KartScrutinyCheckRow>? aOVScruitneerUpdateExhaust;
  // Stores action output result for [Backend Call - Query Rows] action in SaveScrutinyCheck widget.
  List<EventRegistrationsRow>? queriedKartScrutineerOKNOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveScrutinyCheck widget.
  List<EventRegistrationsRow>? aOFinalOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveScrutinyCheck widget.
  List<EventRegistrationsRow>? aOFinalNOK;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KartScrutinyCheckRow>? aOVDriverUpdateExhaust;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? kartFormValidate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KartScrutinyCheckRow>? aOVDriverUpdateSaveExhaust;

  @override
  void initState(BuildContext context) {
    cCNumberTextControllerValidator = _cCNumberTextControllerValidator;
    cubicCapacityTextControllerValidator =
        _cubicCapacityTextControllerValidator;
    engineNumberTextControllerValidator = _engineNumberTextControllerValidator;
  }

  @override
  void dispose() {
    makeModelFocusNode?.dispose();
    makeModelTextController?.dispose();

    cCNumberFocusNode?.dispose();
    cCNumberTextController?.dispose();

    cubicCapacityFocusNode?.dispose();
    cubicCapacityTextController?.dispose();

    minimumweightFocusNode?.dispose();
    minimumweightTextController?.dispose();

    engineNumberFocusNode?.dispose();
    engineNumberTextController?.dispose();

    engineSealNoFocusNode?.dispose();
    engineSealNoTextController?.dispose();

    turboSealNumberFocusNode?.dispose();
    turboSealNumberTextController?.dispose();

    geraBoxSealNoFocusNode?.dispose();
    geraBoxSealNoTextController?.dispose();

    ballastWeightFocusNode?.dispose();
    ballastWeightTextController?.dispose();

    seatSerialNoFocusNode?.dispose();
    seatSerialNoTextController?.dispose();

    seatbeltSerialNoFocusNode?.dispose();
    seatbeltSerialNoTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController12?.dispose();

    textFieldFocusNode2?.dispose();
    textController13?.dispose();

    commentsTextFieldFocusNode?.dispose();
    commentsTextFieldTextController?.dispose();
  }
}
