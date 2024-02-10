import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/components/empty/empty_widget.dart';
import '/pages/components/loading/loading_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      if (functions.isIssue(_model.imagePredictions.toList())) {
                        _model.getDoctorsApi = await GetDoctorsCall.call();
                        if ((_model.getDoctorsApi?.succeeded ?? true)) {
                          setState(() {
                            _model.doctorsInfo = GetDoctorsCall.doctorsInfo(
                              (_model.getDoctorsApi?.jsonBody ?? ''),
                            )!
                                .toList()
                                .cast<DoctorsInfoStruct>();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Server Error',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        setState(() {
                          _model.productInfo = [];
                        });
                      } else {
                        setState(() {
                          _model.doctorsInfo = [];
                        });
                        _model.productsResults =
                            await GetProductRecommendationByScanCall.call(
                          issuesList: _model.imagePredictions,
                        );
                        if ((_model.productsResults?.succeeded ?? true)) {
                          setState(() {
                            _model.productInfo =
                                GetProductRecommendationByScanCall.products(
                              (_model.productsResults?.jsonBody ?? ''),
                            )!
                                    .toList()
                                    .cast<ProductInfoStruct>();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Server Error',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }
                      }
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
                    fit: BoxFit.fitWidth,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'We recommend you to go to a doctor. There are some good options:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final doctorInfo =
                                            _model.doctorsInfo.toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: doctorInfo.length,
                                          itemBuilder:
                                              (context, doctorInfoIndex) {
                                            final doctorInfoItem =
                                                doctorInfo[doctorInfoIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          doctorInfoItem.icon,
                                                      width: 60.0,
                                                      height: 40.0,
                                                      fit: BoxFit.fitWidth,
                                                      alignment:
                                                          const Alignment(-1.0, -1.0),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  doctorInfoItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        doctorInfoItem.url);
                                                  },
                                                  child: Icon(
                                                    Icons.open_in_new,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    Text(
                                      'Products Recommended',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Builder(
                                        builder: (context) {
                                          final product =
                                              _model.productInfo.toList();
                                          if (product.isEmpty) {
                                            return const EmptyWidget();
                                          }
                                          return ListView.separated(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0.0,
                                              0,
                                              0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: product.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 10.0),
                                            itemBuilder:
                                                (context, productIndex) {
                                              final productItem =
                                                  product[productIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    flex: 70,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          productItem.title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          productItem.rating,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          productItem.price,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 30,
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await launchURL(
                                                            productItem.link);
                                                      },
                                                      child: Icon(
                                                        Icons.open_in_new,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
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
