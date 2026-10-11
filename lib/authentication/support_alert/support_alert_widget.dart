import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'support_alert_model.dart';
export 'support_alert_model.dart';

/// Create a Component which shows a Information " Please Contact Scrutiny
/// Team for any Support "
class SupportAlertWidget extends StatefulWidget {
  const SupportAlertWidget({super.key});

  @override
  State<SupportAlertWidget> createState() => _SupportAlertWidgetState();
}

class _SupportAlertWidgetState extends State<SupportAlertWidget> {
  late SupportAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportAlertModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent1,
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Icon(
                Icons.support_agent,
                color: FlutterFlowTheme.of(context).primary,
                size: 28.0,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Need Support?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                Text(
                  'Please Contact Race Organiser or Write to admin@Ranbolt',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
