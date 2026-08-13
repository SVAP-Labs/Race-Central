import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/scruitneer_pages/sealing_pages/components/seal_list/seal_list_widget.dart';
import '/index.dart';
import 'dart:async';
import 'karting_sealing_widget.dart' show KartingSealingWidget;
import 'package:flutter/material.dart';

class KartingSealingModel extends FlutterFlowModel<KartingSealingWidget> {
  ///  Local state fields for this page.

  bool? psCrankCase = false;

  bool psBalanceShaft = false;

  bool psCrankShaft = false;

  bool psPiston = false;

  bool psCylinder = false;

  bool psInletSystem = false;

  bool psSquishCap = false;

  bool? radioButtonT11;

  bool? radioButtonT24;

  bool? radioButtonT31;

  bool? radioButtonT61;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in kartingSealing widget.
  List<SealingRow>? queriedSealingRow;
  Completer<List<KsKartingChecksDataRow>>? requestCompleter;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for T_1_1 widget.
  bool? t11Value;
  // State field(s) for T_1_1_Remarks widget.
  FocusNode? t11RemarksFocusNode;
  TextEditingController? t11RemarksTextController;
  String? Function(BuildContext, String?)? t11RemarksTextControllerValidator;
  // State field(s) for T_1_2_hided widget.
  bool? t12HidedValue;
  // State field(s) for T_1_2_Remarks_hided widget.
  FocusNode? t12RemarksHidedFocusNode;
  TextEditingController? t12RemarksHidedTextController;
  String? Function(BuildContext, String?)?
      t12RemarksHidedTextControllerValidator;
  // State field(s) for T_1_2 widget.
  bool? t12Value;
  // State field(s) for T_1_2_Remarks widget.
  FocusNode? t12RemarksFocusNode;
  TextEditingController? t12RemarksTextController;
  String? Function(BuildContext, String?)? t12RemarksTextControllerValidator;
  // State field(s) for T_1_3 widget.
  bool? t13Value;
  // State field(s) for T_1_3_Remarks widget.
  FocusNode? t13RemarksFocusNode;
  TextEditingController? t13RemarksTextController;
  String? Function(BuildContext, String?)? t13RemarksTextControllerValidator;
  // State field(s) for T_1_4 widget.
  bool? t14Value;
  // State field(s) for T_1_4_Remarks widget.
  FocusNode? t14RemarksFocusNode;
  TextEditingController? t14RemarksTextController;
  String? Function(BuildContext, String?)? t14RemarksTextControllerValidator;
  // State field(s) for T_1_5 widget.
  bool? t15Value;
  // State field(s) for T_1_5RadioButton widget.
  FormFieldController<String>? t15RadioButtonValueController;
  // State field(s) for NotVisible widget.
  bool? notVisibleValue;
  // State field(s) for T_1_5_Remarks widget.
  FocusNode? t15RemarksFocusNode;
  TextEditingController? t15RemarksTextController;
  String? Function(BuildContext, String?)? t15RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSealindIDRowsT11;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSealindIDRowsT12;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSealindIDRowsT13;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSealindIDRowsT14;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSealindIDRowsT15;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVpsCrankCase;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVpsCrankCaseFailed;
  // State field(s) for T_2_1 widget.
  bool? t21Value;
  // State field(s) for T_2_1_Remarks widget.
  FocusNode? t21RemarksFocusNode;
  TextEditingController? t21RemarksTextController;
  String? Function(BuildContext, String?)? t21RemarksTextControllerValidator;
  // State field(s) for T_2_2 widget.
  bool? t22Value;
  // State field(s) for T_2_2_Remarks widget.
  FocusNode? t22RemarksFocusNode;
  TextEditingController? t22RemarksTextController;
  String? Function(BuildContext, String?)? t22RemarksTextControllerValidator;
  // State field(s) for T_2_3 widget.
  bool? t23Value;
  // State field(s) for t_2_3_DropDown widget.
  String? t23DropDownValue;
  FormFieldController<String>? t23DropDownValueController;
  // State field(s) for T_2_3_Remarks widget.
  FocusNode? t23RemarksFocusNode;
  TextEditingController? t23RemarksTextController;
  String? Function(BuildContext, String?)? t23RemarksTextControllerValidator;
  // State field(s) for T_2_4 widget.
  bool? t24Value;
  // State field(s) for t_2_4_RadioButton widget.
  FormFieldController<String>? t24RadioButtonValueController;
  // State field(s) for T_2_4_Remarks widget.
  FocusNode? t24RemarksFocusNode;
  TextEditingController? t24RemarksTextController;
  String? Function(BuildContext, String?)? t24RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal21IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal22IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal23IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal24IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVBalanceShaft;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVBalanceShaftFailed;
  // State field(s) for T_3_1 widget.
  bool? t31Value;
  // State field(s) for t_3_1_RadioButton widget.
  FormFieldController<String>? t31RadioButtonValueController;
  // State field(s) for T_3_1_Remarks widget.
  FocusNode? t31RemarksFocusNode;
  TextEditingController? t31RemarksTextController;
  String? Function(BuildContext, String?)? t31RemarksTextControllerValidator;
  // State field(s) for T_3_2 widget.
  bool? t32Value;
  // State field(s) for T_3_2_Remarks widget.
  FocusNode? t32RemarksFocusNode;
  TextEditingController? t32RemarksTextController;
  String? Function(BuildContext, String?)? t32RemarksTextControllerValidator;
  // State field(s) for T_3_3 widget.
  bool? t33Value;
  // State field(s) for T_3_3_Remarks widget.
  FocusNode? t33RemarksFocusNode;
  TextEditingController? t33RemarksTextController;
  String? Function(BuildContext, String?)? t33RemarksTextControllerValidator;
  // State field(s) for T_3_4 widget.
  bool? t34Value;
  // State field(s) for t_3_4_DropDown widget.
  String? t34DropDownValue;
  FormFieldController<String>? t34DropDownValueController;
  // State field(s) for T_3_4_Remarks widget.
  FocusNode? t34RemarksFocusNode;
  TextEditingController? t34RemarksTextController;
  String? Function(BuildContext, String?)? t34RemarksTextControllerValidator;
  // State field(s) for T_3_5 widget.
  bool? t35Value;
  // State field(s) for t_3_5_TextField widget.
  FocusNode? t35TextFieldFocusNode;
  TextEditingController? t35TextFieldTextController;
  String? Function(BuildContext, String?)? t35TextFieldTextControllerValidator;
  // State field(s) for T_3_5_Remarks widget.
  FocusNode? t35RemarksFocusNode;
  TextEditingController? t35RemarksTextController;
  String? Function(BuildContext, String?)? t35RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal31IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal32IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal33IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal34IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal35IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVCrankShaft;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVCrankShaftFailed;
  // State field(s) for T_4_1 widget.
  bool? t41Value;
  // State field(s) for T_4_1_Remarks widget.
  FocusNode? t41RemarksFocusNode;
  TextEditingController? t41RemarksTextController;
  String? Function(BuildContext, String?)? t41RemarksTextControllerValidator;
  // State field(s) for T_4_2 widget.
  bool? t42Value;
  // State field(s) for T_4_2_Remarks widget.
  FocusNode? t42RemarksFocusNode;
  TextEditingController? t42RemarksTextController;
  String? Function(BuildContext, String?)? t42RemarksTextControllerValidator;
  // State field(s) for T_4_3 widget.
  bool? t43Value;
  // State field(s) for T_4_3_Remarks widget.
  FocusNode? t43RemarksFocusNode;
  TextEditingController? t43RemarksTextController;
  String? Function(BuildContext, String?)? t43RemarksTextControllerValidator;
  // State field(s) for T_4_4 widget.
  bool? t44Value;
  // State field(s) for T_4_4_Remarks widget.
  FocusNode? t44RemarksFocusNode;
  TextEditingController? t44RemarksTextController;
  String? Function(BuildContext, String?)? t44RemarksTextControllerValidator;
  // State field(s) for t_4_4_RadioButton widget.
  FormFieldController<String>? t44RadioButtonValueController;
  // State field(s) for T_4_5 widget.
  bool? t45Value;
  // State field(s) for T_4_5_Remarks widget.
  FocusNode? t45RemarksFocusNode;
  TextEditingController? t45RemarksTextController;
  String? Function(BuildContext, String?)? t45RemarksTextControllerValidator;
  // State field(s) for T_4_6 widget.
  bool? t46Value;
  // State field(s) for T_4_6_Remarks widget.
  FocusNode? t46RemarksFocusNode;
  TextEditingController? t46RemarksTextController;
  String? Function(BuildContext, String?)? t46RemarksTextControllerValidator;
  // State field(s) for T_4_7 widget.
  bool? t47Value;
  // State field(s) for T_4_7_Remarks widget.
  FocusNode? t47RemarksFocusNode;
  TextEditingController? t47RemarksTextController;
  String? Function(BuildContext, String?)? t47RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal41IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal42IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal43IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal44IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal45IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal46IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal47IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVPiston;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVPistonFailed;
  // State field(s) for T_5_1 widget.
  bool? t51Value;
  // State field(s) for T_5_1_Remarks widget.
  FocusNode? t51RemarksFocusNode;
  TextEditingController? t51RemarksTextController;
  String? Function(BuildContext, String?)? t51RemarksTextControllerValidator;
  // State field(s) for T_5_2 widget.
  bool? t52Value;
  // State field(s) for T_5_2_Remarks widget.
  FocusNode? t52RemarksFocusNode;
  TextEditingController? t52RemarksTextController;
  String? Function(BuildContext, String?)? t52RemarksTextControllerValidator;
  // State field(s) for t_5_3_RadioButton widget.
  FormFieldController<String>? t53RadioButtonValueController;
  // State field(s) for T_5_3 widget.
  bool? t53Value;
  // State field(s) for T_5_3_Remarks widget.
  FocusNode? t53RemarksFocusNode;
  TextEditingController? t53RemarksTextController;
  String? Function(BuildContext, String?)? t53RemarksTextControllerValidator;
  // State field(s) for T_5_4 widget.
  bool? t54Value;
  // State field(s) for T_5_4_Remarks widget.
  FocusNode? t54RemarksFocusNode;
  TextEditingController? t54RemarksTextController;
  String? Function(BuildContext, String?)? t54RemarksTextControllerValidator;
  // State field(s) for T_5_5 widget.
  bool? t55Value;
  // State field(s) for T_5_5_Remarks widget.
  FocusNode? t55RemarksFocusNode;
  TextEditingController? t55RemarksTextController;
  String? Function(BuildContext, String?)? t55RemarksTextControllerValidator;
  // State field(s) for T_5_6 widget.
  bool? t56Value;
  // State field(s) for T_5_6_Remarks widget.
  FocusNode? t56RemarksFocusNode;
  TextEditingController? t56RemarksTextController;
  String? Function(BuildContext, String?)? t56RemarksTextControllerValidator;
  // State field(s) for T_5_7 widget.
  bool? t57Value;
  // State field(s) for T_5_7_Remarks widget.
  FocusNode? t57RemarksFocusNode;
  TextEditingController? t57RemarksTextController;
  String? Function(BuildContext, String?)? t57RemarksTextControllerValidator;
  // State field(s) for T_5_8 widget.
  bool? t58Value;
  // State field(s) for t_5_8_numericValue widget.
  FocusNode? t58NumericValueFocusNode;
  TextEditingController? t58NumericValueTextController;
  String? Function(BuildContext, String?)?
      t58NumericValueTextControllerValidator;
  // State field(s) for t_5_8_SelectedOption widget.
  String? t58SelectedOptionValue;
  FormFieldController<String>? t58SelectedOptionValueController;
  // State field(s) for T_5_8_Remarks widget.
  FocusNode? t58RemarksFocusNode;
  TextEditingController? t58RemarksTextController;
  String? Function(BuildContext, String?)? t58RemarksTextControllerValidator;
  // State field(s) for T_5_9 widget.
  bool? t59Value;
  // State field(s) for t_5_9_RadioButton widget.
  FormFieldController<String>? t59RadioButtonValueController;
  // State field(s) for T_5_9_Remarks widget.
  FocusNode? t59RemarksFocusNode;
  TextEditingController? t59RemarksTextController;
  String? Function(BuildContext, String?)? t59RemarksTextControllerValidator;
  // State field(s) for T_5_10_disabled widget.
  bool? t510DisabledValue;
  // State field(s) for T_5_10_Remarks_disabled widget.
  FocusNode? t510RemarksDisabledFocusNode;
  TextEditingController? t510RemarksDisabledTextController;
  String? Function(BuildContext, String?)?
      t510RemarksDisabledTextControllerValidator;
  // State field(s) for T_5_10 widget.
  bool? t510Value;
  // State field(s) for T_5_10_Remarks widget.
  FocusNode? t510RemarksFocusNode;
  TextEditingController? t510RemarksTextController;
  String? Function(BuildContext, String?)? t510RemarksTextControllerValidator;
  // State field(s) for T_5_11 widget.
  bool? t511Value;
  // State field(s) for T_5_11_Remarks widget.
  FocusNode? t511RemarksFocusNode;
  TextEditingController? t511RemarksTextController;
  String? Function(BuildContext, String?)? t511RemarksTextControllerValidator;
  // State field(s) for T_5_12 widget.
  bool? t512Value;
  // State field(s) for T_5_12_Remarks widget.
  FocusNode? t512RemarksFocusNode;
  TextEditingController? t512RemarksTextController;
  String? Function(BuildContext, String?)? t512RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal51IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal52IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal53IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal54IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal55IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal56IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal57IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal58IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? sealCylinderUpdate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal59IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal510IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal511IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal512IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVCylinder;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVCylinderFailed;
  // State field(s) for T_6_1 widget.
  bool? t61Value;
  // State field(s) for t_6_1_RadioButton widget.
  FormFieldController<String>? t61RadioButtonValueController;
  // State field(s) for T_6_1_Remarks widget.
  FocusNode? t61RemarksFocusNode;
  TextEditingController? t61RemarksTextController;
  String? Function(BuildContext, String?)? t61RemarksTextControllerValidator;
  // State field(s) for T_6_2 widget.
  bool? t62Value;
  // State field(s) for T_6_2_Remarks widget.
  FocusNode? t62RemarksFocusNode;
  TextEditingController? t62RemarksTextController;
  String? Function(BuildContext, String?)? t62RemarksTextControllerValidator;
  // State field(s) for T_6_3 widget.
  bool? t63Value;
  // State field(s) for t_6_3_numeric widget.
  FocusNode? t63NumericFocusNode;
  TextEditingController? t63NumericTextController;
  String? Function(BuildContext, String?)? t63NumericTextControllerValidator;
  // State field(s) for T_6_3_Remarks widget.
  FocusNode? t63RemarksFocusNode;
  TextEditingController? t63RemarksTextController;
  String? Function(BuildContext, String?)? t63RemarksTextControllerValidator;
  // State field(s) for T_6_4 widget.
  bool? t64Value;
  // State field(s) for t_6_4_RadioButton widget.
  FormFieldController<String>? t64RadioButtonValueController;
  // State field(s) for T_6_4_Remarks widget.
  FocusNode? t64RemarksFocusNode;
  TextEditingController? t64RemarksTextController;
  String? Function(BuildContext, String?)? t64RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal61IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal62IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal63IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal64IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVInletSystem;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVInletSystemFailed;
  // State field(s) for T_7_1 widget.
  bool? t71Value;
  // State field(s) for Micro widget.
  String? microValue;
  FormFieldController<String>? microValueController;
  // State field(s) for Mini widget.
  String? miniValue;
  FormFieldController<String>? miniValueController;
  // State field(s) for Junior widget.
  String? juniorValue;
  FormFieldController<String>? juniorValueController;
  // State field(s) for Senior widget.
  String? seniorValue;
  FormFieldController<String>? seniorValueController;
  // State field(s) for T_7_1_Remarks widget.
  FocusNode? t71RemarksFocusNode;
  TextEditingController? t71RemarksTextController;
  String? Function(BuildContext, String?)? t71RemarksTextControllerValidator;
  // State field(s) for T_7_2 widget.
  bool? t72Value;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for t_7_2DropDown widget.
  String? t72DropDownValue;
  FormFieldController<String>? t72DropDownValueController;
  // State field(s) for T_7_2_Remarks widget.
  FocusNode? t72RemarksFocusNode;
  TextEditingController? t72RemarksTextController;
  String? Function(BuildContext, String?)? t72RemarksTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal71IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<KsKartingChecksDataRow>? returedSeal72IDRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVSquishGap;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? aOVSquishGapFailed;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<SealingRow>? deleteTempEntry;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<SealingRow>? deleteEntry;
  // Model for sealList component.
  late SealListModel sealListModel;

