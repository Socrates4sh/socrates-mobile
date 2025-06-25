import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cancellation_razor_pay_widget.dart' show CancellationRazorPayWidget;
import 'package:flutter/material.dart';

class CancellationRazorPayModel
    extends FlutterFlowModel<CancellationRazorPayWidget> {
  ///  Local state fields for this page.

  String? selectedPlan;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CreateCustomerID)] action in CancellationRazorPay widget.
  ApiCallResponse? customerIdResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in CancellationRazorPay widget.
  ConstantDataRecord? constantDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in CancellationRazorPay widget.
  PaymentPlanDetailsRecord? paymentPlanDoc;
  // Stores action output result for [Backend Call - API (createSubscriptionID)] action in CancellationRazorPay widget.
  ApiCallResponse? razorPayResponseMonthly;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
