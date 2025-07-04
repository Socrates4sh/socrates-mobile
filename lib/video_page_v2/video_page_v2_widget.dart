import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'video_page_v2_model.dart';
export 'video_page_v2_model.dart';

class VideoPageV2Widget extends StatefulWidget {
  const VideoPageV2Widget({
    super.key,
    this.subCategory,
    required this.videoSequence,
    this.initialIndex,
  });

  final String? subCategory;
  final double? videoSequence;
  final int? initialIndex;

  static String routeName = 'VideoPage_V2';
  static String routePath = '/videoPageV2';

  @override
  State<VideoPageV2Widget> createState() => _VideoPageV2WidgetState();
}

class _VideoPageV2WidgetState extends State<VideoPageV2Widget> {
  late VideoPageV2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPageV2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideoPage_V2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIDEO_V2_VideoPage_V2_ON_INIT_STATE');
      logFirebaseEvent('VideoPage_V2_firestore_query');
      _model.websiteVideoDoc = await queryWebsiteVideosRecordOnce(
        queryBuilder: (websiteVideosRecord) => websiteVideosRecord
            .where(
              'sub_category',
              isEqualTo: widget.subCategory,
            )
            .where(
              'is_display',
              isEqualTo: true,
            )
            .orderBy('video_sequence'),
      );
      if (widget.initialIndex == null) {
        logFirebaseEvent('VideoPage_V2_update_page_state');
        _model.initialTabIndex = functions.findIndexOfTable(
            _model.websiteVideoDoc!.toList(), widget.videoSequence!);
        safeSetState(() {});
      } else {
        logFirebaseEvent('VideoPage_V2_update_page_state');
        _model.initialTabIndex = widget.initialIndex!;
        safeSetState(() {});
      }

      logFirebaseEvent('VideoPage_V2_update_page_state');
      _model.initCompleted = true;
      safeSetState(() {});
      logFirebaseEvent('VideoPage_V2_google_analytics_event');
      logFirebaseEvent('app_video_opened');
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
        title: 'VideoPage_V2',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (_model.initCompleted) {
                      return Builder(
                        builder: (context) {
                          final video = _model.websiteVideoDoc?.toList() ?? [];

                          return Container(
                            width: double.infinity,
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              valueOrDefault<int>(
                                                _model.initialTabIndex,
                                                0,
                                              ),
                                              video.length - 1))),
                              onPageChanged: (_) => safeSetState(() {}),
                              scrollDirection: Axis.vertical,
                              itemCount: video.length,
                              itemBuilder: (context, videoIndex) {
                                final videoItem = video[videoIndex];
                                return FlutterFlowVideoPlayer(
                                  path: videoItem.videoFileUrl,
                                  videoType: VideoType.network,
                                  autoPlay: true,
                                  looping: false,
                                  showControls: true,
                                  allowFullScreen: true,
                                  allowPlaybackSpeedMenu: false,
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/jsons/Blue_Loading_lottie.json',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
