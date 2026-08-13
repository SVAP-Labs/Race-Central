import '/flutter_flow/flutter_flow_util.dart';
import '/pages/user_pages/function_pages/track_info/track_stat/track_stat_widget.dart';
import 'trackdetails_widget.dart' show TrackdetailsWidget;
import 'package:flutter/material.dart';

class TrackdetailsModel extends FlutterFlowModel<TrackdetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TrackStat.
  late TrackStatModel trackStatModel1;
  // Model for TrackStat.
  late TrackStatModel trackStatModel2;
  // Model for TrackStat.
  late TrackStatModel trackStatModel3;

  @override
  void initState(BuildContext context) {
    trackStatModel1 = createModel(context, () => TrackStatModel());
    trackStatModel2 = createModel(context, () => TrackStatModel());
    trackStatModel3 = createModel(context, () => TrackStatModel());
  }

  @override
  void dispose() {
    trackStatModel1.dispose();
    trackStatModel2.dispose();
    trackStatModel3.dispose();
  }
}
