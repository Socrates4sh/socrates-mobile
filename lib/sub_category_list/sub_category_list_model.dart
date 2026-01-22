import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sub_category_list_widget.dart' show SubCategoryListWidget;
import 'package:flutter/material.dart';

class SubCategoryListModel extends FlutterFlowModel<SubCategoryListWidget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in SubCategoryList widget.
  WebsiteStructureRecord? websiteStructureDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in SubCategoryList widget.
  List<SubCategoriesRecord>? subCategory;
  // Stores action output result for [Firestore Query - Query a collection] action in SubCategoryList widget.
  List<WebsiteVideosRecord>? videosWebCat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
