import '/flutter_flow/flutter_flow_util.dart';
import 'delete_account_widget.dart' show DeleteAccountWidget;
import 'package:flutter/material.dart';

class DeleteAccountModel extends FlutterFlowModel<DeleteAccountWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DeleteTextField widget.
  FocusNode? deleteTextFieldFocusNode;
  TextEditingController? deleteTextFieldTextController;
  String? Function(BuildContext, String?)?
      deleteTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    deleteTextFieldFocusNode?.dispose();
    deleteTextFieldTextController?.dispose();
  }
}
