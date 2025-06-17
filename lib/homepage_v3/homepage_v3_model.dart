import '/backend/backend.dart';
import '/components/homepage_list_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homepage_v3_widget.dart' show HomepageV3Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomepageV3Model extends FlutterFlowModel<HomepageV3Widget> {
  ///  Local state fields for this page.

  bool? initCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomepageV3 widget.
  List<WebsiteStructureRecord>? websiteStructureDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in HomepageV3 widget.
  List<WebsiteVideosRecord>? websiteVideosDoc;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for homepageListView component.
  late HomepageListViewModel homepageListViewModel1;
  // Model for homepageListView component.
  late HomepageListViewModel homepageListViewModel2;
  // Model for homepageListView component.
  late HomepageListViewModel homepageListViewModel3;
  // Model for homepageListView component.
  late HomepageListViewModel homepageListViewModel4;

  @override
  void initState(BuildContext context) {
    homepageListViewModel1 =
        createModel(context, () => HomepageListViewModel());
    homepageListViewModel2 =
        createModel(context, () => HomepageListViewModel());
    homepageListViewModel3 =
        createModel(context, () => HomepageListViewModel());
    homepageListViewModel4 =
        createModel(context, () => HomepageListViewModel());
  }

  @override
  void dispose() {
    homepageListViewModel1.dispose();
    homepageListViewModel2.dispose();
    homepageListViewModel3.dispose();
    homepageListViewModel4.dispose();
  }
}
