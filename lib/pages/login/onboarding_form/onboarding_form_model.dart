import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_form_widget.dart' show OnboardingFormWidget;
import 'package:flutter/material.dart';

class OnboardingFormModel extends FlutterFlowModel<OnboardingFormWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for user_first_name widget.
  FocusNode? userFirstNameFocusNode;
  TextEditingController? userFirstNameTextController;
  String? Function(BuildContext, String?)? userFirstNameTextControllerValidator;
  String? _userFirstNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the your full name.';
    }

    return null;
  }

  // State field(s) for user_last_name widget.
  FocusNode? userLastNameFocusNode;
  TextEditingController? userLastNameTextController;
  String? Function(BuildContext, String?)? userLastNameTextControllerValidator;
  String? _userLastNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the your last name.';
    }

    return null;
  }

  // State field(s) for user_email widget.
  FocusNode? userEmailFocusNode;
  TextEditingController? userEmailTextController;
  String? Function(BuildContext, String?)? userEmailTextControllerValidator;
  String? _userEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email address.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter correct email address.';
    }
    return null;
  }

  // State field(s) for user_interests widget.
  FocusNode? userInterestsFocusNode;
  TextEditingController? userInterestsTextController;
  String? Function(BuildContext, String?)? userInterestsTextControllerValidator;
  // State field(s) for WACheckbox widget.
  bool? wACheckboxValue;
  // State field(s) for NewsletterCheckbox widget.
  bool? newsletterCheckboxValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? verifiedUserDetails;
  // Stores action output result for [Backend Call - API (CreateCustomerID)] action in Button widget.
  ApiCallResponse? customerIdResponse;

  @override
  void initState(BuildContext context) {
    userFirstNameTextControllerValidator =
        _userFirstNameTextControllerValidator;
    userLastNameTextControllerValidator = _userLastNameTextControllerValidator;
    userEmailTextControllerValidator = _userEmailTextControllerValidator;
  }

  @override
  void dispose() {
    userFirstNameFocusNode?.dispose();
    userFirstNameTextController?.dispose();

    userLastNameFocusNode?.dispose();
    userLastNameTextController?.dispose();

    userEmailFocusNode?.dispose();
    userEmailTextController?.dispose();

    userInterestsFocusNode?.dispose();
    userInterestsTextController?.dispose();
  }
}
