import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_v2_widget.dart' show HomepageV2Widget;
import 'package:flutter/material.dart';

class HomepageV2Model extends FlutterFlowModel<HomepageV2Widget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomepageV2 widget.
  List<WebsiteStructureRecord>? websiteStructureDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in HomepageV2 widget.
  List<WebsiteVideosRecord>? websiteVideosDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
