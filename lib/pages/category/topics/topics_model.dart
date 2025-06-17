import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'topics_widget.dart' show TopicsWidget;
import 'package:flutter/material.dart';

class TopicsModel extends FlutterFlowModel<TopicsWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  SubjectChaptersStruct? chapterList;
  void updateChapterListStruct(Function(SubjectChaptersStruct) updateFn) {
    updateFn(chapterList ??= SubjectChaptersStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Topics widget.
  ExamsRecord? examDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Topics widget.
  SubjectsRecord? subjectDataDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
