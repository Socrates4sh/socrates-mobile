import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shorts_video_page_widget.dart' show ShortsVideoPageWidget;
import 'package:flutter/material.dart';

class ShortsVideoPageModel extends FlutterFlowModel<ShortsVideoPageWidget> {
  ///  Local state fields for this page.

  bool initComplete = false;

  int startingIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in shortsVideoPage widget.
  List<UploadedVideosRecord>? listVideos;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
