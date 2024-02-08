import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recommendation_widget.dart' show RecommendationWidget;
import 'package:flutter/material.dart';

class RecommendationModel extends FlutterFlowModel<RecommendationWidget> {
  ///  Local state fields for this page.

  List<ProductInfoStruct> productRecommendation = [];
  void addToProductRecommendation(ProductInfoStruct item) =>
      productRecommendation.add(item);
  void removeFromProductRecommendation(ProductInfoStruct item) =>
      productRecommendation.remove(item);
  void removeAtIndexFromProductRecommendation(int index) =>
      productRecommendation.removeAt(index);
  void insertAtIndexInProductRecommendation(
          int index, ProductInfoStruct item) =>
      productRecommendation.insert(index, item);
  void updateProductRecommendationAtIndex(
          int index, Function(ProductInfoStruct) updateFn) =>
      productRecommendation[index] = updateFn(productRecommendation[index]);

  bool isLoadingData = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchController?.dispose();
  }

  /// Action blocks are added here.

  Future searchProducts(BuildContext context) async {
    ApiCallResponse? apiProductsInfo;

    if (searchController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Add your prompt',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Searching products...',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      isLoadingData = true;
      FFAppState().update(() {});
      apiProductsInfo = await RecommendationGemeniCall.call(
        prompt: searchController.text,
      );
      if ((apiProductsInfo.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Info Retrieved',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        productRecommendation = RecommendationGemeniCall.productsInfo(
          (apiProductsInfo.jsonBody ?? ''),
        )!
            .toList()
            .cast<ProductInfoStruct>();
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

      isLoadingData = false;
      FFAppState().update(() {});
    }
  }

  /// Additional helper methods are added here.
}
