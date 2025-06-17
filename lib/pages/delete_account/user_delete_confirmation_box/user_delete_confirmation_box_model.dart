import '/flutter_flow/flutter_flow_util.dart';
import 'user_delete_confirmation_box_widget.dart'
    show UserDeleteConfirmationBoxWidget;
import 'package:flutter/material.dart';

class UserDeleteConfirmationBoxModel
    extends FlutterFlowModel<UserDeleteConfirmationBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
