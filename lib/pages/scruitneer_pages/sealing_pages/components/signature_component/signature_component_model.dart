import '/flutter_flow/flutter_flow_util.dart';
import 'signature_component_widget.dart' show SignatureComponentWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureComponentModel
    extends FlutterFlowModel<SignatureComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Sign widget.
  SignatureController? signController;
  String uploadedSignatureUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signController?.dispose();
  }
}
