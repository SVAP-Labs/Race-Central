import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 's_o_m_approved_widget.dart' show SOMApprovedWidget;
import 'package:flutter/material.dart';

class SOMApprovedModel extends FlutterFlowModel<SOMApprovedWidget> {
  ///  Local state fields for this page.

  List<String> psAvailableNumber = [];
  void addToPsAvailableNumber(String item) => psAvailableNumber.add(item);
  void removeFromPsAvailableNumber(String item) =>
      psAvailableNumber.remove(item);
  void removeAtIndexFromPsAvailableNumber(int index) =>
      psAvailableNumber.removeAt(index);
  void insertAtIndexInPsAvailableNumber(int index, String item) =>
      psAvailableNumber.insert(index, item);
  void updatePsAvailableNumberAtIndex(int index, Function(String) updateFn) =>
      psAvailableNumber[index] = updateFn(psAvailableNumber[index]);

  String? psEventId;

  String? psDriverId;

  String? psCategory;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for teamfmsciLicense widget.
  FocusNode? teamfmsciLicenseFocusNode;
  TextEditingController? teamfmsciLicenseTextController;
  String? Function(BuildContext, String?)?
      teamfmsciLicenseTextControllerValidator;
  // State field(s) for fmsciLicense widget.
  FocusNode? fmsciLicenseFocusNode;
  TextEditingController? fmsciLicenseTextController;
  String? Function(BuildContext, String?)? fmsciLicenseTextControllerValidator;
  String? _fmsciLicenseTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'FMSCI License Number is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for No1DropDown widget.
  String? no1DropDownValue;
  FormFieldController<String>? no1DropDownValueController;
  // State field(s) for feePayModeDropDown widget.
  String? feePayModeDropDownValue;
  FormFieldController<String>? feePayModeDropDownValueController;
  DateTime? datePicked1;
  // State field(s) for JuniorRadioButton widget.
  FormFieldController<String>? juniorRadioButtonValueController;
  // State field(s) for AmountRadioButton widget.
  FormFieldController<String>? amountRadioButtonValueController;
  // State field(s) for FeeUTRTextField widget.
  FocusNode? feeUTRTextFieldFocusNode;
  TextEditingController? feeUTRTextFieldTextController;
  String? Function(BuildContext, String?)?
      feeUTRTextFieldTextControllerValidator;
  String? _feeUTRTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'UTR Reference is required';
    }

    return null;
  }

  // State field(s) for FeeSwitchListTile widget.
  bool? feeSwitchListTileValue;
  // State field(s) for tyrePaymentMode widget.
  String? tyrePaymentModeValue;
  FormFieldController<String>? tyrePaymentModeValueController;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'UTR Reference is required';
    }

    return null;
  }

  // State field(s) for tyreFeeSwitchListTile widget.
  bool? tyreFeeSwitchListTileValue;
  // State field(s) for SomRemarksTextField widget.
  FocusNode? somRemarksTextFieldFocusNode;
  TextEditingController? somRemarksTextFieldTextController;
  String? Function(BuildContext, String?)?
      somRemarksTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? createdRegistration;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventRegistrationsRow>? registrationApproval;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventRegistrationsRow>? queriedRegistration;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  DriverScrutinyRow? insertDriverScrutiny;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  KartScrutinyCheckRow? insertKartscrutiny;

  @override
  void initState(BuildContext context) {
    fmsciLicenseTextControllerValidator = _fmsciLicenseTextControllerValidator;
    feeUTRTextFieldTextControllerValidator =
        _feeUTRTextFieldTextControllerValidator;
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    teamfmsciLicenseFocusNode?.dispose();
    teamfmsciLicenseTextController?.dispose();

    fmsciLicenseFocusNode?.dispose();
    fmsciLicenseTextController?.dispose();

    feeUTRTextFieldFocusNode?.dispose();
    feeUTRTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    somRemarksTextFieldFocusNode?.dispose();
    somRemarksTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get juniorRadioButtonValue => juniorRadioButtonValueController?.value;
  String? get amountRadioButtonValue => amountRadioButtonValueController?.value;
}
