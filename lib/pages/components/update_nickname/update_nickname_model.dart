import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_nickname_widget.dart' show UpdateNicknameWidget;
import 'package:flutter/material.dart';

class UpdateNicknameModel extends FlutterFlowModel<UpdateNicknameWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for newNickname widget.
  FocusNode? newNicknameFocusNode;
  TextEditingController? newNicknameController;
  String? Function(BuildContext, String?)? newNicknameControllerValidator;
  // Stores action output result for [Backend Call - API (updateNickname)] action in Button widget.
  ApiCallResponse? nicknameUpdate;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newNicknameFocusNode?.dispose();
    newNicknameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
