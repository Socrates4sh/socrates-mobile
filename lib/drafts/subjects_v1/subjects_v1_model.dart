import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subjects_v1_widget.dart' show SubjectsV1Widget;
import 'package:flutter/material.dart';

class SubjectsV1Model extends FlutterFlowModel<SubjectsV1Widget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in SubjectsV1 widget.
  ExamsRecord? examDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in SubjectsV1 widget.
  List<SubjectsRecord>? subjectDataDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
