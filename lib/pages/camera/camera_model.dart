import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/loading/loading_widget.dart';
import 'camera_widget.dart' show CameraWidget;
import 'package:flutter/material.dart';

class CameraModel extends FlutterFlowModel<CameraWidget> {
  ///  Local state fields for this page.

  String imageUrl = '*';

  List<PredResultStruct> imagePredictions = [];
  void addToImagePredictions(PredResultStruct item) =>
      imagePredictions.add(item);
  void removeFromImagePredictions(PredResultStruct item) =>
      imagePredictions.remove(item);
  void removeAtIndexFromImagePredictions(int index) =>
      imagePredictions.removeAt(index);
  void insertAtIndexInImagePredictions(int index, PredResultStruct item) =>
      imagePredictions.insert(index, item);
  void updateImagePredictionsAtIndex(
          int index, Function(PredResultStruct) updateFn) =>
      imagePredictions[index] = updateFn(imagePredictions[index]);

  bool isLoading = false;

  bool isProcessed = false;

  bool isPhotoUploaded = false;

  List<DoctorsInfoStruct> doctorsInfo = [];
  void addToDoctorsInfo(DoctorsInfoStruct item) => doctorsInfo.add(item);
  void removeFromDoctorsInfo(DoctorsInfoStruct item) =>
      doctorsInfo.remove(item);
  void removeAtIndexFromDoctorsInfo(int index) => doctorsInfo.removeAt(index);
  void insertAtIndexInDoctorsInfo(int index, DoctorsInfoStruct item) =>
      doctorsInfo.insert(index, item);
  void updateDoctorsInfoAtIndex(
          int index, Function(DoctorsInfoStruct) updateFn) =>
      doctorsInfo[index] = updateFn(doctorsInfo[index]);

  List<ProductInfoStruct> productInfo = [];
  void addToProductInfo(ProductInfoStruct item) => productInfo.add(item);
  void removeFromProductInfo(ProductInfoStruct item) =>
      productInfo.remove(item);
  void removeAtIndexFromProductInfo(int index) => productInfo.removeAt(index);
  void insertAtIndexInProductInfo(int index, ProductInfoStruct item) =>
      productInfo.insert(index, item);
  void updateProductInfoAtIndex(
          int index, Function(ProductInfoStruct) updateFn) =>
      productInfo[index] = updateFn(productInfo[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (fullPrediction)] action in Button widget.
  ApiCallResponse? apiResult4c6;
  // Stores action output result for [Backend Call - API (getDoctors)] action in Button widget.
  ApiCallResponse? getDoctorsApi;
  // Stores action output result for [Backend Call - API (getProductRecommendationByScan)] action in Button widget.
  ApiCallResponse? productsResults;
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
    loadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
