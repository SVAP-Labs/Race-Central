import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/scruitneer_nav_bar/scruitneer_nav_bar_widget.dart';
import '/index.dart';
import 'scruitneer_landing_widget.dart' show ScruitneerLandingWidget;
import 'package:flutter/material.dart';

class ScruitneerLandingModel extends FlutterFlowModel<ScruitneerLandingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for scruitneerNavBar component.
  late ScruitneerNavBarModel scruitneerNavBarModel;

  @override
  void initState(BuildContext context) {
    scruitneerNavBarModel = createModel(context, () => ScruitneerNavBarModel());
  }

  @override
  void dispose() {
    scruitneerNavBarModel.dispose();
  }
}
