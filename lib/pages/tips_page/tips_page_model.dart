import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/loading/loading_widget.dart';
import 'tips_page_widget.dart' show TipsPageWidget;
import 'package:flutter/material.dart';

class TipsPageModel extends FlutterFlowModel<TipsPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String tips = '-';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  // Model for loading component.
  late LoadingModel loadingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchController?.dispose();

    loadingModel.dispose();
  }

  /// Action blocks are added here.

  Future searchTips(BuildContext context) async {
    ApiCallResponse? apiResultwtn;

    if (searchController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Write your prompt',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    } else {
      isLoading = true;
      FFAppState().update(() {});
      apiResultwtn = await GetTipsCall.call(
        prompt: searchController.text,
      );
      if ((apiResultwtn.succeeded ?? true)) {
        tips = GetTipsCall.tips(
          (apiResultwtn.jsonBody ?? ''),
        )!;
        isLoading = false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Server Error',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    }

    FFAppState().update(() {});
  }

  /// Additional helper methods are added here.
}
