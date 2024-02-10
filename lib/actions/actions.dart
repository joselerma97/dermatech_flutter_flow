import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future logOut(BuildContext context) async {
  ApiCallResponse? statusLogout;

  var confirmDialogResponse = await showDialog<bool>(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Dermatech'),
            content: const Text('Do you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, true),
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      ) ??
      false;
  if (confirmDialogResponse) {
    FFAppState().userIdServer = '';
    await actions.removeInternalData(
      FFAppConstants.userTag,
    );
    statusLogout = await LogOutCall.call(
      deviceId: FFAppState().deviceIdServer,
    );
    FFAppState().update(() {
      FFAppState().deviceIdServer = '';
    });
    await actions.removeInternalData(
      FFAppConstants.deviceTag,
    );

    context.goNamed('Welcome');
  } else {
    return;
  }
}
