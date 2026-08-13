import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/scruitneer_nav_bar/scruitneer_nav_bar_widget.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'sealing_search_widget.dart' show SealingSearchWidget;
import 'package:flutter/material.dart';

class SealingSearchModel extends FlutterFlowModel<SealingSearchWidget> {
  ///  State fields for stateful widgets in this page.

  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<SealingRow>? searchBoxCylinder;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<SealingRow>? searchBoxQuery;
  // State field(s) for Cylinder widget.
  bool? cylinderValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for scrutineerNavBar.
  late ScruitneerNavBarModel scrutineerNavBarModel;

  /// Query cache managers for this widget.

  final _draftSealingQueryManager = FutureRequestManager<List<SealingRow>>();
  Future<List<SealingRow>> draftSealingQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SealingRow>> Function() requestFn,
  }) =>
      _draftSealingQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDraftSealingQueryCache() => _draftSealingQueryManager.clear();
  void clearDraftSealingQueryCacheKey(String? uniqueKey) =>
      _draftSealingQueryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    scrutineerNavBarModel = createModel(context, () => ScruitneerNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    scrutineerNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearDraftSealingQueryCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
