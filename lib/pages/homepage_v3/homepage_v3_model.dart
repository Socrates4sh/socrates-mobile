import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homepage_v3_widget.dart' show HomepageV3Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomepageV3Model extends FlutterFlowModel<HomepageV3Widget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  List<HomeAllDataStruct> allDataList = [];
  void addToAllDataList(HomeAllDataStruct item) => allDataList.add(item);
  void removeFromAllDataList(HomeAllDataStruct item) =>
      allDataList.remove(item);
  void removeAtIndexFromAllDataList(int index) => allDataList.removeAt(index);
  void insertAtIndexInAllDataList(int index, HomeAllDataStruct item) =>
      allDataList.insert(index, item);
  void updateAllDataListAtIndex(
          int index, Function(HomeAllDataStruct) updateFn) =>
      allDataList[index] = updateFn(allDataList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomepageV3 widget.
  List<WebsiteStructureRecord>? websiteStructureDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in HomepageV3 widget.
  List<WebsiteVideosRecord>? websiteVideosDoc;
  // Stores action output result for [Custom Action - fetchHomeAllData] action in HomepageV3 widget.
  List<HomeAllDataStruct>? dataRecord;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
