import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/driver_nav_bar/driver_nav_bar_widget.dart';
import '/index.dart';
import 'user_events_list_page_widget.dart' show UserEventsListPageWidget;
import 'package:flutter/material.dart';

class UserEventsListPageModel
    extends FlutterFlowModel<UserEventsListPageWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<EventsRow>>? userEventsListPageSupabaseStream;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventsRow>? selectedEventReg;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventsRow>? selectedEvent;
  // Model for driverNavBar component.
  late DriverNavBarModel driverNavBarModel;

  @override
  void initState(BuildContext context) {
    driverNavBarModel = createModel(context, () => DriverNavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    driverNavBarModel.dispose();
  }
}
