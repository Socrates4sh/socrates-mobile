import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shorts_video_page_model.dart';
export 'shorts_video_page_model.dart';

class ShortsVideoPageWidget extends StatefulWidget {
  const ShortsVideoPageWidget({
    super.key,
    required this.exam,
    String? grade,
    required this.subject,
    required this.chapter,
    required this.topic,
  }) : this.grade = grade ?? 'NA';

  final String? exam;
  final String grade;
  final String? subject;
  final String? chapter;
  final String? topic;

  static String routeName = 'shortsVideoPage';
  static String routePath = '/shortsVideoPage';

  @override
  State<ShortsVideoPageWidget> createState() => _ShortsVideoPageWidgetState();
}

class _ShortsVideoPageWidgetState extends State<ShortsVideoPageWidget> {
  late ShortsVideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortsVideoPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'shortsVideoPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SHORTS_VIDEO_shortsVideoPage_ON_INIT_STA');
      logFirebaseEvent('shortsVideoPage_firestore_query');
      _model.listVideos = await queryUploadedVideosRecordOnce(
        queryBuilder: (uploadedVideosRecord) => uploadedVideosRecord
            .where(
              'exam',
              isEqualTo: widget.exam,
            )
            .where(
              'subject',
              isEqualTo: widget.subject,
            )
            .where(
              'chapter',
              isEqualTo: widget.chapter,
            )
            .where(
              'is_display',
              isEqualTo: true,
            )
            .orderBy('video_sequence'),
      );
      logFirebaseEvent('shortsVideoPage_update_page_state');
      _model.startingIndex = _model.listVideos!
          .where((e) =>
              e.videoSequence <
              _model.listVideos!
                  .where((e) => e.topic == widget.topic)
                  .toList()
                  .firstOrNull!
                  .videoSequence)
          .toList()
          .length;
      safeSetState(() {});
      logFirebaseEvent('shortsVideoPage_update_page_state');
      _model.initComplete = true;
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
        title: 'shortsVideoPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  if (_model.initComplete) {
                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidArrowAltCircleLeft,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SHORTS_VIDEO_solidArrowAltCircleLeft_ICN');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                            ],
                          ),
                          Builder(
                            builder: (context) {
                              final videoListPageView =
                                  _model.listVideos?.toList() ?? [];

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  valueOrDefault<int>(
                                                    _model.startingIndex,
                                                    0,
                                                  ),
                                                  videoListPageView.length -
                                                      1))),
                                  scrollDirection: Axis.vertical,
                                  itemCount: videoListPageView.length,
                                  itemBuilder:
                                      (context, videoListPageViewIndex) {
                                    final videoListPageViewItem =
                                        videoListPageView[
                                            videoListPageViewIndex];
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.VideoPlayerPage(
                                        width: double.infinity,
                                        height: double.infinity,
                                        videoUrl:
                                            videoListPageViewItem.videoUrl,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text(
                      'Learning Loading....',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
