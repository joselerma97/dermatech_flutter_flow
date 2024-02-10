import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/components/loading/loading_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'camera_model.dart';
export 'camera_model.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Image Analysis',
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
                Icons.logout_sharp,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      _model.isLoading = true;
                      _model.isProcessed = false;
                    });
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    setState(() {
                      _model.isPhotoUploaded = true;
                    });
                    _model.apiResult4c6 = await FullPredictionCall.call(
                      uploadedFile: _model.uploadedLocalFile,
                    );
                    if ((_model.apiResult4c6?.succeeded ?? true)) {
                      setState(() {
                        _model.imageUrl = valueOrDefault<String>(
                          FullPredictionCall.imageName(
                            (_model.apiResult4c6?.jsonBody ?? ''),
                          ).toString(),
                          '*',
                        );
                      });
                      setState(() {
                        _model.imagePredictions = FullPredictionCall.predResult(
                          (_model.apiResult4c6?.jsonBody ?? ''),
                        )!
                            .toList()
                            .cast<String>();
                      });
                      setState(() {
                        _model.isProcessed = true;
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
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    setState(() {
                      _model.isLoading = false;
                    });

                    setState(() {});
                  },
                  text: 'Take photo',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              if (!_model.isProcessed && _model.isPhotoUploaded)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.memory(
                    _model.uploadedLocalFile.bytes ?? Uint8List.fromList([]),
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              if (_model.isLoading)
                Flexible(
                  child: wrapWithModel(
                    model: _model.loadingModel,
                    updateCallback: () => setState(() {}),
                    child: const LoadingWidget(),
                  ),
                ),
              Builder(
                builder: (context) {
                  if (_model.isProcessed) {
                    return Builder(
                      builder: (context) {
                        if (_model.imagePredictions.isEmpty) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Lottie.asset(
                                'assets/lottie_animations/no_data.json',
                                width: 150.0,
                                height: 130.0,
                                fit: BoxFit.cover,
                                animate: true,
                              ),
                              Text(
                                'We do not found any issue. Take another picture to double check',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          );
                        } else {
                          return Builder(
                            builder: (context) {
                              if (functions
                                  .isIssue(_model.imagePredictions.toList())) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Go to a doctor',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (_model.isProcessed &&
                                        (_model.imageUrl != ''))
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://dermatechserver.cloud/skin/type/show/${_model.imageUrl}',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (_model.isProcessed)
                                      Builder(
                                        builder: (context) {
                                          final info =
                                              _model.imagePredictions.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: info.length,
                                            itemBuilder: (context, infoIndex) {
                                              final infoItem = info[infoIndex];
                                              return Text(
                                                infoItem,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                );
                              }
                            },
                          );
                        }
                      },
                    );
                  } else {
                    return Lottie.asset(
                      'assets/lottie_animations/cv_image.json',
                      width: 150.0,
                      height: 130.0,
                      fit: BoxFit.cover,
                      animate: true,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
