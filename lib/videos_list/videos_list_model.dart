import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'videos_list_widget.dart' show VideosListWidget;
import 'package:flutter/material.dart';

class VideosListModel extends FlutterFlowModel<VideosListWidget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in VideosList widget.
  List<WebsiteStructureRecord>? websiteStructureDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in VideosList widget.
  List<WebsiteVideosRecord>? websiteVideosDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
