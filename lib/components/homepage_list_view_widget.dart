import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
        queryBuilder: (subCategoriesRecord) => subCategoriesRecord.where(
          'exam',
          isEqualTo: widget.subCategory,
        ),
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
          child: Container(
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
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
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
                        Text(
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
                        Icon(
                          Icons.chevron_right_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 30.0,
                        ),
                      ],
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
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                VideoPageV2Widget.routeName,
                                queryParameters: {
                                  'videoDoc': serializeParam(
                                    videosItem,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'videoDoc': videosItem,
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                width: 150.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              videosItem.videoThumbnailImageUrl,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 150.0,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  videosItem.topic,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'videos_mylist':
                                                    FieldValue.arrayUnion([
                                                  getVideoDocsMylistFirestoreData(
                                                    updateVideoDocsMylistStruct(
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
                                                      ),
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                        },
                                        child: Icon(
                                          Icons.add_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
