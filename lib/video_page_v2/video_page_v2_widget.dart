import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'video_page_v2_model.dart';
export 'video_page_v2_model.dart';

class VideoPageV2Widget extends StatefulWidget {
  const VideoPageV2Widget({
    super.key,
    required this.videoDoc,
    this.subCategory,
  });

  final WebsiteVideosRecord? videoDoc;
  final String? subCategory;

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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await queryWebsiteVideosRecordOnce(
        queryBuilder: (websiteVideosRecord) => websiteVideosRecord.where(
          'sub_category',
          isEqualTo: widget.subCategory,
        ),
      );
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (_model.initCompleted) {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            decoration: BoxDecoration(),
                            child: FlutterFlowVideoPlayer(
                              path: 'assets/videos/words_for_slide_11.mp4',
                              videoType: VideoType.asset,
                              aspectRatio: 0.56,
                              autoPlay: true,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
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
