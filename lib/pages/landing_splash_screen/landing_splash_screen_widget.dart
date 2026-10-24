import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'landing_splash_screen_model.dart';
export 'landing_splash_screen_model.dart';

/// Create a Page which shall show a load animation , the purpose of the
/// screen is like a splash screen .
///
/// The loading animation shall have a motosport theme .
class LandingSplashScreenWidget extends StatefulWidget {
  const LandingSplashScreenWidget({super.key});

  static String routeName = 'landingSplashScreen';
  static String routePath = '/landingSplashScreen';

  @override
  State<LandingSplashScreenWidget> createState() =>
      _LandingSplashScreenWidgetState();
}

class _LandingSplashScreenWidgetState extends State<LandingSplashScreenWidget> {
  late LandingSplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingSplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      await Future.wait([
        Future(() async {
          _model.updateStatus = await actions.forceUpdateCheck(
            context,
          );
          if ((currentUserDocument?.role == UserRole.Driver) &&
              (currentUserDocument?.dateOfBirth != null)) {
            if (FFAppState().userChoosenEvent != '') {
              context.goNamedAuth(
                UserHomePageWidget.routeName,
                context.mounted,
                queryParameters: {
                  'eventUID': serializeParam(
                    FFAppState().userChoosenEvent,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            } else {
              context.pushNamedAuth(
                  UserEventsListPageWidget.routeName, context.mounted);
            }
          } else if (currentUserDocument?.role == UserRole.Scruitneer) {
            context.goNamedAuth(
                ScruitneerLandingWidget.routeName, context.mounted);
          } else if (currentUserDocument?.role == UserRole.Sporting) {
            context.goNamedAuth(
                SportingLandingPageWidget.routeName, context.mounted);
          } else if (currentUserDocument?.role == null) {
            context.goNamedAuth(Auth2CreateWidget.routeName, context.mounted);
          } else if (currentUserDocument?.dateOfBirth == null) {
            context.pushNamedAuth(
                Auth2CreateProfileWidget.routeName, context.mounted);
          } else {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();
          }
        }),
        Future(() async {
          await Future.delayed(
            Duration(
              milliseconds: 9000,
            ),
          );
          _model.showRetry = true;
          safeSetState(() {});
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A1A1A), Colors.black],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(1.0, -1.0),
                      end: AlignmentDirectional(-1.0, 1.0),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/jsons/Speedometer.json',
                      width: 300.0,
                      height: 300.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                      child: Text(
                        'RACE CENTRAL',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFFF4444),
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: Text(
                        'RESULTS  .  LEADERBOARD  .  STATS',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              color: Color(0xFFCCCCCC),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                    LinearPercentIndicator(
                      percent: 0.7,
                      width: 250.0,
                      lineHeight: 4.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: Color(0xFFFF4444),
                      backgroundColor: Color(0xFF333333),
                      barRadius: Radius.circular(2.0),
                      padding: EdgeInsets.zero,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Loading your racing experience',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: Color(0xFF888888),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-0.8, -0.8),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: Color(0x33FF4444),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF4444), Color(0xFFFF0000)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.sports_motorsports,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, 0.7),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15.0,
                          color: Color(0x33FF6600),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFFF4444), Color(0xFFFF6600)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.speed,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.7, -0.6),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.0,
                          color: Color(0x33FF9900),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFFF4444), Color(0xFFFF9900)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.local_fire_department,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
                if (_model.showRetry)
                  Align(
                    alignment: AlignmentDirectional(-0.02, 0.84),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth(
                            Auth2LoginWidget.routeName, context.mounted);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 50.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12.0,
                              color: Color(0x33FF9900),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFFFFFF4444), Color(0xFFFF9900)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.center).flutterValue,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.replay,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                              Text(
                                'Taking longer ? Tap to login',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.visible,
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
