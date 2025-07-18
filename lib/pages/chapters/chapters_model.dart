import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chapters_widget.dart' show ChaptersWidget;
import 'package:flutter/material.dart';

class ChaptersModel extends FlutterFlowModel<ChaptersWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Chapters widget.
  ExamsRecord? examDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Chapters widget.
  SubjectsRecord? subjectDataDoc;
  // Stores action output result for [RevenueCat - Purchase] action in Container widget.
  bool? purchaseSuccessful1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
