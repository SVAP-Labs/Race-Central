import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/driver_nav_bar/driver_nav_bar_widget.dart';
import '/index.dart';
import 'user_home_page_widget.dart' show UserHomePageWidget;
import 'package:flutter/material.dart';

class UserHomePageModel extends FlutterFlowModel<UserHomePageWidget> {
  ///  Local state fields for this page.

  bool isRegistered = false;

  ///  State fields for stateful widgets in this page.

  // Model for driverNavBar component.
  late DriverNavBarModel driverNavBarModel;

  @override
  void initState(BuildContext context) {
    driverNavBarModel = createModel(context, () => DriverNavBarModel());
  }

  @override
  void dispose() {
    driverNavBarModel.dispose();
  }
}
