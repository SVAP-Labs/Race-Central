import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/to_display_nothing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/driver_nav_bar/driver_nav_bar_widget.dart';
import '/pages/user_pages/event_details/event_details_widget.dart';
import '/pages/user_pages/iame_pages/iame_event_registration/iame_event_registration_widget.dart';
import '/pages/user_pages/meco_pages/event_registration_component/event_registration_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'user_events_list_page_model.dart';
export 'user_events_list_page_model.dart';

/// Create a Page which shows List of Events.
///
/// Each Event shall look llike a card
class UserEventsListPageWidget extends StatefulWidget {
  const UserEventsListPageWidget({super.key});

  static String routeName = 'userEventsListPage';
  static String routePath = '/user-events-list';

  @override
  State<UserEventsListPageWidget> createState() =>
      _UserEventsListPageWidgetState();
}

class _UserEventsListPageWidgetState extends State<UserEventsListPageWidget>
    with TickerProviderStateMixin {
  late UserEventsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserEventsListPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventsRow>>(
      stream: _model.userEventsListPageSupabaseStream ??= SupaFlow.client
          .from("events")
          .stream(primaryKey: ['event_uid'])
          .eqOrNull(
            'is_public',
            true,
          )
          .order('eventStartDate', ascending: true)
          .map((list) => list.map((item) => EventsRow(item)).toList()),
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
        List<EventsRow> userEventsListPageEventsRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Banner_Image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                centerTitle: false,
                toolbarHeight: 80.0,
                elevation: 5.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).accent2,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          indicatorWeight: 5.0,
                          tabs: [
                            Tab(
                              text: 'Upcoming Events',
                            ),
                            Tab(
                              text: 'Registered Events',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final upComingEvents =
                                            userEventsListPageEventsRowList
                                                .toList();
                                        if (upComingEvents.isEmpty) {
                                          return ToDisplayNothingWidget(
                                            icon: Icon(
                                              Icons.event,
                                              size: 32.0,
                                            ),
                                            message: 'No Events Listed !!',
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: upComingEvents.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, upComingEventsIndex) {
                                            final upComingEventsItem =
                                                upComingEvents[
                                                    upComingEventsIndex];
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Image.network(
                                                      getCORSProxyUrl(
                                                        upComingEventsItem
                                                            .eventCoverImage!,
                                                      ),
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 200.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          upComingEventsItem
                                                              .eventName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .calendar_today,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                size: 16.0,
                                                              ),
                                                              Text(
                                                                '${dateTimeFormat("yMMMd", upComingEventsItem.eventStartDate)} - ${dateTimeFormat("yMMMd", upComingEventsItem.eventEndDate)}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                size: 16.0,
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  upComingEventsItem
                                                                      .raceEventLocation,
                                                                  'NA',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.65,
                                                                              child: EventDetailsWidget(
                                                                                pEventUD: upComingEventsItem.eventUid!,
                                                                                pChmpshipID: upComingEventsItem.eventChampionship!,
                                                                                eventpColour: upComingEventsItem.eventPColour!,
                                                                                eventpText: upComingEventsItem.eventPText!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                text:
                                                                    'View Event Details',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 28.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      10.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  hoverColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  FFAppState()
                                                                          .userChoosenEvent =
                                                                      upComingEventsItem
                                                                          .eventUid!;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (upComingEventsItem
                                                                          .eventType ==
                                                                      'Karting_IAME') {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: IameEventRegistrationWidget(
                                                                                pEventUD: upComingEventsItem.eventUid!,
                                                                                pChmpshipID: upComingEventsItem.eventChampionship!,
                                                                                pBanner: upComingEventsItem.eventBanner!,
                                                                                pLateFeeDate: upComingEventsItem.evenLateFeeDate!,
                                                                                eventpColour: upComingEventsItem.eventPColour!,
                                                                                eventpText: upComingEventsItem.eventPText!,
                                                                                eventPayQR: upComingEventsItem.paymentQR!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  } else if (upComingEventsItem
                                                                          .eventType ==
                                                                      'Karting') {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: EventRegistrationComponentWidget(
                                                                                pEventUD: upComingEventsItem.eventUid!,
                                                                                pChmpshipID: upComingEventsItem.eventChampionship!,
                                                                                pBanner: upComingEventsItem.eventBanner!,
                                                                                pLateFeeDate: upComingEventsItem.evenLateFeeDate!,
                                                                                eventpColour: upComingEventsItem.eventPColour!,
                                                                                eventpText: upComingEventsItem.eventPText!,
                                                                                eventNote: valueOrDefault<String>(
                                                                                  upComingEventsItem.eventNotes,
                                                                                  '-',
                                                                                ),
                                                                                enableNote: upComingEventsItem.noteEnable,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                                text:
                                                                    'Register for Event',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 28.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      10.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  hoverColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FutureBuilder<
                                          List<EventRegistrationsRow>>(
                                        future:
                                            EventRegistrationsTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'driver_id',
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.supaBaseUID,
                                                    ''),
                                              )
                                              .eqOrNull(
                                                'isEventCompleted',
                                                false,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<EventRegistrationsRow>
                                              listViewEventRegistrationsRowList =
                                              snapshot.data!;

                                          if (listViewEventRegistrationsRowList
                                              .isEmpty) {
                                            return Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: Image.asset(
                                                  'assets/images/grids_empty.png',
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              16.0,
                                              0,
                                              16.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewEventRegistrationsRowList
                                                    .length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 16.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewEventRegistrationsRow =
                                                  listViewEventRegistrationsRowList[
                                                      listViewIndex];
                                              return FutureBuilder<
                                                  List<EventsRow>>(
                                                future: EventsTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'event_uid',
                                                    listViewEventRegistrationsRow
                                                        .eventId,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<EventsRow>
                                                      cardEventsRowList =
                                                      snapshot.data!;

                                                  final cardEventsRow =
                                                      cardEventsRowList
                                                              .isNotEmpty
                                                          ? cardEventsRowList
                                                              .first
                                                          : null;

                                                  return Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            getCORSProxyUrl(
                                                              cardEventsRow!
                                                                  .eventCoverImage!,
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 200.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.7,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          cardEventsRow
                                                                              .eventName,
                                                                          'Event Loading ...',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Text(
                                                                      '${dateTimeFormat("yMMMd", cardEventsRow.eventStartDate)} - ${dateTimeFormat("yMMMd", cardEventsRow.eventEndDate)}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        cardEventsRow
                                                                            .raceEventLocation,
                                                                        'Loading ...',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .groups_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewEventRegistrationsRow
                                                                            .teamName,
                                                                        'Loading ...',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.category,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              listViewEventRegistrationsRow.category,
                                                                              'Loading..',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      listViewEventRegistrationsRow
                                                                              .status ==
                                                                          'approved',
                                                                      false,
                                                                    )) {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              ' Registration Approved !  Check Race Tab !!',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.done_all_rounded,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                10.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else if (valueOrDefault<
                                                                        bool>(
                                                                      listViewEventRegistrationsRow
                                                                              .status ==
                                                                          'submitted',
                                                                      false,
                                                                    )) {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            _model.selectedEventReg =
                                                                                await EventsTable().queryRows(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'event_uid',
                                                                                listViewEventRegistrationsRow.eventId,
                                                                              ),
                                                                            );
                                                                            if (_model.selectedEvent?.firstOrNull?.eventType ==
                                                                                'Karting_IAME') {
                                                                              context.pushNamed(
                                                                                IameRegistrationWidget.routeName,
                                                                                queryParameters: {
                                                                                  'eventID': serializeParam(
                                                                                    listViewEventRegistrationsRow.eventId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'driverID': serializeParam(
                                                                                    listViewEventRegistrationsRow.driverId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'category': serializeParam(
                                                                                    listViewEventRegistrationsRow.category,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'banner': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.eventBanner,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'lateFeeDate': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.evenLateFeeDate,
                                                                                    ParamType.DateTime,
                                                                                  ),
                                                                                  'eventpColour': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.eventPColour,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'eventpText': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.eventPText,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'paymentQR': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.paymentQR,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            } else {
                                                                              context.pushNamed(
                                                                                MecoRegistrationWidget.routeName,
                                                                                queryParameters: {
                                                                                  'eventID': serializeParam(
                                                                                    listViewEventRegistrationsRow.eventId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'driverID': serializeParam(
                                                                                    listViewEventRegistrationsRow.driverId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'category': serializeParam(
                                                                                    listViewEventRegistrationsRow.category,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'banner': serializeParam(
                                                                                    cardEventsRow.eventBanner,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'lateFeeDate': serializeParam(
                                                                                    cardEventsRow.evenLateFeeDate,
                                                                                    ParamType.DateTime,
                                                                                  ),
                                                                                  'eventpColour': serializeParam(
                                                                                    cardEventsRow.eventPColour,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'eventpText': serializeParam(
                                                                                    cardEventsRow.eventPText,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'eventNote': serializeParam(
                                                                                    cardEventsRow.eventNotes,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'enableNote': serializeParam(
                                                                                    cardEventsRow.noteEnable,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              'View Registration',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.auto_stories,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                10.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else if (valueOrDefault<
                                                                        bool>(
                                                                      listViewEventRegistrationsRow
                                                                              .status ==
                                                                          'rejected',
                                                                      false,
                                                                    )) {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              'Withdrew / Rejected',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.close,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                10.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            _model.selectedEvent =
                                                                                await EventsTable().queryRows(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'event_uid',
                                                                                listViewEventRegistrationsRow.eventId,
                                                                              ),
                                                                            );
                                                                            if (_model.selectedEvent?.firstOrNull?.eventType ==
                                                                                'Karting_IAME') {
                                                                              context.pushNamed(
                                                                                IameRegistrationWidget.routeName,
                                                                                queryParameters: {
                                                                                  'eventID': serializeParam(
                                                                                    listViewEventRegistrationsRow.eventId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'driverID': serializeParam(
                                                                                    listViewEventRegistrationsRow.driverId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'category': serializeParam(
                                                                                    listViewEventRegistrationsRow.category,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'banner': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.eventBanner,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'lateFeeDate': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.evenLateFeeDate,
                                                                                    ParamType.DateTime,
                                                                                  ),
                                                                                  'eventpColour': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.eventPColour,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'eventpText': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.eventPText,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'paymentQR': serializeParam(
                                                                                    _model.selectedEvent?.firstOrNull?.paymentQR,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            } else {
                                                                              context.pushNamed(
                                                                                MecoRegistrationWidget.routeName,
                                                                                queryParameters: {
                                                                                  'eventID': serializeParam(
                                                                                    listViewEventRegistrationsRow.eventId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'driverID': serializeParam(
                                                                                    listViewEventRegistrationsRow.driverId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'category': serializeParam(
                                                                                    listViewEventRegistrationsRow.category,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'banner': serializeParam(
                                                                                    cardEventsRow.eventBanner,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'lateFeeDate': serializeParam(
                                                                                    cardEventsRow.evenLateFeeDate,
                                                                                    ParamType.DateTime,
                                                                                  ),
                                                                                  'eventpColour': serializeParam(
                                                                                    cardEventsRow.eventPColour,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'eventpText': serializeParam(
                                                                                    cardEventsRow.eventPText,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'eventNote': serializeParam(
                                                                                    cardEventsRow.eventNotes,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'enableNote': serializeParam(
                                                                                    cardEventsRow.noteEnable,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              'Continue Registration',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.send,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                10.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            hoverColor:
                                                                                FlutterFlowTheme.of(context).success,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.driverNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: DriverNavBarWidget(),
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
