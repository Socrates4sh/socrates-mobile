import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subjects_widget.dart' show SubjectsWidget;
import 'package:flutter/material.dart';

class SubjectsModel extends FlutterFlowModel<SubjectsWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  List<Color> listColors = [
    Color(4280580987),
    Color(4280856496),
    Color(4293826123),
    Color(4285958062),
    Color(4288161353),
    Color(4280954174)
  ];
  void addToListColors(Color item) => listColors.add(item);
  void removeFromListColors(Color item) => listColors.remove(item);
  void removeAtIndexFromListColors(int index) => listColors.removeAt(index);
  void insertAtIndexInListColors(int index, Color item) =>
      listColors.insert(index, item);
  void updateListColorsAtIndex(int index, Function(Color) updateFn) =>
      listColors[index] = updateFn(listColors[index]);

  List<Color> listColorsDynamic = [];
  void addToListColorsDynamic(Color item) => listColorsDynamic.add(item);
  void removeFromListColorsDynamic(Color item) =>
      listColorsDynamic.remove(item);
  void removeAtIndexFromListColorsDynamic(int index) =>
      listColorsDynamic.removeAt(index);
  void insertAtIndexInListColorsDynamic(int index, Color item) =>
      listColorsDynamic.insert(index, item);
  void updateListColorsDynamicAtIndex(int index, Function(Color) updateFn) =>
      listColorsDynamic[index] = updateFn(listColorsDynamic[index]);

  int loopIndex = 0;

  bool initComplete = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Subjects widget.
  List<SubjectsRecord>? listSubjects;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
