import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recommended_widget.dart' show RecommendedWidget;
import 'package:flutter/material.dart';

class RecommendedModel extends FlutterFlowModel<RecommendedWidget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Recommended widget.
  List<WebsiteVideosRecord>? websiteVideosDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
