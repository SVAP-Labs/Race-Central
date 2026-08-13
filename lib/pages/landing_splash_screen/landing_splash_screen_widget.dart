import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
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
      _model.updateStatus = await actions.forceUpdateCheck(
        context,
      );
      if ((currentUserDocument?.role == UserRole.Driver) &&
          (currentUserDocument?.dateOfBirth != null)) {
        if (FFAppState().userChoosenEvent != '') {
          context.goNamed(
            UserHomePageWidget.routeName,
            queryParameters: {
              'eventUID': serializeParam(
                FFAppState().userChoosenEvent,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        } else {
          context.pushNamed(UserEventsListPageWidget.routeName);
        }
      } else if (currentUserDocument?.role == UserRole.Scruitneer) {
        context.goNamed(ScruitneerLandingWidget.routeName);
      } else if (currentUserDocument?.role == UserRole.Sporting) {
        context.goNamed(SportingLandingPageWidget.routeName);
      } else if (currentUserDocument?.role == null) {
        context.goNamed(Auth2CreateWidget.routeName);
      } else if (currentUserDocument?.dateOfBirth == null) {
        context.pushNamed(Auth2CreateProfileWidget.routeName);
      } else {
        context.goNamed(Auth2CreateWidget.routeName);
      }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
