import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_page_razor_pay_widget.dart'
    show SubscriptionPageRazorPayWidget;
import 'package:flutter/material.dart';

class SubscriptionPageRazorPayModel
    extends FlutterFlowModel<SubscriptionPageRazorPayWidget> {
  ///  Local state fields for this page.

  String? selectedPlan;

  bool initComplete = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CreateCustomerID)] action in SubscriptionPageRazorPay widget.
  ApiCallResponse? customerIdResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in SubscriptionPageRazorPay widget.
  ConstantDataRecord? constantDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in SubscriptionPageRazorPay widget.
  PaymentPlanDetailsRecord? paymentPlanDoc;
  // Stores action output result for [Backend Call - API (createSubscriptionID)] action in SubscriptionPageRazorPay widget.
  ApiCallResponse? razorPayResponseMonthly;
  // Stores action output result for [Backend Call - API (createSubscriptionID)] action in Button widget.
  ApiCallResponse? razorPayResponseMonthlyAvv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
