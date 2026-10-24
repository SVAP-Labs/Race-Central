import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'with_a_drop_page_model.dart';
export 'with_a_drop_page_model.dart';

/// Create a Page with a drop down as Driver or Karting and another Drop down
/// as OK/NOK and a Search button .
///
/// On Clicking Search Button it shows list of Result which contains #Number ,
/// Name , ReviewStatus
class WithADropPageWidget extends StatefulWidget {
  const WithADropPageWidget({
    super.key,
    required this.eventID,
    required this.champshipID,
  });

  final String? eventID;
  final String? champshipID;

  static String routeName = 'WithADropPage';
  static String routePath = '/ScrutinySummary';

  @override
  State<WithADropPageWidget> createState() => _WithADropPageWidgetState();
}

class _WithADropPageWidgetState extends State<WithADropPageWidget> {
  late WithADropPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WithADropPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventRegistrationsRow>>(
      future: EventRegistrationsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'event_id',
              widget.eventID,
            )
            .eqOrNull(
              'somOK',
              true,
            )
            .eqOrNull(
              'teamName',
              _model.psSelectedTeam,
            )
            .inFilterOrNull(
              'isScrutineerOK',
              [false, true],
            )
            .eqOrNull(
              'isScrutineerOK',
              _model.psSelectedStatus,
            )
            .eqOrNull(
              'category',
              _model.psCategory,
            )
            .order('entry_number', ascending: true),
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
        List<EventRegistrationsRow> withADropPageEventRegistrationsRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
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
              title: GradientText(
                'Scrutiny Summary',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                colors: [
                  FlutterFlowTheme.of(context).secondaryText,
                  FlutterFlowTheme.of(context).error,
                  FlutterFlowTheme.of(context).secondaryText
                ],
                gradientDirection: GradientDirection.ltr,
                gradientType: GradientType.linear,
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FutureBuilder<
                                              List<ChampionshipTeamsRow>>(
                                            future: ChampionshipTeamsTable()
                                                .queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'chship_id',
                                                widget.champshipID,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitWave(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChampionshipTeamsRow>
                                                  teamDropdownChampionshipTeamsRowList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .teamDropdownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.teamDropdownValue ??=
                                                      'ALL',
                                                ),
                                                options: functions.addAllToDropdown(
                                                    teamDropdownChampionshipTeamsRowList
                                                        .map((e) => e.teamName)
                                                        .toList(),
                                                    'ALL')!,
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                      .teamDropdownValue = val);
                                                  _model.psSelectedTeam =
                                                      _model.teamDropdownValue;
                                                  safeSetState(() {});
                                                  if (_model.psSelectedTeam ==
                                                      'ALL') {
                                                    _model.psSelectedTeam =
                                                        null;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                height: 30.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.4,
                                                        ),
                                                hintText: 'Team',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 1.0,
                                                borderRadius: 16.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(width: 20.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FutureBuilder<
                                              List<EventCategoriesRow>>(
                                            future: EventCategoriesTable()
                                                .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'event_id',
                                                    widget.eventID,
                                                  )
                                                  .order('category_order',
                                                      ascending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitWave(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EventCategoriesRow>
                                                  categoryDropDownEventCategoriesRowList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .categoryDropDownValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: functions.addAllToDropdown(
                                                    categoryDropDownEventCategoriesRowList
                                                        .map((e) =>
                                                            e.categoryName)
                                                        .toList(),
                                                    'ALL')!,
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .categoryDropDownValue =
                                                      val);
                                                  if (_model
                                                          .categoryDropDownValue ==
                                                      'ALL') {
                                                    _model.psCategory = null;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.psCategory = _model
                                                        .categoryDropDownValue;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                width: 200.0,
                                                height: 30.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                hintText: 'All Categories',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 16.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .statusDropdownValueController ??=
                                                  FormFieldController<String>(
                                                _model.statusDropdownValue ??=
                                                    'ALL',
                                              ),
                                              options: List<String>.from(
                                                  ['ALL', 'TRUE', 'FALSE']),
                                              optionLabels: [
                                                'ALL',
                                                'OK',
                                                'Pending'
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .statusDropdownValue = val);
                                                if (_model
                                                        .statusDropdownValue ==
                                                    'ALL') {
                                                  _model.psSelectedStatus =
                                                      null;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.psSelectedStatus =
                                                      _model.statusDropdownValue ==
                                                              'TRUE'
                                                          ? true
                                                          : false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.25,
                                              height: 30.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                              hintText: 'NOK',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 1.0,
                                              borderRadius: 16.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Total Entries',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  withADropPageEventRegistrationsRowList
                                                      .length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final driverList =
                                                  withADropPageEventRegistrationsRowList
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: driverList.length,
                                                itemBuilder:
                                                    (context, driverListIndex) {
                                                  final driverListItem =
                                                      driverList[
                                                          driverListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 8.0,
                                                            color: Color(
                                                                0x1A000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                            Color(0xFF34495E)
                                                                          ],
                                                                          stops: [
                                                                            0.0,
                                                                            1.0
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          end: AlignmentDirectional(
                                                                              -1.0,
                                                                              0),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 70.0,
                                                                                height: 44.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x33FFFFFF),
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(8.0),
                                                                                    child: Text(
                                                                                      '#${driverListItem.entryNumber?.toString()}',
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            font: GoogleFonts.interTight(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: FutureBuilder<List<AppUsersRow>>(
                                                                                      future: AppUsersTable().querySingleRow(
                                                                                        queryFn: (q) => q.eqOrNull(
                                                                                          'id',
                                                                                          driverListItem.driverId,
                                                                                        ),
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
                                                                                        List<AppUsersRow> textAppUsersRowList = snapshot.data!;

                                                                                        final textAppUsersRow = textAppUsersRowList.isNotEmpty ? textAppUsersRowList.first : null;

                                                                                        return Text(
                                                                                          valueOrDefault<String>(
                                                                                            textAppUsersRow?.name,
                                                                                            '-',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.interTight(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      driverListItem.teamName,
                                                                                      '-',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xCCFFFFFF),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (driverListItem.driverOK! && driverListItem.kartOK!) {
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 70.0,
                                                                                    height: 28.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        'OK',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 70.0,
                                                                                    height: 28.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFE67E22),
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Pending',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .category_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          driverListItem
                                                                              .category,
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        driverListItem
                                                                            .driverOK,
                                                                        false,
                                                                      ))
                                                                        Icon(
                                                                          Icons
                                                                              .sports_motorsports_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        driverListItem
                                                                            .kartOK,
                                                                        false,
                                                                      ))
                                                                        Icon(
                                                                          Icons
                                                                              .directions_car_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.queriedEventCategory =
                                                                            await ChampionshipCategoriesTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .eqOrNull(
                                                                                'category_name',
                                                                                driverListItem.category,
                                                                              )
                                                                              .eqOrNull(
                                                                                'chship_id',
                                                                                widget.champshipID,
                                                                              ),
                                                                        );
                                                                        if (_model.queriedEventCategory?.firstOrNull?.categoryType ==
                                                                            'karting') {
                                                                          context
                                                                              .pushNamed(
                                                                            KartDriverScrutinycheckWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'pCategory': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else if ((_model.queriedEventCategory?.firstOrNull?.categoryType == 'touring') ||
                                                                            (_model.queriedEventCategory?.firstOrNull?.categoryType ==
                                                                                'f4') ||
                                                                            (_model.queriedEventCategory?.firstOrNull?.categoryType ==
                                                                                'onemake_4w')) {
                                                                          context
                                                                              .pushNamed(
                                                                            AdultDriverScrutinycheckWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'pCategory': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else if (_model.queriedEventCategory?.firstOrNull?.categoryType ==
                                                                            'onemake_2w') {
                                                                          context
                                                                              .pushNamed(
                                                                            TwoWheelDriverScrutinycheckWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'pCategory': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: Text('Error'),
                                                                                  content: Text('Error in Fetching category '),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          context
                                                                              .pushNamed(
                                                                            KartDriverScrutinycheckWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'pCategory': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Driver Scrutiny',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .person_outline_rounded,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            35.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        color: Color(
                                                                            0x1A6C63FC),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            10.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.queriedEventCategoryVheicle =
                                                                            await ChampionshipCategoriesTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .eqOrNull(
                                                                                'category_name',
                                                                                driverListItem.category,
                                                                              )
                                                                              .eqOrNull(
                                                                                'chship_id',
                                                                                widget.champshipID,
                                                                              ),
                                                                        );
                                                                        if (_model.queriedEventCategoryVheicle?.firstOrNull?.categoryType ==
                                                                            'touring') {
                                                                          context
                                                                              .pushNamed(
                                                                            TouringVehicleScrutinyWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'kartScrutinyID': serializeParam(
                                                                                driverListItem.kartScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegistrationID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'category': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'isTurboAllowed': serializeParam(
                                                                                _model.queriedEventCategoryVheicle?.firstOrNull?.isTurboAllowed,
                                                                                ParamType.bool,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else if (_model.queriedEventCategoryVheicle?.firstOrNull?.categoryType ==
                                                                            'karting') {
                                                                          context
                                                                              .pushNamed(
                                                                            KartScrutinycheckWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'kartScrutinyID': serializeParam(
                                                                                driverListItem.kartScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegistrationID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'category': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else if (_model.queriedEventCategoryVheicle?.firstOrNull?.categoryType ==
                                                                            'f4') {
                                                                          context
                                                                              .pushNamed(
                                                                            OpenWheelVehicleScrutinyWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'kartScrutinyID': serializeParam(
                                                                                driverListItem.kartScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegistrationID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'category': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else if (_model.queriedEventCategoryVheicle?.firstOrNull?.categoryType ==
                                                                            'onemake_2w') {
                                                                          context
                                                                              .pushNamed(
                                                                            TwoWheelerScrutinyWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'kartScrutinyID': serializeParam(
                                                                                driverListItem.kartScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegistrationID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'category': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else if (_model.queriedEventCategoryVheicle?.firstOrNull?.categoryType ==
                                                                            'onemake_4w') {
                                                                          context
                                                                              .pushNamed(
                                                                            Onemake4WScrutinyFormWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'kartScrutinyID': serializeParam(
                                                                                driverListItem.kartScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegistrationID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'category': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                              'isTurboAllowed': serializeParam(
                                                                                _model.queriedEventCategoryVheicle?.firstOrNull?.isTurboAllowed,
                                                                                ParamType.bool,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            KartScrutinycheckWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'kartScrutinyID': serializeParam(
                                                                                driverListItem.kartScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'eventRegistrationID': serializeParam(
                                                                                driverListItem.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'driverScrutinyID': serializeParam(
                                                                                driverListItem.driverScrutinyId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'category': serializeParam(
                                                                                driverListItem.category,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Vehicle Scrutiny',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .directions_car_outlined,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            35.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconColor:
                                                                            Color(0xFFFF6B35),
                                                                        color: Color(
                                                                            0x1AFF6B35),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFFFF6B35),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFFF6B35),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Driver : ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.7,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              DriverScrutinyRow>>(
                                                                        future:
                                                                            DriverScrutinyTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eqOrNull(
                                                                            'registration_id',
                                                                            driverListItem.id,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<DriverScrutinyRow>
                                                                              textDriverScrutinyRowList =
                                                                              snapshot.data!;

                                                                          final textDriverScrutinyRow = textDriverScrutinyRowList.isNotEmpty
                                                                              ? textDriverScrutinyRowList.first
                                                                              : null;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              textDriverScrutinyRow?.remarks,
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Kart : ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.7,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              KartScrutinyCheckRow>>(
                                                                        future:
                                                                            KartScrutinyCheckTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eqOrNull(
                                                                            'registration_id',
                                                                            driverListItem.id,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<KartScrutinyCheckRow>
                                                                              textKartScrutinyCheckRowList =
                                                                              snapshot.data!;

                                                                          final textKartScrutinyCheckRow = textKartScrutinyCheckRowList.isNotEmpty
                                                                              ? textKartScrutinyCheckRowList.first
                                                                              : null;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              textKartScrutinyCheckRow?.remarks,
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 1.0,
                        child: custom_widgets.BackButtonOverrider(
                          width: 1.0,
                          height: 1.0,
                          onBack: () async {
                            context.goNamed(ScruitneerLandingWidget.routeName);
                          },
                        ),
                      ),
                    ],
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
