import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_password_widget.dart' show UpdatePasswordWidget;
import 'package:flutter/material.dart';

class UpdatePasswordModel extends FlutterFlowModel<UpdatePasswordWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for passwordOld widget.
  FocusNode? passwordOldFocusNode;
  TextEditingController? passwordOldController;
  late bool passwordOldVisibility;
  String? Function(BuildContext, String?)? passwordOldControllerValidator;
  // State field(s) for passwordNew widget.
  FocusNode? passwordNewFocusNode;
  TextEditingController? passwordNewController;
  late bool passwordNewVisibility;
  String? Function(BuildContext, String?)? passwordNewControllerValidator;
  // State field(s) for passwordNew2 widget.
  FocusNode? passwordNew2FocusNode;
  TextEditingController? passwordNew2Controller;
  late bool passwordNew2Visibility;
  String? Function(BuildContext, String?)? passwordNew2ControllerValidator;
  // Stores action output result for [Backend Call - API (updateUserPassword)] action in Button widget.
  ApiCallResponse? updatePassswordResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordOldVisibility = false;
    passwordNewVisibility = false;
    passwordNew2Visibility = false;
  }

  @override
  void dispose() {
    passwordOldFocusNode?.dispose();
    passwordOldController?.dispose();

    passwordNewFocusNode?.dispose();
    passwordNewController?.dispose();

    passwordNew2FocusNode?.dispose();
    passwordNew2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
