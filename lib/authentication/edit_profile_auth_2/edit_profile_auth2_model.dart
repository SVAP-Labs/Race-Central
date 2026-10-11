import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_auth2_widget.dart' show EditProfileAuth2Widget;
import 'package:flutter/material.dart';

class EditProfileAuth2Model extends FlutterFlowModel<EditProfileAuth2Widget> {
  ///  Local state fields for this component.

  DateTime? csDOBDate;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData8edit = false;
  FFUploadedFile uploadedLocalFile_uploadData8edit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData8edit = '';

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name as per Passport/ Govt ID is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Last Name is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for bloodDropDown widget.
  String? bloodDropDownValue;
  FormFieldController<String>? bloodDropDownValueController;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactTextController;
  String? Function(BuildContext, String?)? contactTextControllerValidator;
  String? _contactTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Emergency Contact is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for parentName widget.
  FocusNode? parentNameFocusNode;
  TextEditingController? parentNameTextController;
  String? Function(BuildContext, String?)? parentNameTextControllerValidator;
  String? _parentNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Parent / Guardian Name is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for parentemail widget.
  FocusNode? parentemailFocusNode;
  TextEditingController? parentemailTextController;
  String? Function(BuildContext, String?)? parentemailTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button-Login widget.
  List<AppUsersRow>? supabaseUpdateRow;
  // Stores action output result for [Backend Call - Query Rows] action in Button-Login widget.
  List<AppUsersRow>? supabaseQueriedUID;

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    contactTextControllerValidator = _contactTextControllerValidator;
    parentNameTextControllerValidator = _parentNameTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    contactFocusNode?.dispose();
    contactTextController?.dispose();

    parentNameFocusNode?.dispose();
    parentNameTextController?.dispose();

    parentemailFocusNode?.dispose();
    parentemailTextController?.dispose();
  }
}
