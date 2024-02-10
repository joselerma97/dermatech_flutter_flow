import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'camera_widget.dart' show CameraWidget;
import 'package:flutter/material.dart';

class CameraModel extends FlutterFlowModel<CameraWidget> {
  ///  Local state fields for this page.

  String imageUrl = '*';

  List<String> imagePredictions = [];
  void addToImagePredictions(String item) => imagePredictions.add(item);
  void removeFromImagePredictions(String item) => imagePredictions.remove(item);
  void removeAtIndexFromImagePredictions(int index) =>
      imagePredictions.removeAt(index);
  void insertAtIndexInImagePredictions(int index, String item) =>
      imagePredictions.insert(index, item);
  void updateImagePredictionsAtIndex(int index, Function(String) updateFn) =>
      imagePredictions[index] = updateFn(imagePredictions[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (fullPrediction)] action in Button widget.
  ApiCallResponse? apiResult4c6;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
