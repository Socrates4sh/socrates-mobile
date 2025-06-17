import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_code_widget.dart' show VerifyCodeWidget;
import 'package:flutter/material.dart';

class VerifyCodeModel extends FlutterFlowModel<VerifyCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for OTP widget.
  FocusNode? otpFocusNode;
  TextEditingController? otpTextController;
  String? Function(BuildContext, String?)? otpTextControllerValidator;
  // State field(s) for TermsCheckbox widget.
  bool? termsCheckboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    otpFocusNode?.dispose();
    otpTextController?.dispose();
  }
}
