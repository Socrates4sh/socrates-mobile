import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'recommended_model.dart';
export 'recommended_model.dart';

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({super.key});

  static String routeName = 'Recommended';
  static String routePath = '/recommended';

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  late RecommendedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.websiteVideosDoc = await queryWebsiteVideosRecordOnce(
        queryBuilder: (websiteVideosRecord) => websiteVideosRecord
            .where(
              'is_display',
              isEqualTo: true,
            )
            .where(
              'recommended_videos_homepage',
              isEqualTo: true,
            )
            .orderBy('video_sequence'),
      );
      _model.initCompleted = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Recommended',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.initCompleted ?? false) {
                        return Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 50.0, 30.0, 30.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.85,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Top Recommended Videos',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 25.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.8,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: Builder(
                                              builder: (context) {
                                                final recVideosList = _model
                                                        .websiteVideosDoc
                                                        ?.toList() ??
                                                    [];

                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 20.0,
                                                    mainAxisSpacing: 20.0,
                                                    childAspectRatio: 0.7,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      recVideosList.length,
                                                  itemBuilder: (context,
                                                      recVideosListIndex) {
                                                    final recVideosListItem =
                                                        recVideosList[
                                                            recVideosListIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          VideoPageV2Widget
                                                              .routeName,
                                                          queryParameters: {
                                                            'subCategory':
                                                                serializeParam(
                                                              recVideosListItem
                                                                  .subCategory,
                                                              ParamType.String,
                                                            ),
                                                            'videoSequence':
                                                                serializeParam(
                                                              recVideosListItem
                                                                  .videoSequence,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 210.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        recVideosListItem
                                                                            .videoThumbnailImageUrl,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              150.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          60.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Text(
                                                                            recVideosListItem.topic,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (!functions
                                                                      .checkVideoInFavourite(
                                                                          (currentUserDocument?.videosMylist.toList() ?? [])
                                                                              .toList(),
                                                                          VideoDocsMylistStruct(
                                                                            listSeq:
                                                                                (currentUserDocument?.videosMylist.toList() ?? []).length + 1,
                                                                            videoDocId:
                                                                                recVideosListItem.reference,
                                                                            topic:
                                                                                recVideosListItem.topic,
                                                                            subCategory:
                                                                                recVideosListItem.subCategory,
                                                                            websiteCategory:
                                                                                recVideosListItem.websiteCategory,
                                                                            videoThumbnailImageUrl:
                                                                                recVideosListItem.videoThumbnailImageUrl,
                                                                            videoUrl:
                                                                                recVideosListItem.videoFileUrl,
                                                                          ))) {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await currentUserReference!
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'videos_mylist': FieldValue.arrayUnion([
                                                                                  getVideoDocsMylistFirestoreData(
                                                                                    updateVideoDocsMylistStruct(
                                                                                      VideoDocsMylistStruct(
                                                                                        listSeq: (currentUserDocument?.videosMylist.toList() ?? []).length + 1,
                                                                                        videoDocId: recVideosListItem.reference,
                                                                                        topic: recVideosListItem.topic,
                                                                                        subCategory: recVideosListItem.subCategory,
                                                                                        websiteCategory: recVideosListItem.websiteCategory,
                                                                                        videoThumbnailImageUrl: recVideosListItem.videoThumbnailImageUrl,
                                                                                        videoUrl: recVideosListItem.videoFileUrl,
                                                                                      ),
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    true,
                                                                                  )
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .bookmark_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: MediaQuery.sizeOf(context).height * 0.85,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'assets/jsons/White_Circular_Lottie.json',
                                width: 200.0,
                                height: 150.0,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                              Flexible(
                                child: Text(
                                  'Getting things ready!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 100.0),
                                  child: Text(
                                    'We’re preparing powerful lessons to shape your future.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