  @override
  void initState(BuildContext context) {
    sealListModel = createModel(context, () => SealListModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    t11RemarksFocusNode?.dispose();
    t11RemarksTextController?.dispose();

    t12RemarksHidedFocusNode?.dispose();
    t12RemarksHidedTextController?.dispose();

    t12RemarksFocusNode?.dispose();
    t12RemarksTextController?.dispose();

    t13RemarksFocusNode?.dispose();
    t13RemarksTextController?.dispose();

    t14RemarksFocusNode?.dispose();
    t14RemarksTextController?.dispose();

    t15RemarksFocusNode?.dispose();
    t15RemarksTextController?.dispose();

    t21RemarksFocusNode?.dispose();
    t21RemarksTextController?.dispose();

    t22RemarksFocusNode?.dispose();
    t22RemarksTextController?.dispose();

    t23RemarksFocusNode?.dispose();
    t23RemarksTextController?.dispose();

    t24RemarksFocusNode?.dispose();
    t24RemarksTextController?.dispose();

    t31RemarksFocusNode?.dispose();
    t31RemarksTextController?.dispose();

    t32RemarksFocusNode?.dispose();
    t32RemarksTextController?.dispose();

    t33RemarksFocusNode?.dispose();
    t33RemarksTextController?.dispose();

    t34RemarksFocusNode?.dispose();
    t34RemarksTextController?.dispose();

    t35TextFieldFocusNode?.dispose();
    t35TextFieldTextController?.dispose();

    t35RemarksFocusNode?.dispose();
    t35RemarksTextController?.dispose();

    t41RemarksFocusNode?.dispose();
    t41RemarksTextController?.dispose();

    t42RemarksFocusNode?.dispose();
    t42RemarksTextController?.dispose();

    t43RemarksFocusNode?.dispose();
    t43RemarksTextController?.dispose();

    t44RemarksFocusNode?.dispose();
    t44RemarksTextController?.dispose();

    t45RemarksFocusNode?.dispose();
    t45RemarksTextController?.dispose();

    t46RemarksFocusNode?.dispose();
    t46RemarksTextController?.dispose();

    t47RemarksFocusNode?.dispose();
    t47RemarksTextController?.dispose();

    t51RemarksFocusNode?.dispose();
    t51RemarksTextController?.dispose();

    t52RemarksFocusNode?.dispose();
    t52RemarksTextController?.dispose();

    t53RemarksFocusNode?.dispose();
    t53RemarksTextController?.dispose();

    t54RemarksFocusNode?.dispose();
    t54RemarksTextController?.dispose();

    t55RemarksFocusNode?.dispose();
    t55RemarksTextController?.dispose();

    t56RemarksFocusNode?.dispose();
    t56RemarksTextController?.dispose();

    t57RemarksFocusNode?.dispose();
    t57RemarksTextController?.dispose();

    t58NumericValueFocusNode?.dispose();
    t58NumericValueTextController?.dispose();

    t58RemarksFocusNode?.dispose();
    t58RemarksTextController?.dispose();

    t59RemarksFocusNode?.dispose();
    t59RemarksTextController?.dispose();

    t510RemarksDisabledFocusNode?.dispose();
    t510RemarksDisabledTextController?.dispose();

    t510RemarksFocusNode?.dispose();
    t510RemarksTextController?.dispose();

    t511RemarksFocusNode?.dispose();
    t511RemarksTextController?.dispose();

    t512RemarksFocusNode?.dispose();
    t512RemarksTextController?.dispose();

    t61RemarksFocusNode?.dispose();
    t61RemarksTextController?.dispose();

    t62RemarksFocusNode?.dispose();
    t62RemarksTextController?.dispose();

    t63NumericFocusNode?.dispose();
    t63NumericTextController?.dispose();

    t63RemarksFocusNode?.dispose();
    t63RemarksTextController?.dispose();

    t64RemarksFocusNode?.dispose();
    t64RemarksTextController?.dispose();

    t71RemarksFocusNode?.dispose();
    t71RemarksTextController?.dispose();

    t72RemarksFocusNode?.dispose();
    t72RemarksTextController?.dispose();

    sealListModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  String? get radioButtonValue => radioButtonValueController?.value;
  String? get t15RadioButtonValue => t15RadioButtonValueController?.value;
  String? get t24RadioButtonValue => t24RadioButtonValueController?.value;
  String? get t31RadioButtonValue => t31RadioButtonValueController?.value;
  String? get t44RadioButtonValue => t44RadioButtonValueController?.value;
  String? get t53RadioButtonValue => t53RadioButtonValueController?.value;
  String? get t59RadioButtonValue => t59RadioButtonValueController?.value;
  String? get t61RadioButtonValue => t61RadioButtonValueController?.value;
  String? get t64RadioButtonValue => t64RadioButtonValueController?.value;
}
