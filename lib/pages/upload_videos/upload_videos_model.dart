import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upload_videos_widget.dart' show UploadVideosWidget;
import 'package:flutter/material.dart';

class UploadVideosModel extends FlutterFlowModel<UploadVideosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for folderPath widget.
  FocusNode? folderPathFocusNode;
  TextEditingController? folderPathTextController;
  String? Function(BuildContext, String?)? folderPathTextControllerValidator;
  // State field(s) for sheetURL widget.
  FocusNode? sheetURLFocusNode;
  TextEditingController? sheetURLTextController;
  String? Function(BuildContext, String?)? sheetURLTextControllerValidator;
  // Stores action output result for [Backend Call - API (VideoUpload)] action in Button widget.
  ApiCallResponse? videoUpload;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    folderPathFocusNode?.dispose();
    folderPathTextController?.dispose();

    sheetURLFocusNode?.dispose();
    sheetURLTextController?.dispose();
  }
}
