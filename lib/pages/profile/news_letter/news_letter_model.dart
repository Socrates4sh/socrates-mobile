import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'news_letter_widget.dart' show NewsLetterWidget;
import 'package:flutter/material.dart';

class NewsLetterModel extends FlutterFlowModel<NewsLetterWidget> {
  ///  Local state fields for this page.

  bool isSubscribedEmail = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter correct Email ID';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (mailchimpSubscription)] action in Button widget.
  ApiCallResponse? subscribed;
  // Stores action output result for [Backend Call - API (mailchimpSubscription)] action in Button widget.
  ApiCallResponse? subscribe;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
