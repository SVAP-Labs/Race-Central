import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'live_timing_view_model.dart';
export 'live_timing_view_model.dart';

class LiveTimingViewWidget extends StatefulWidget {
  const LiveTimingViewWidget({
    super.key,
    required this.eventID,
  });

  final String? eventID;

  static String routeName = 'liveTimingView';
  static String routePath = '/liveTimingView';

  @override
  State<LiveTimingViewWidget> createState() => _LiveTimingViewWidgetState();
}

class _LiveTimingViewWidgetState extends State<LiveTimingViewWidget> {
  late LiveTimingViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveTimingViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventsRow>>(
      future: EventsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'event_uid',
          widget.eventID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitWave(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<EventsRow> liveTimingViewEventsRowList = snapshot.data!;

        final liveTimingViewEventsRow = liveTimingViewEventsRowList.isNotEmpty
            ? liveTimingViewEventsRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              title: Text(
                'Live Timing',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w500,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 15.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 50.0),
                      child: FlutterFlowWebView(
                        content: liveTimingViewEventsRow!.eventLiveTimingLink!,
                        width: MediaQuery.sizeOf(context).width * 0.95,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        verticalScroll: true,
                        horizontalScroll: false,
                      ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
