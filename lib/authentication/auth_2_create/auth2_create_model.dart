import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth2_create_widget.dart' show Auth2CreateWidget;
import 'package:flutter/material.dart';

class Auth2CreateModel extends FlutterFlowModel<Auth2CreateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  late FocusNode passwordPasswordVisibilityFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirm_password widget.
  late FocusNode confirmPasswordPasswordVisibilityFocusNode;
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  AppUsersRow? createdUserRowInSupabase;

  @override
  void initState(BuildContext context) {
    passwordPasswordVisibilityFocusNode = FocusNode();
    passwordVisibility = false;
    confirmPasswordPasswordVisibilityFocusNode = FocusNode();
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
    passwordPasswordVisibilityFocusNode.dispose();
    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
    confirmPasswordPasswordVisibilityFocusNode.dispose();
  }
}
