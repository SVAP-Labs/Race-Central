import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'j_k_registration_component_widget.dart'
    show JKRegistrationComponentWidget;
import 'package:flutter/material.dart';

class JKRegistrationComponentModel
    extends FlutterFlowModel<JKRegistrationComponentWidget> {
  ///  Local state fields for this component.

  bool? psIsUserAlreadyRegistered;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventRegistrationsRow>? queryExistingApplication;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  EventRegistrationsRow? entryApplicationCreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
