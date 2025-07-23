import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_list_widget.dart' show MyListWidget;
import 'package:flutter/material.dart';

class MyListModel extends FlutterFlowModel<MyListWidget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  bool isEdit = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in MyList widget.
  List<WebsiteVideosRecord>? websiteVideosDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
