import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'j_k_registration_component_model.dart';
export 'j_k_registration_component_model.dart';

/// Create a component which gets the data from user like Entry Category
/// dropDown , Entry Competition Number .
///
/// with a Button called cancel and Register for scruitny .
class JKRegistrationComponentWidget extends StatefulWidget {
  const JKRegistrationComponentWidget({
    super.key,
    required this.pEventUD,
    required this.pChmpshipID,
    required this.pBanner,
    required this.pLateFeeDate,
    required this.eventpColour,
    required this.eventpText,
    this.eventNote,
    bool? enableNote,
  }) : this.enableNote = enableNote ?? false;

  final String? pEventUD;
  final String? pChmpshipID;
  final String? pBanner;
  final DateTime? pLateFeeDate;
  final String? eventpColour;
  final String? eventpText;
  final String? eventNote;
  final bool enableNote;

  @override
  State<JKRegistrationComponentWidget> createState() =>
      _JKRegistrationComponentWidgetState();
}

class _JKRegistrationComponentWidgetState
    extends State<JKRegistrationComponentWidget> {
  late JKRegistrationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JKRegistrationComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventCategoriesRow>>(
      future: EventCategoriesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'event_id',
              widget.pEventUD,
            )
            .order('category_order', ascending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitWave(
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
              ),
            ),
          );
        }
        List<EventCategoriesRow> containerEventCategoriesRowList =
            snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 0.0,
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Event Registration',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                    Text(
                      'Please fill in the details below to  Register for the event.',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Entry Category',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.categoryValueController ??=
                                FormFieldController<String>(null),
                            options: containerEventCategoriesRowList
                                .map((e) => e.categoryName)
                                .toList(),
                            onChanged: (val) =>
                                safeSetState(() => _model.categoryValue = val),
                            width: 200.0,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            hintText: 'Select Category...',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 32.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 5.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                            hoverColor: FlutterFlowTheme.of(context).error,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.queryExistingApplication =
                                await EventRegistrationsTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'driver_id',
                                    valueOrDefault(
                                        currentUserDocument?.supaBaseUID, ''),
                                  )
                                  .eqOrNull(
                                    'event_id',
                                    widget.pEventUD,
                                  )
                                  .eqOrNull(
                                    'category',
                                    _model.categoryValue,
                                  ),
                            );
                            if (_model.queryExistingApplication?.firstOrNull !=
                                null) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text(
                                          'Check Registered Events Tab !!'),
                                      content: Text(
                                          'You have already registered for this category in the selected event.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              var confirmDialogResponse = await showDialog<
                                      bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title:
                                              Text('Register for the Event  !'),
                                          content: Text(
                                              'Proceed to Register for the Event !!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ) ??
                                  false;
                              if (confirmDialogResponse) {
                                _model.entryApplicationCreated =
                                    await EventRegistrationsTable().insert({
                                  'driver_id': valueOrDefault(
                                      currentUserDocument?.supaBaseUID, ''),
                                  'event_id': widget.pEventUD,
                                  'category': _model.categoryValue,
                                  'registered_at': supaSerialize<DateTime>(
                                      getCurrentTimestamp),
                                  'status': 'pending_submission',
                                  'championship_id': widget.pChmpshipID,
                                });
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text(
                                            'Registration form created !!'),
                                        content: Text(
                                            'Please complete the registration .Check in Registered Events tab .'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );

                                context.goNamed(
                                  JKRegistrationWidget.routeName,
                                  queryParameters: {
                                    'eventID': serializeParam(
                                      _model.entryApplicationCreated?.eventId,
                                      ParamType.String,
                                    ),
                                    'driverID': serializeParam(
                                      _model.entryApplicationCreated?.driverId,
                                      ParamType.String,
                                    ),
                                    'category': serializeParam(
                                      _model.entryApplicationCreated?.category,
                                      ParamType.String,
                                    ),
                                    'banner': serializeParam(
                                      widget.pBanner,
                                      ParamType.String,
                                    ),
                                    'eventpColour': serializeParam(
                                      widget.eventpColour,
                                      ParamType.String,
                                    ),
                                    'eventpText': serializeParam(
                                      widget.eventpText,
                                      ParamType.String,
                                    ),
                                    'enableNote': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'isReadOnly': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            }

                            safeSetState(() {});
                          },
                          text: 'Register',
                          options: FFButtonOptions(
                            width: 180.0,
                            height: 32.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 10.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                            hoverColor: FlutterFlowTheme.of(context).success,
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
