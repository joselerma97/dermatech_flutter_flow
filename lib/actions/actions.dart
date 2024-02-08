import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future logOut(BuildContext context) async {
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

    context.goNamed('Welcome');
  }
}
