import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/locked_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_list_view_model.dart';
export 'homepage_list_view_model.dart';

class HomepageListViewWidget extends StatefulWidget {
  const HomepageListViewWidget({
    super.key,
    required this.websiteStructureDoc,
    required this.websiteVideosDoc,
    required this.subCategory,
  });

  final DocumentReference? websiteStructureDoc;
  final List<WebsiteVideosRecord>? websiteVideosDoc;
  final String? subCategory;

  @override
  State<HomepageListViewWidget> createState() => _HomepageListViewWidgetState();
}

class _HomepageListViewWidgetState extends State<HomepageListViewWidget> {
  late HomepageListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageListViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SubCategoriesRecord>>(
      stream: querySubCategoriesRecord(
        parent: widget.websiteStructureDoc,
        queryBuilder: (subCategoriesRecord) => subCategoriesRecord
            .where(
              'exam',
              isEqualTo: widget.subCategory,
            )
            .orderBy('exam_sequence'),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<SubCategoriesRecord> containerSubCategoriesRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerSubCategoriesRecord =
            containerSubCategoriesRecordList.isNotEmpty
                ? containerSubCategoriesRecordList.first
                : null;

        return Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.websiteVideosDoc!
                      .sortedList(keyOf: (e) => e.videoSequence, desc: false)
                      .where((e) => e.isDisplay)
                      .toList()
                      .length >
                  0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('HOMELIST_VIEW_Row_k7b5wfbs_ON_TAP');
                      logFirebaseEvent('Row_firestore_query');
                      _model.videosList = await queryWebsiteVideosRecordOnce(
                        queryBuilder: (websiteVideosRecord) =>
                            websiteVideosRecord
                                .where(
                                  'sub_category',
                                  isEqualTo: containerSubCategoriesRecord?.exam,
                                )
                                .where(
                                  'is_display',
                                  isEqualTo: true,
                                )
                                .orderBy('video_sequence'),
                      );
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed(
                        VideosListWidget.routeName,
                        queryParameters: {
                          'videosDocs': serializeParam(
                            _model.videosList,
                            ParamType.Document,
                            isList: true,
                          ),
                          'subCategory': serializeParam(
                            containerSubCategoriesRecord?.exam,
                            ParamType.String,
                          ),
                          'websiteCategory': serializeParam(
                            _model.videosList?.firstOrNull?.websiteCategory,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'videosDocs': _model.videosList,
                        },
                      );

                      safeSetState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              containerSubCategoriesRecord?.exam,
                              'Sub-Category',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .headlineMediumIsCustom,
                                ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              Builder(
                builder: (context) {
                  final videos = widget.websiteVideosDoc!
                      .sortedList(keyOf: (e) => e.videoSequence, desc: false)
                      .where((e) => e.isDisplay)
                      .toList();

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(videos.length, (videosIndex) {
                        final videosItem = videos[videosIndex];
                        return Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOMELIST_VIEW_Container_rfxmr8gg_ON_TAP');
                              if (!valueOrDefault<bool>(
                                    valueOrDefault<bool>(
                                        currentUserDocument?.userSubscribed,
                                        false),
                                    false,
                                  ) &&
                                  (videosIndex >= 3) &&
                                  ((currentUserDocument
                                              ?.subscriptionEndDateTime ==
                                          null) ||
                                      (currentUserDocument!
                                              .subscriptionEndDateTime! <
                                          getCurrentTimestamp))) {
                                logFirebaseEvent('Container_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        width: double.infinity,
                                        child: LockedWidget(),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  VideoPageV2Widget.routeName,
                                  queryParameters: {
                                    'subCategory': serializeParam(
                                      videosItem.subCategory,
                                      ParamType.String,
                                    ),
                                    'videoSequence': serializeParam(
                                      videosItem.videoSequence,
                                      ParamType.double,
                                    ),
                                    'initialIndex': serializeParam(
                                      videosIndex,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                width: 150.0,
                                height: 210.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Stack(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl: videosItem
                                                      .videoThumbnailImageUrl,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 150.0,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Text(
                                                      videosItem.topic,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 5.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (!functions
                                                  .checkVideoInFavourite(
                                                      (currentUserDocument
                                                                  ?.videosMylist
                                                                  .toList() ??
                                                              [])
                                                          .toList(),
                                                      VideoDocsMylistStruct(
                                                        listSeq: (currentUserDocument
                                                                        ?.videosMylist
                                                                        .toList() ??
                                                                    [])
                                                                .length +
                                                            1,
                                                        videoDocId: videosItem
                                                            .reference,
                                                        topic: videosItem.topic,
                                                        subCategory: videosItem
                                                            .subCategory,
                                                        websiteCategory:
                                                            videosItem
                                                                .websiteCategory,
                                                        videoThumbnailImageUrl:
                                                            videosItem
                                                                .videoThumbnailImageUrl,
                                                        videoUrl: videosItem
                                                            .videoFileUrl,
                                                      ))) {
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
                                                    logFirebaseEvent(
                                                        'HOMELIST_VIEW_Icon_ezlgzsjo_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'videos_mylist':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            getVideoDocsMylistFirestoreData(
                                                              updateVideoDocsMylistStruct(
                                                                VideoDocsMylistStruct(
                                                                  listSeq: (currentUserDocument?.videosMylist.toList() ??
                                                                              [])
                                                                          .length +
                                                                      1,
                                                                  videoDocId:
                                                                      videosItem
                                                                          .reference,
                                                                  topic:
                                                                      videosItem
                                                                          .topic,
                                                                  subCategory:
                                                                      videosItem
                                                                          .subCategory,
                                                                  websiteCategory:
                                                                      videosItem
                                                                          .websiteCategory,
                                                                  videoThumbnailImageUrl:
                                                                      videosItem
                                                                          .videoThumbnailImageUrl,
                                                                  videoUrl:
                                                                      videosItem
                                                                          .videoFileUrl,
                                                                  videoSeq:
                                                                      videosItem
                                                                          .videoSequence,
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              true,
                                                            )
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Icon_update_app_state');

                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.add_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 28.0,
                                                  ),
                                                );
                                              } else {
                                                return Icon(
                                                  Icons.bookmark_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 28.0,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (!valueOrDefault<bool>(
                                          valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscribed,
                                              false),
                                          false,
                                        ) &&
                                        (videosIndex >= 3) &&
                                        ((currentUserDocument
                                                    ?.subscriptionEndDateTime ==
                                                null) ||
                                            (currentUserDocument!
                                                    .subscriptionEndDateTime! <
                                                getCurrentTimestamp)))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: double.infinity,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x8757636C),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Icon(
                                            Icons.lock,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).divide(SizedBox(width: 10.0)),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
