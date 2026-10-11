import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'j_k_registration_widget.dart' show JKRegistrationWidget;
import 'package:flutter/material.dart';

class JKRegistrationModel extends FlutterFlowModel<JKRegistrationWidget> {
  ///  Local state fields for this page.

  String? psCategory;

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

  String? psIdProofUrl = '';

  bool? psIsNonVeg = false;

  String? psPdfUrl = '';

  bool psIsRookieCategory = false;

  UserDetailsProfileStruct? psUserProfileDetails;
  void updatePsUserProfileDetailsStruct(
      Function(UserDetailsProfileStruct) updateFn) {
    updateFn(psUserProfileDetails ??= UserDetailsProfileStruct());
  }

  String psCategoryTeamid = 'Team Name';

  UserEmergencyDetailsStruct? psUserEmergencyDetails;
  void updatePsUserEmergencyDetailsStruct(
      Function(UserEmergencyDetailsStruct) updateFn) {
    updateFn(psUserEmergencyDetails ??= UserEmergencyDetailsStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getUniqueEntryNumber)] action in JKRegistration widget.
  ApiCallResponse? apiResulto4e8;
  // Stores action output result for [Backend Call - API (getcategorynumbers)] action in JKRegistration widget.
  ApiCallResponse? apiResultallNumbers;
  // Stores action output result for [Backend Call - Query Rows] action in JKRegistration widget.
  List<EventCategoriesRow>? queriedCategory;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for rookiecheckbox widget.
  bool? rookiecheckboxValue;
  // State field(s) for vehicleMake widget.
  FocusNode? vehicleMakeFocusNode;
  TextEditingController? vehicleMakeTextController;
  String? Function(BuildContext, String?)? vehicleMakeTextControllerValidator;
  // State field(s) for tyresizeDropDown widget.
  String? tyresizeDropDownValue;
  FormFieldController<String>? tyresizeDropDownValueController;
  // State field(s) for ASNDropDown widget.
  String? aSNDropDownValue;
  FormFieldController<String>? aSNDropDownValueController;
  // State field(s) for issuing_asn widget.
  FocusNode? issuingAsnFocusNode;
  TextEditingController? issuingAsnTextController;
  String? Function(BuildContext, String?)? issuingAsnTextControllerValidator;
  String? _issuingAsnTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Issuing ASN is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for fmsciLicense widget.
  FocusNode? fmsciLicenseFocusNode;
  TextEditingController? fmsciLicenseTextController;
  String? Function(BuildContext, String?)? fmsciLicenseTextControllerValidator;
  String? _fmsciLicenseTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'FMSCI License Number is required';
    }

    return null;
  }

  // State field(s) for No1DropDown widget.
  String? no1DropDownValue;
  FormFieldController<String>? no1DropDownValueController;
  // State field(s) for No2DropDown widget.
  String? no2DropDownValue;
  FormFieldController<String>? no2DropDownValueController;
  // State field(s) for No3DropDown widget.
  String? no3DropDownValue;
  FormFieldController<String>? no3DropDownValueController;
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
  FocusNode? countryTextFieldFocusNode1;
  TextEditingController? countryTextFieldTextController1;
  String? Function(BuildContext, String?)?
      countryTextFieldTextController1Validator;
  bool isDataUploading_idProofUpload = false;
  FFUploadedFile uploadedLocalFile_idProofUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_idProofUpload = '';

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
  FocusNode? textFieldFocusNode;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  String? _textController12Validator(BuildContext context, String? val) {
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

    if (val.length < 10) {
      return 'Minimum 10 digits required';
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

  // State field(s) for emergency_addressLane widget.
  FocusNode? emergencyAddressLaneFocusNode;
  TextEditingController? emergencyAddressLaneTextController;
  String? Function(BuildContext, String?)?
      emergencyAddressLaneTextControllerValidator;
  String? _emergencyAddressLaneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Door No is required';
    }

    return null;
  }

  // State field(s) for emergency_streetLane widget.
  FocusNode? emergencyStreetLaneFocusNode;
  TextEditingController? emergencyStreetLaneTextController;
  String? Function(BuildContext, String?)?
      emergencyStreetLaneTextControllerValidator;
  String? _emergencyStreetLaneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Streert Name  is required';
    }

    return null;
  }

  // State field(s) for emergency_cityText widget.
  FocusNode? emergencyCityTextFocusNode;
  TextEditingController? emergencyCityTextTextController;
  String? Function(BuildContext, String?)?
      emergencyCityTextTextControllerValidator;
  String? _emergencyCityTextTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'City Name is required';
    }

    return null;
  }

  // State field(s) for emergency_StateField widget.
  FocusNode? emergencyStateFieldFocusNode;
  TextEditingController? emergencyStateFieldTextController;
  String? Function(BuildContext, String?)?
      emergencyStateFieldTextControllerValidator;
  String? _emergencyStateFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'State / Region is required';
    }

    return null;
  }

  // State field(s) for emergency_zipcodeTextField widget.
  FocusNode? emergencyZipcodeTextFieldFocusNode;
  TextEditingController? emergencyZipcodeTextFieldTextController;
  String? Function(BuildContext, String?)?
      emergencyZipcodeTextFieldTextControllerValidator;
  String? _emergencyZipcodeTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'PinCode  is required';
    }

    return null;
  }

  // State field(s) for emergecny_Country widget.
  String? emergecnyCountryValue;
  FormFieldController<String>? emergecnyCountryValueController;
  // State field(s) for countryTextField widget.
  FocusNode? countryTextFieldFocusNode2;
  TextEditingController? countryTextFieldTextController2;
  String? Function(BuildContext, String?)?
      countryTextFieldTextController2Validator;
  // State field(s) for foodPreferenceToggle widget.
  bool? foodPreferenceToggleValue;
  // State field(s) for nationalityTextField widget.
  FocusNode? nationalityTextFieldFocusNode;
  TextEditingController? nationalityTextFieldTextController;
  String? Function(BuildContext, String?)?
      nationalityTextFieldTextControllerValidator;
  String? _nationalityTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Nationality';
    }

    return null;
  }

  // State field(s) for facebookhandle widget.
  FocusNode? facebookhandleFocusNode;
  TextEditingController? facebookhandleTextController;
  String? Function(BuildContext, String?)?
      facebookhandleTextControllerValidator;
  String? _facebookhandleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Facebook Handle';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for instagramhandle widget.
  FocusNode? instagramhandleFocusNode;
  TextEditingController? instagramhandleTextController;
  String? Function(BuildContext, String?)?
      instagramhandleTextControllerValidator;
  String? _instagramhandleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Instagram Handle';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for racingSinceTextField widget.
  FocusNode? racingSinceTextFieldFocusNode;
  TextEditingController? racingSinceTextFieldTextController;
  String? Function(BuildContext, String?)?
      racingSinceTextFieldTextControllerValidator;
  String? _racingSinceTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter racing since';
    }

    if (val.length < 4) {
      return 'Enter the year';
    }
    if (val.length > 4) {
      return 'Maximum 4 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for racesParticipatedTextField widget.
  FocusNode? racesParticipatedTextFieldFocusNode;
  TextEditingController? racesParticipatedTextFieldTextController;
  String? Function(BuildContext, String?)?
      racesParticipatedTextFieldTextControllerValidator;
  String? _racesParticipatedTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill number of races participated . Enter 0 if no races.';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for podiums widget.
  FocusNode? podiumsFocusNode;
  TextEditingController? podiumsTextController;
  String? Function(BuildContext, String?)? podiumsTextControllerValidator;
  String? _podiumsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill Number of Podiums . Enter 0 in case of no podiums.';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for hobbiesTextField widget.
  FocusNode? hobbiesTextFieldFocusNode;
  TextEditingController? hobbiesTextFieldTextController;
  String? Function(BuildContext, String?)?
      hobbiesTextFieldTextControllerValidator;
  String? _hobbiesTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill Missing Field.';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for motorsportIdolTextField widget.
  FocusNode? motorsportIdolTextFieldFocusNode;
  TextEditingController? motorsportIdolTextFieldTextController;
  String? Function(BuildContext, String?)?
      motorsportIdolTextFieldTextControllerValidator;
  String? _motorsportIdolTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill Missing Field.';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for aimTextField widget.
  FocusNode? aimTextFieldFocusNode;
  TextEditingController? aimTextFieldTextController;
  String? Function(BuildContext, String?)? aimTextFieldTextControllerValidator;
  String? _aimTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fill Missing Field.';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<AppUsersRow>? checkJSONLoad;
  // State field(s) for teamName widget.
  String? teamNameValue;
  FormFieldController<String>? teamNameValueController;
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

  bool isDataUploading_pdfUpload = false;
  FFUploadedFile uploadedLocalFile_pdfUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_pdfUpload = '';

  @override
  void initState(BuildContext context) {
    issuingAsnTextControllerValidator = _issuingAsnTextControllerValidator;
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
    textController12Validator = _textController12Validator;
    emergencycontactTextFieldTextController1Validator =
        _emergencycontactTextFieldTextController1Validator;
    emergencycontactTextFieldTextController2Validator =
        _emergencycontactTextFieldTextController2Validator;
    emergencyAddressLaneTextControllerValidator =
        _emergencyAddressLaneTextControllerValidator;
    emergencyStreetLaneTextControllerValidator =
        _emergencyStreetLaneTextControllerValidator;
    emergencyCityTextTextControllerValidator =
        _emergencyCityTextTextControllerValidator;
    emergencyStateFieldTextControllerValidator =
        _emergencyStateFieldTextControllerValidator;
    emergencyZipcodeTextFieldTextControllerValidator =
        _emergencyZipcodeTextFieldTextControllerValidator;
    nationalityTextFieldTextControllerValidator =
        _nationalityTextFieldTextControllerValidator;
    facebookhandleTextControllerValidator =
        _facebookhandleTextControllerValidator;
    instagramhandleTextControllerValidator =
        _instagramhandleTextControllerValidator;
    racingSinceTextFieldTextControllerValidator =
        _racingSinceTextFieldTextControllerValidator;
    racesParticipatedTextFieldTextControllerValidator =
        _racesParticipatedTextFieldTextControllerValidator;
    podiumsTextControllerValidator = _podiumsTextControllerValidator;
    hobbiesTextFieldTextControllerValidator =
        _hobbiesTextFieldTextControllerValidator;
    motorsportIdolTextFieldTextControllerValidator =
        _motorsportIdolTextFieldTextControllerValidator;
    aimTextFieldTextControllerValidator = _aimTextFieldTextControllerValidator;
    entrantManagerTextControllerValidator =
        _entrantManagerTextControllerValidator;
    entrantMobileTextControllerValidator =
        _entrantMobileTextControllerValidator;
    entrantemailTextControllerValidator = _entrantemailTextControllerValidator;
  }

  @override
  void dispose() {
    vehicleMakeFocusNode?.dispose();
    vehicleMakeTextController?.dispose();

    issuingAsnFocusNode?.dispose();
    issuingAsnTextController?.dispose();

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

    countryTextFieldFocusNode1?.dispose();
    countryTextFieldTextController1?.dispose();

    emergencyTextFieldFocusNode?.dispose();
    emergencyTextFieldTextController?.dispose();

    relationshipTextFieldFocusNode?.dispose();
    relationshipTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController12?.dispose();

    emergencycontactTextFieldFocusNode1?.dispose();
    emergencycontactTextFieldTextController1?.dispose();

    emergencycontactTextFieldFocusNode2?.dispose();
    emergencycontactTextFieldTextController2?.dispose();

    emergencyAddressLaneFocusNode?.dispose();
    emergencyAddressLaneTextController?.dispose();

    emergencyStreetLaneFocusNode?.dispose();
    emergencyStreetLaneTextController?.dispose();

    emergencyCityTextFocusNode?.dispose();
    emergencyCityTextTextController?.dispose();

    emergencyStateFieldFocusNode?.dispose();
    emergencyStateFieldTextController?.dispose();

    emergencyZipcodeTextFieldFocusNode?.dispose();
    emergencyZipcodeTextFieldTextController?.dispose();

    countryTextFieldFocusNode2?.dispose();
    countryTextFieldTextController2?.dispose();

    nationalityTextFieldFocusNode?.dispose();
    nationalityTextFieldTextController?.dispose();

    facebookhandleFocusNode?.dispose();
    facebookhandleTextController?.dispose();

    instagramhandleFocusNode?.dispose();
    instagramhandleTextController?.dispose();

    racingSinceTextFieldFocusNode?.dispose();
    racingSinceTextFieldTextController?.dispose();

    racesParticipatedTextFieldFocusNode?.dispose();
    racesParticipatedTextFieldTextController?.dispose();

    podiumsFocusNode?.dispose();
    podiumsTextController?.dispose();

    hobbiesTextFieldFocusNode?.dispose();
    hobbiesTextFieldTextController?.dispose();

    motorsportIdolTextFieldFocusNode?.dispose();
    motorsportIdolTextFieldTextController?.dispose();

    aimTextFieldFocusNode?.dispose();
    aimTextFieldTextController?.dispose();

    entrantManagerFocusNode?.dispose();
    entrantManagerTextController?.dispose();

    entrantMobileFocusNode?.dispose();
    entrantMobileTextController?.dispose();

    entrantemailFocusNode?.dispose();
    entrantemailTextController?.dispose();
  }
}
