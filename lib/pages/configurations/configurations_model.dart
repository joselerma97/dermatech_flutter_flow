import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/loading/loading_widget.dart';
import 'configurations_widget.dart' show ConfigurationsWidget;
import 'package:flutter/material.dart';

class ConfigurationsModel extends FlutterFlowModel<ConfigurationsWidget> {
  ///  Local state fields for this page.

  List<DeviceInfoStruct> devices = [];
  void addToDevices(DeviceInfoStruct item) => devices.add(item);
  void removeFromDevices(DeviceInfoStruct item) => devices.remove(item);
  void removeAtIndexFromDevices(int index) => devices.removeAt(index);
  void insertAtIndexInDevices(int index, DeviceInfoStruct item) =>
      devices.insert(index, item);
  void updateDevicesAtIndex(int index, Function(DeviceInfoStruct) updateFn) =>
      devices[index] = updateFn(devices[index]);

  bool isLoading = true;

  String nickname = '...';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getDevices)] action in Configurations widget.
  ApiCallResponse? devicesInfo;
  // Model for loading component.
  late LoadingModel loadingModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ListTile widget.
  bool? isUpdated;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ListTile widget.
  bool? status;
  // Stores action output result for [Backend Call - API (logOut)] action in Icon widget.
  ApiCallResponse? logoutResult;
  // Stores action output result for [Backend Call - API (getDevices)] action in Icon widget.
  ApiCallResponse? apiResultp9k;

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

  Future getNickname(BuildContext context) async {
    ApiCallResponse? userInfo;

    isLoading = true;
    FFAppState().update(() {});
    userInfo = await GetUserInfoCall.call(
      userId: FFAppState().userIdServer,
    );
    if ((userInfo.succeeded ?? true)) {
      nickname = GetUserInfoCall.nickname(
        (userInfo.jsonBody ?? ''),
      )!;
      FFAppState().update(() {});
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

    isLoading = false;
    FFAppState().update(() {});
  }

  /// Additional helper methods are added here.
}
