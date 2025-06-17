import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter_o_t_p_widget.dart' show EnterOTPWidget;
import 'package:flutter/material.dart';

class EnterOTPModel extends FlutterFlowModel<EnterOTPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for OTPTextField widget.
  FocusNode? oTPTextFieldFocusNode;
  TextEditingController? oTPTextFieldTextController;
  String? Function(BuildContext, String?)? oTPTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button-Login widget.
  UsersRecord? userDocs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    oTPTextFieldFocusNode?.dispose();
    oTPTextFieldTextController?.dispose();
  }
}
