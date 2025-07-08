import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/homepage_list_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'homepage_v3_model.dart';
export 'homepage_v3_model.dart';

class HomepageV3Widget extends StatefulWidget {
  const HomepageV3Widget({super.key});

  static String routeName = 'HomepageV3';
  static String routePath = '/homepagev3';

  @override
  State<HomepageV3Widget> createState() => _HomepageV3WidgetState();
}

class _HomepageV3WidgetState extends State<HomepageV3Widget> {
  late HomepageV3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageV3Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomepageV3'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOMEV3_HomepageV3_ON_INIT_STATE');
      logFirebaseEvent('HomepageV3_firestore_query');
      _model.websiteStructureDocs = await queryWebsiteStructureRecordOnce(
        queryBuilder: (websiteStructureRecord) => websiteStructureRecord
            .where(
              'is_display',
              isEqualTo: true,
            )
            .orderBy('nav_seq'),
      );
      logFirebaseEvent('HomepageV3_firestore_query');
      _model.websiteVideosDoc = await queryWebsiteVideosRecordOnce(
        queryBuilder: (websiteVideosRecord) => websiteVideosRecord
            .where(
              'is_display',
              isEqualTo: true,
            )
            .orderBy('video_sequence'),
      );
      logFirebaseEvent('HomepageV3_firestore_query');
      _model.langSeq = await queryHomepageLanguageSequenceRecordOnce(
        queryBuilder: (homepageLanguageSequenceRecord) =>
            homepageLanguageSequenceRecord.orderBy('lang_seq'),
      );
      logFirebaseEvent('HomepageV3_custom_action');
      _model.dataRecord = await actions.fetchHomeAllData(
        _model.websiteStructureDocs!.toList(),
        _model.langSeq!.toList(),
      );
      logFirebaseEvent('HomepageV3_update_page_state');
      _model.allDataList =
          _model.dataRecord!.toList().cast<HomeAllDataStruct>();
      safeSetState(() {});
      logFirebaseEvent('HomepageV3_update_page_state');
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
        title: 'HomepageV3',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Stack(
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
                                  0.0, 80.0, 0.0, 0.0),
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.83,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                'For ${currentUserDisplayName}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOMEPAGE_V3_PAGE_Icon_80clkez6_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_navigate_to');

                                                context.pushNamed(
                                                    SearchWidget.routeName);
                                              },
                                              child: Icon(
                                                Icons.search_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 35.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<WebsiteStructureRecord>>(
                                                stream:
                                                    queryWebsiteStructureRecord(
                                                  queryBuilder:
                                                      (websiteStructureRecord) =>
                                                          websiteStructureRecord
                                                              .where(
                                                                'is_display',
                                                                isEqualTo: true,
                                                              )
                                                              .orderBy(
                                                                  'nav_seq'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<WebsiteStructureRecord>
                                                      rowWebsiteStructureRecordList =
                                                      snapshot.data!;

                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          rowWebsiteStructureRecordList
                                                              .length,
                                                          (rowIndex) {
                                                        final rowWebsiteStructureRecord =
                                                            rowWebsiteStructureRecordList[
                                                                rowIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 35.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  rowWebsiteStructureRecord
                                                                      .categories,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final recVideosList = (_model
                                                              .websiteVideosDoc
                                                              ?.where((e) => e
                                                                  .recommendedVideosHomepage)
                                                              .toList()
                                                              .toList() ??
                                                          [])
                                                      .take(1)
                                                      .toList();

                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child:
                                                        CarouselSlider.builder(
                                                      itemCount:
                                                          recVideosList.length,
                                                      itemBuilder: (context,
                                                          recVideosListIndex,
                                                          _) {
                                                        final recVideosListItem =
                                                            recVideosList[
                                                                recVideosListIndex];
                                                        return Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                recVideosListItem
                                                                    .videoThumbnailImageUrl,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
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
                                                                          logFirebaseEvent(
                                                                              'HOMEV3_Container_hp6r9jcb_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            VideoPageV2Widget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'videoSequence': serializeParam(
                                                                                recVideosListItem.videoSequence,
                                                                                ParamType.double,
                                                                              ),
                                                                              'subCategory': serializeParam(
                                                                                recVideosListItem.subCategory,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.play_arrow_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Text(
                                                                                  'Play',
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                        fontSize: 22.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (!functions.checkVideoInFavourite(
                                                                              (currentUserDocument?.videosMylist.toList() ?? []).toList(),
                                                                              VideoDocsMylistStruct(
                                                                                listSeq: (currentUserDocument?.videosMylist.toList() ?? []).length + 1,
                                                                                videoDocId: recVideosListItem.reference,
                                                                                topic: recVideosListItem.topic,
                                                                                subCategory: recVideosListItem.subCategory,
                                                                                websiteCategory: recVideosListItem.websiteCategory,
                                                                                videoThumbnailImageUrl: recVideosListItem.videoThumbnailImageUrl,
                                                                                videoUrl: recVideosListItem.videoFileUrl,
                                                                              ))) {
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOMEV3_Container_33st0j50_ON_TAP');
                                                                                logFirebaseEvent('Container_backend_call');

                                                                                await currentUserReference!.update({
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
                                                                                              videoSeq: recVideosListItem.videoSequence,
                                                                                            ),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          true,
                                                                                        )
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                logFirebaseEvent('Container_update_app_state');

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.add_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'My List',
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                            fontSize: 22.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.3,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.bookmark_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  Text(
                                                                                    'Added',
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                          fontSize: 22.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      carouselController: _model
                                                              .carouselController ??=
                                                          CarouselSliderController(),
                                                      options: CarouselOptions(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                1,
                                                                recVideosList
                                                                        .length -
                                                                    1)),
                                                        viewportFraction: 1.0,
                                                        disableCenter: true,
                                                        enlargeCenterPage: true,
                                                        enlargeFactor: 1.0,
                                                        enableInfiniteScroll:
                                                            false,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        autoPlay: false,
                                                        onPageChanged: (index,
                                                                _) =>
                                                            _model.carouselCurrentIndex =
                                                                index,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final allData =
                                                _model.allDataList.toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      allData.length,
                                                      (allDataIndex) {
                                                final allDataItem =
                                                    allData[allDataIndex];
                                                return HomepageListViewWidget(
                                                  key: Key(
                                                      'Key4e7_${allDataIndex}_of_${allData.length}'),
                                                  websiteStructureDoc: allDataItem
                                                      .referenceWebStructure!,
                                                  websiteVideosDoc: _model
                                                      .websiteVideosDoc!
                                                      .where((e) =>
                                                          e.subCategory ==
                                                          allDataItem
                                                              .subCategory)
                                                      .toList()
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.videoSequence,
                                                          desc: false),
                                                  subCategory:
                                                      allDataItem.subCategory,
                                                );
                                              })
                                                  .divide(
                                                      SizedBox(height: 20.0))
                                                  .addToStart(
                                                      SizedBox(height: 10.0)),
                                            );
                                          },
                                        ),
                                      ].divide(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Column(
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
                                      0.0, 5.0, 0.0, 0.0),
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
                          );
                        }
                      },
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 55.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOMEPAGE_V3_PAGE_Column_0obqvtd3_ON_TAP');
                                  logFirebaseEvent('Column_navigate_to');

                                  context.pushNamed(HomepageV3Widget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Home',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOMEPAGE_V3_PAGE_Column_gmf0kbxc_ON_TAP');
                                  logFirebaseEvent('Column_navigate_to');

                                  context
                                      .pushNamed(RecommendedWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.recommend_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Recommended',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOMEPAGE_V3_PAGE_Column_h6j8eqdu_ON_TAP');
                                  logFirebaseEvent('Column_navigate_to');

                                  context.pushNamed(ProfileWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'My Account',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
