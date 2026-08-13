import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'iame_registration_widget.dart' show IameRegistrationWidget;
import 'package:flutter/material.dart';

class IameRegistrationModel extends FlutterFlowModel<IameRegistrationWidget> {
  ///  Local state fields for this page.

  String? psCategory;

  DateTime? psFeeTransDate;

  DateTime? psTyreTransDate;

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

  String? psBannerImage;

  List<String> psallCategoryNumbers = [];
  void addToPsallCategoryNumbers(String item) => psallCategoryNumbers.add(item);
  void removeFromPsallCategoryNumbers(String item) =>
      psallCategoryNumbers.remove(item);
  void removeAtIndexFromPsallCategoryNumbers(int index) =>
      psallCategoryNumbers.removeAt(index);
  void insertAtIndexInPsallCategoryNumbers(int index, String item) =>
      psallCategoryNumbers.insert(index, item);
  void updatePsallCategoryNumbersAtIndex(
          int index, Function(String) updateFn) =>
      psallCategoryNumbers[index] = updateFn(psallCategoryNumbers[index]);

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getUniqueEntryNumber)] action in iameRegistration widget.
  ApiCallResponse? apiResulto4e8;
  // Stores action output result for [Backend Call - API (getcategorynumbers)] action in iameRegistration widget.
  ApiCallResponse? apiResultallNumbers;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
  // State field(s) for No2DropDown widget.
  String? no2DropDownValue;
  FormFieldController<String>? no2DropDownValueController;
  // State field(s) for addressLane widget.
  FocusNode? addressLaneFocusNode;
  TextEditingController? addressLaneTextController;
  String? Function(BuildContext, String?)? addressLaneTextControllerValidator;
  String? _addressLaneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Door No , Address Lane is required';
    }

    return null;
  }

  // State field(s) for streetLane widget.
  FocusNode? streetLaneFocusNode;
  TextEditingController? streetLaneTextController;
  String? Function(BuildContext, String?)? streetLaneTextControllerValidator;
  String? _streetLaneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Street Address is required';
    }

    return null;
  }

  // State field(s) for cityText widget.
  FocusNode? cityTextFocusNode;
  TextEditingController? cityTextTextController;
  String? Function(BuildContext, String?)? cityTextTextControllerValidator;
  String? _cityTextTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'City is required';
    }

    return null;
  }

  // State field(s) for StateTextField widget.
  FocusNode? stateTextFieldFocusNode;
  TextEditingController? stateTextFieldTextController;
  String? Function(BuildContext, String?)?
      stateTextFieldTextControllerValidator;
  String? _stateTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'State/Region is required';
    }

    return null;
  }

  // State field(s) for zipcodeTextField widget.
  FocusNode? zipcodeTextFieldFocusNode;
  TextEditingController? zipcodeTextFieldTextController;
  String? Function(BuildContext, String?)?
      zipcodeTextFieldTextControllerValidator;
  String? _zipcodeTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Postal/Zip Code is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for countryTextField widget.
  FocusNode? countryTextFieldFocusNode;
  TextEditingController? countryTextFieldTextController;
  String? Function(BuildContext, String?)?
      countryTextFieldTextControllerValidator;
  // State field(s) for EmergencyTextField widget.
  FocusNode? emergencyTextFieldFocusNode;
  TextEditingController? emergencyTextFieldTextController;
  String? Function(BuildContext, String?)?
      emergencyTextFieldTextControllerValidator;
  String? _emergencyTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Emergency Contact Person Name is required';
    }

    return null;
  }

  // State field(s) for relationshipTextField widget.
  FocusNode? relationshipTextFieldFocusNode;
  TextEditingController? relationshipTextFieldTextController;
  String? Function(BuildContext, String?)?
      relationshipTextFieldTextControllerValidator;
  String? _relationshipTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Relationship - Father/Mother/Guardian is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  String? _textController10Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Code is required';
    }

    return null;
  }

  // State field(s) for EmergencycontactTextField widget.
  FocusNode? emergencycontactTextFieldFocusNode1;
  TextEditingController? emergencycontactTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emergencycontactTextFieldTextController1Validator;
  String? _emergencycontactTextFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Emergency Contact Number is required';
    }

    return null;
  }

  // State field(s) for EmergencycontactTextField widget.
  FocusNode? emergencycontactTextFieldFocusNode2;
  TextEditingController? emergencycontactTextFieldTextController2;
  String? Function(BuildContext, String?)?
      emergencycontactTextFieldTextController2Validator;
  String? _emergencycontactTextFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Emergency Contact email ID is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter vaild e-mail Address';
    }
    return null;
  }

  // State field(s) for EntrantManager widget.
  FocusNode? entrantManagerFocusNode;
  TextEditingController? entrantManagerTextController;
  String? Function(BuildContext, String?)?
      entrantManagerTextControllerValidator;
  String? _entrantManagerTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name Of Entrant / Team Manager is required';
    }

    return null;
  }

  // State field(s) for entrantMobile widget.
  FocusNode? entrantMobileFocusNode;
  TextEditingController? entrantMobileTextController;
  String? Function(BuildContext, String?)? entrantMobileTextControllerValidator;
  String? _entrantMobileTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mobile Number Of Entrant / Team  is required';
    }

    return null;
  }

  // State field(s) for Entrantemail widget.
  FocusNode? entrantemailFocusNode;
  TextEditingController? entrantemailTextController;
  String? Function(BuildContext, String?)? entrantemailTextControllerValidator;
  String? _entrantemailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email Address Of Entrant / Team is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter Valid e-mail ID';
    }
    return null;
  }

  // State field(s) for Entrant_fmsci widget.
  FocusNode? entrantFmsciFocusNode;
  TextEditingController? entrantFmsciTextController;
  String? Function(BuildContext, String?)? entrantFmsciTextControllerValidator;
  String? _entrantFmsciTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '2026 FMSCI LICENCE # of the Number Of Enterant / Team is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for tyreFeeRadioButton widget.
  FormFieldController<String>? tyreFeeRadioButtonValueController;
  // State field(s) for tyrePaymentMode widget.
  String? tyrePaymentModeValue;
  FormFieldController<String>? tyrePaymentModeValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  String? _textController17Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'UTR Reference is required';
    }

    return null;
  }

  bool isDataUploading_uploadDataTrans = false;
  FFUploadedFile uploadedLocalFile_uploadDataTrans =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTrans = '';

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    fmsciLicenseTextControllerValidator = _fmsciLicenseTextControllerValidator;
    addressLaneTextControllerValidator = _addressLaneTextControllerValidator;
    streetLaneTextControllerValidator = _streetLaneTextControllerValidator;
    cityTextTextControllerValidator = _cityTextTextControllerValidator;
    stateTextFieldTextControllerValidator =
        _stateTextFieldTextControllerValidator;
    zipcodeTextFieldTextControllerValidator =
        _zipcodeTextFieldTextControllerValidator;
    emergencyTextFieldTextControllerValidator =
        _emergencyTextFieldTextControllerValidator;
    relationshipTextFieldTextControllerValidator =
        _relationshipTextFieldTextControllerValidator;
    textController10Validator = _textController10Validator;
    emergencycontactTextFieldTextController1Validator =
        _emergencycontactTextFieldTextController1Validator;
    emergencycontactTextFieldTextController2Validator =
        _emergencycontactTextFieldTextController2Validator;
    entrantManagerTextControllerValidator =
        _entrantManagerTextControllerValidator;
    entrantMobileTextControllerValidator =
        _entrantMobileTextControllerValidator;
    entrantemailTextControllerValidator = _entrantemailTextControllerValidator;
    entrantFmsciTextControllerValidator = _entrantFmsciTextControllerValidator;
    textController17Validator = _textController17Validator;
  }

  @override
  void dispose() {
    fmsciLicenseFocusNode?.dispose();
    fmsciLicenseTextController?.dispose();

    addressLaneFocusNode?.dispose();
    addressLaneTextController?.dispose();

    streetLaneFocusNode?.dispose();
    streetLaneTextController?.dispose();

    cityTextFocusNode?.dispose();
    cityTextTextController?.dispose();

    stateTextFieldFocusNode?.dispose();
    stateTextFieldTextController?.dispose();

    zipcodeTextFieldFocusNode?.dispose();
    zipcodeTextFieldTextController?.dispose();

    countryTextFieldFocusNode?.dispose();
    countryTextFieldTextController?.dispose();

    emergencyTextFieldFocusNode?.dispose();
    emergencyTextFieldTextController?.dispose();

    relationshipTextFieldFocusNode?.dispose();
    relationshipTextFieldTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController10?.dispose();

    emergencycontactTextFieldFocusNode1?.dispose();
    emergencycontactTextFieldTextController1?.dispose();

    emergencycontactTextFieldFocusNode2?.dispose();
    emergencycontactTextFieldTextController2?.dispose();

    entrantManagerFocusNode?.dispose();
    entrantManagerTextController?.dispose();

    entrantMobileFocusNode?.dispose();
    entrantMobileTextController?.dispose();

    entrantemailFocusNode?.dispose();
    entrantemailTextController?.dispose();

    entrantFmsciFocusNode?.dispose();
    entrantFmsciTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController17?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
  String? get tyreFeeRadioButtonValue =>
      tyreFeeRadioButtonValueController?.value;
}
