import '/backend/supabase/supabase.dart';
import '/components/to_display_nothing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/user_pages/function_pages/as_a_pdf/as_a_pdf_widget.dart';
import '/pages/user_pages/function_pages/session_tile/session_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notice_board_page_model.dart';
export 'notice_board_page_model.dart';

/// Create a Page with list of tiles .
///
/// In the top it shall pass argument and dis play the name .
class NoticeBoardPageWidget extends StatefulWidget {
  const NoticeBoardPageWidget({
    super.key,
    required this.eventId,
    required this.eventName,
  });

  final String? eventId;
  final String? eventName;

  static String routeName = 'noticeBoardPage';
  static String routePath = '/NoticeBoard';

  @override
  State<NoticeBoardPageWidget> createState() => _NoticeBoardPageWidgetState();
}

class _NoticeBoardPageWidgetState extends State<NoticeBoardPageWidget> {
  late NoticeBoardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoticeBoardPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventNoticeboardRow>>(
      future: EventNoticeboardTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'event_id',
              widget.eventId,
            )
            .order('notice_order'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<EventNoticeboardRow> noticeBoardPageEventNoticeboardRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              title: Text(
                'Notice Board',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 10.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.eventName,
                                      'Event Name Loading ..',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final listOfNotice =
                                          noticeBoardPageEventNoticeboardRowList
                                              .map((e) => e)
                                              .toList();
                                      if (listOfNotice.isEmpty) {
                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: ToDisplayNothingWidget(
                                            icon: Icon(
                                              Icons.sticky_note_2_outlined,
                                              size: 25.0,
                                            ),
                                            message: 'No Notice Available',
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listOfNotice.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 15.0),
                                        itemBuilder:
                                            (context, listOfNoticeIndex) {
                                          final listOfNoticeItem =
                                              listOfNotice[listOfNoticeIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.85,
                                                          child: AsAPdfWidget(
                                                            fileName:
                                                                listOfNoticeItem
                                                                    .noticeTitle,
                                                            fileUrl:
                                                                listOfNoticeItem
                                                                    .fileUrl,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: SessionTileWidget(
                                              key: Key(
                                                  'Key7w8_${listOfNoticeIndex}_of_${listOfNotice.length}'),
                                              accent: Color(0xFFE57F15),
                                              icon: Icon(
                                                Icons.notification_add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              title:
                                                  listOfNoticeItem.noticeTitle,
                                              status: dateTimeFormat(
                                                  "dd-MM-y h:mm a",
                                                  listOfNoticeItem.publishedAt),
                                              time: listOfNoticeItem
                                                  .noticeDescription,
                                              disableSeondRow: false,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Container(
                                    height: 24.0,
                                    decoration: BoxDecoration(),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
