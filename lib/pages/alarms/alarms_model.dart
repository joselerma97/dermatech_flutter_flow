import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alarms_widget.dart' show AlarmsWidget;
import 'package:flutter/material.dart';

class AlarmsModel extends FlutterFlowModel<AlarmsWidget> {
  ///  Local state fields for this page.

  List<AlarmsInfoStruct> alarms = [];
  void addToAlarms(AlarmsInfoStruct item) => alarms.add(item);
  void removeFromAlarms(AlarmsInfoStruct item) => alarms.remove(item);
  void removeAtIndexFromAlarms(int index) => alarms.removeAt(index);
  void insertAtIndexInAlarms(int index, AlarmsInfoStruct item) =>
      alarms.insert(index, item);
  void updateAlarmsAtIndex(int index, Function(AlarmsInfoStruct) updateFn) =>
      alarms[index] = updateFn(alarms[index]);

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteAlarm)] action in delete widget.
  ApiCallResponse? status;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in FloatingActionButton widget.
  String? result;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future getAlarmsInfo(BuildContext context) async {
    ApiCallResponse? alarmsInfo;

    isLoading = true;
    FFAppState().update(() {});
    alarmsInfo = await GetAlarmsInfoCall.call(
      userId: FFAppState().userIdServer,
    );
    if ((alarmsInfo.succeeded ?? true)) {
      alarms = GetAlarmsInfoCall.alarmsInfo(
        (alarmsInfo.jsonBody ?? ''),
      )!
          .toList()
          .cast<AlarmsInfoStruct>();
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
