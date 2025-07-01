import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/cancellation_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'subscription_page_razor_pay_model.dart';
export 'subscription_page_razor_pay_model.dart';

class SubscriptionPageRazorPayWidget extends StatefulWidget {
  const SubscriptionPageRazorPayWidget({super.key});

  static String routeName = 'SubscriptionPageRazorPay';
  static String routePath = '/subscriptionPageRazorPay';

  @override
  State<SubscriptionPageRazorPayWidget> createState() =>
      _SubscriptionPageRazorPayWidgetState();
}

class _SubscriptionPageRazorPayWidgetState
    extends State<SubscriptionPageRazorPayWidget> {
  late SubscriptionPageRazorPayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPageRazorPayModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.customerId, '') == '') {
        _model.customerIdResponse = await CreateCustomerIDCall.call(
          name: currentUserDisplayName,
          email: currentUserEmail,
          phone: currentPhoneNumber,
        );

        if ((_model.customerIdResponse?.succeeded ?? true)) {
          await currentUserReference!.update(createUsersRecordData(
            customerId: CreateCustomerIDCall.customerId(
              (_model.customerIdResponse?.jsonBody ?? ''),
            ),
          ));
        }
      }
      FFAppState().monthlySubscriptionId = '';
      safeSetState(() {});
      _model.constantDataDoc = await queryConstantDataRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.paymentPlanDoc = await queryPaymentPlanDetailsRecordOnce(
        parent: _model.constantDataDoc?.reference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.initComplete = true;
      safeSetState(() {});
      _model.razorPayResponseMonthly = await CreateSubscriptionIDCall.call(
        planId: _model.paymentPlanDoc?.planId,
        totalCount: 1,
        uID: currentUserUid,
        customerId: valueOrDefault(currentUserDocument?.customerId, ''),
        description: 'Monthly Plan',
      );

      if ((_model.razorPayResponseMonthly?.succeeded ?? true)) {
        FFAppState().monthlySubscriptionId =
            CreateSubscriptionIDCall.subscriptionId(
          (_model.razorPayResponseMonthly?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'SubscriptionPageRazorPay',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'assets/images/socrates_blue.png',
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (_model.initComplete) {
                                return Builder(
                                  builder: (context) {
                                    if (!valueOrDefault<bool>(
                                            currentUserDocument?.userSubscribed,
                                            false) ||
                                        (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.userSubscribed,
                                                false) ==
                                            null)) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Unlock Unlimited Access with \n4sh Subscription!',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLargeIsCustom,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                      Flexible(
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Unlimited Video Content:\n',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'Get access to all our expert-led video content, from ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'US Admissions to Exam Prep',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 10.0))
                                                        .around(SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                      Flexible(
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Exclusive Resources:\n',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'Gain access to premium lessons, practice tests, and tips that are available only to subscribers.',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 10.0))
                                                        .around(SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Flexible(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.selectedPlan =
                                                              'Monthly';
                                                          safeSetState(() {});
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Monthly Plan',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '₹${valueOrDefault<String>(
                                                                      _model
                                                                          .paymentPlanDoc
                                                                          ?.originalPrice
                                                                          .toString(),
                                                                      '99',
                                                                    )}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              50.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 10.0))
                                                .around(SizedBox(height: 10.0)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (CreateSubscriptionIDCall
                                                            .subscriptionId(
                                                          (_model.razorPayResponseMonthly
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        null ||
                                                    CreateSubscriptionIDCall
                                                            .subscriptionId(
                                                          (_model.razorPayResponseMonthly
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        '') {
                                                  _model.razorPayResponseMonthlyAvv =
                                                      await CreateSubscriptionIDCall
                                                          .call(
                                                    planId: _model
                                                        .paymentPlanDoc?.planId,
                                                    totalCount: 1,
                                                    uID: currentUserUid,
                                                    customerId: valueOrDefault(
                                                        currentUserDocument
                                                            ?.customerId,
                                                        ''),
                                                    description: 'Monthly Plan',
                                                  );

                                                  FFAppState()
                                                          .monthlySubscriptionId =
                                                      CreateSubscriptionIDCall
                                                          .subscriptionId(
                                                    (_model.razorPayResponseMonthlyAvv
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!;
                                                  safeSetState(() {});
                                                }
                                                await actions
                                                    .startRazorpaySubscriptionPayment(
                                                  FFAppState()
                                                      .monthlySubscriptionId,
                                                  () async {},
                                                  () async {
                                                    await currentUserReference!
                                                        .update({
                                                      ...createUsersRecordData(
                                                        subscriptionEndDateTime:
                                                            functions
                                                                .getSubscriptionEndDate(
                                                                    30),
                                                        subscriptionStartDateTime:
                                                            getCurrentTimestamp,
                                                        subscriptionID: FFAppState()
                                                            .monthlySubscriptionId,
                                                        userSubscribed: true,
                                                        subscriptionCancelled:
                                                            false,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'subscriptionDetails':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            getSubscriptionFirestoreData(
                                                              createSubscriptionStruct(
                                                                planAmount:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  _model
                                                                      .paymentPlanDoc
                                                                      ?.originalPrice
                                                                      .toDouble(),
                                                                  99.0,
                                                                ),
                                                                planTitle:
                                                                    'Monthly',
                                                                subscriptionDateTime:
                                                                    getCurrentTimestamp,
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              true,
                                                            )
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    FFAppState()
                                                        .monthlySubscriptionId = '';
                                                    safeSetState(() {});
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Payment Successful'),
                                                          content: Text(
                                                              'Hii${currentUserDisplayName}!  Your payment  was successful.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                );

                                                safeSetState(() {});
                                              },
                                              text: 'Subscribe',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.6,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'You Are Subscribed! 🎉',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'Your subscription is now active, giving you ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'unlimited access ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'to all video content—from ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'US Admissions ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'to ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'Exam Prep ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'and more!',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'Your subscription will be valid until ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: dateTimeFormat(
                                                            "d MMM y",
                                                            currentUserDocument!
                                                                .subscriptionEndDateTime!),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '. Enjoy your learning journey!',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'If you cancel, you\'ll lose access to all premium content after',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: dateTimeFormat(
                                                                "d MMM y",
                                                                currentUserDocument!
                                                                    .subscriptionEndDateTime!),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12.0,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.5,
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        CancellationPopUpWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Text(
                                                          'Cancel Subscription',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                );
                              }
                            },
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
