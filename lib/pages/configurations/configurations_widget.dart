import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/loading/loading_widget.dart';
import '/pages/components/update_nickname/update_nickname_widget.dart';
import '/pages/components/update_password/update_password_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'configurations_model.dart';
export 'configurations_model.dart';

class ConfigurationsWidget extends StatefulWidget {
  const ConfigurationsWidget({super.key});

  @override
  State<ConfigurationsWidget> createState() => _ConfigurationsWidgetState();
}

class _ConfigurationsWidgetState extends State<ConfigurationsWidget> {
  late ConfigurationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfigurationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.isDeviceEnable(context);
      _model.devicesInfo = await GetDevicesCall.call(
        userId: FFAppState().userIdServer,
      );
      if ((_model.devicesInfo?.succeeded ?? true)) {
        setState(() {
          _model.devices = GetDevicesCall.devices(
            (_model.devicesInfo?.jsonBody ?? ''),
          )!
              .toList()
              .cast<DeviceInfoStruct>();
        });
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

      setState(() {
        _model.isLoading = false;
      });
      await _model.getNickname(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent2,
          automaticallyImplyLeading: false,
          title: Text(
            'Configurations',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await action_blocks.logOut(context);
              },
              child: Icon(
                Icons.logout,
                color: FlutterFlowTheme.of(context).alternate,
                size: 24.0,
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).accent2,
                  FlutterFlowTheme.of(context).warning
                ],
                stops: const [0.0, 1.0],
                begin: const AlignmentDirectional(0.34, -1.0),
                end: const AlignmentDirectional(-0.34, 1.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.isLoading)
                      wrapWithModel(
                        model: _model.loadingModel,
                        updateCallback: () => setState(() {}),
                        child: const LoadingWidget(),
                      ),
                    Text(
                      '¡Hola ${_model.nickname}!',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    Text(
                      'Operations',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var shouldSetState = false;
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.4,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: const UpdateNicknameWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.isUpdated = value));

                          shouldSetState = true;
                          if (_model.isUpdated!) {
                            await _model.getNickname(context);
                          } else {
                            if (shouldSetState) setState(() {});
                            return;
                          }

                          if (shouldSetState) setState(() {});
                        },
                        child: ListTile(
                          title: Text(
                            'Update Nickname',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.4,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: const UpdatePasswordWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.status = value));

                          if (_model.status!) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Password Updated',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Old Password does not match',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }

                          setState(() {});
                        },
                        child: ListTile(
                          title: Text(
                            'Update Password',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Connected Devices',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(
                          builder: (context) {
                            final device = _model.devices.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: device.length,
                              itemBuilder: (context, deviceIndex) {
                                final deviceItem = device[deviceIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 70,
                                      child: Text(
                                        deviceItem.name,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 30,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var shouldSetState = false;
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title:
                                                            const Text('Dermatech'),
                                                        content: const Text(
                                                            'Do you want to end the session?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                const Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                const Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            if (deviceItem.id ==
                                                FFAppState().deviceIdServer) {
                                              await action_blocks
                                                  .logOut(context);
                                            } else {
                                              _model.logoutResult =
                                                  await LogOutCall.call(
                                                deviceId: deviceItem.id,
                                              );
                                              shouldSetState = true;
                                              if ((_model.logoutResult
                                                      ?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Session Ended',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                setState(() {
                                                  _model.isLoading = false;
                                                  _model.devices = [];
                                                });
                                                _model.apiResultp9k =
                                                    await GetDevicesCall.call(
                                                  userId:
                                                      FFAppState().userIdServer,
                                                );
                                                shouldSetState = true;
                                                if ((_model.apiResultp9k
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    _model
                                                        .devices = GetDevicesCall
                                                            .devices(
                                                      (_model.apiResultp9k
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                        .toList()
                                                        .cast<
                                                            DeviceInfoStruct>();
                                                  });
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Server Error',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                }

                                                setState(() {
                                                  _model.isLoading = false;
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Server Error',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            }
                                          } else {
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
