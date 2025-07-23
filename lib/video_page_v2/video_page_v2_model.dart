import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_page_v2_widget.dart' show VideoPageV2Widget;
import 'package:flutter/material.dart';

class VideoPageV2Model extends FlutterFlowModel<VideoPageV2Widget> {
  ///  Local state fields for this page.

  bool initCompleted = false;

  int initialTabIndex = 0;
  int scrollLock = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in VideoPage_V2 widget.
  List<WebsiteVideosRecord>? websiteVideoDoc;
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
