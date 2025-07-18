import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/payment/payment_box/payment_box_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chapters_model.dart';
export 'chapters_model.dart';

class ChaptersWidget extends StatefulWidget {
  const ChaptersWidget({
    super.key,
    required this.exam,
    this.grade,
    required this.subject,
    this.examSequence,
    this.subjectSequence,
  });

  final String? exam;
  final String? grade;
  final String? subject;
  final int? examSequence;
  final int? subjectSequence;

  static String routeName = 'Chapters';
  static String routePath = '/chapters';

  @override
  State<ChaptersWidget> createState() => _ChaptersWidgetState();
}

class _ChaptersWidgetState extends State<ChaptersWidget> {
  late ChaptersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChaptersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chapters'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAPTERS_PAGE_Chapters_ON_INIT_STATE');
      logFirebaseEvent('Chapters_firestore_query');
      _model.examDataDoc = await queryExamsRecordOnce(
        queryBuilder: (examsRecord) => examsRecord.where(
          'exam_sequence',
          isEqualTo: widget.examSequence,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('Chapters_firestore_query');
      _model.subjectDataDoc = await querySubjectsRecordOnce(
        parent: _model.examDataDoc?.reference,
        queryBuilder: (subjectsRecord) => subjectsRecord.where(
          'subject_sequence',
          isEqualTo: widget.subjectSequence,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('Chapters_update_page_state');
      _model.isLoading = true;
      safeSetState(() {});
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
    return Title(
        title: 'Chapters',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('CHAPTERS_PAGE_arrow_back_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    Text(
                      '${widget.exam}${widget.grade != null && widget.grade != '' ? ' (${widget.grade})' : ''} Syllabus',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineSmallIsCustom,
                              ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CHAPTERS_PAGE_Container_apt78qij_ON_TAP');
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(ProfileWidget.routeName);
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 30.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  if (_model.isLoading) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget.subject,
                                          'Subject',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Table of Contents',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final chapterList = _model
                                              .subjectDataDoc?.chapters
                                              .where(
                                                  (e) => e.isDisplay == true)
                                              .toList()
                                              .sortedList(
                                                  keyOf: (e) =>
                                                      e.chapterSequence,
                                                  desc: false)
                                              .toList() ??
                                          [];

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          20.0,
                                          0,
                                          20.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: chapterList.length,
                                        itemBuilder:
                                            (context, chapterListIndex) {
                                          final chapterListItem =
                                              chapterList[chapterListIndex];
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 30.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                          logFirebaseEvent(
                                                              'CHAPTERS_PAGE_Text_is06drg7_ON_TAP');
                                                          if (chapterListItem
                                                              .canAccess) {
                                                            if (revenue_cat
                                                                .activeEntitlementIds
                                                                .contains(
                                                                    FFAppConstants
                                                                        .EntitlementIDVideoAccess)) {
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
                                                                TopicsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'examSequence':
                                                                      serializeParam(
                                                                    widget
                                                                        .examSequence,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'subjectSequence':
                                                                      serializeParam(
                                                                    widget
                                                                        .subjectSequence,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'exam':
                                                                      serializeParam(
                                                                    widget
                                                                        .exam,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'grade':
                                                                      serializeParam(
                                                                    widget
                                                                        .grade,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'subject':
                                                                      serializeParam(
                                                                    widget
                                                                        .subject,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'chapter':
                                                                      serializeParam(
                                                                    chapterListItem
                                                                        .chapter,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'chapterSequence':
                                                                      serializeParam(
                                                                    chapterListItem
                                                                        .chapterSequence,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              if (chapterListItem
                                                                  .isPaid) {
                                                                if ((currentUserDocument?.chapterPaymentList.toList() ??
                                                                            [])
                                                                        .where((e) =>
                                                                            e.chapterCode ==
                                                                            chapterListItem.chapterCode)
                                                                        .toList()
                                                                        .length >
                                                                    0) {
                                                                  logFirebaseEvent(
                                                                      'Text_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    TopicsWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'examSequence':
                                                                          serializeParam(
                                                                        widget
                                                                            .examSequence,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'subjectSequence':
                                                                          serializeParam(
                                                                        widget
                                                                            .subjectSequence,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'exam':
                                                                          serializeParam(
                                                                        widget
                                                                            .exam,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'grade':
                                                                          serializeParam(
                                                                        widget
                                                                            .grade,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'subject':
                                                                          serializeParam(
                                                                        widget
                                                                            .subject,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'chapter':
                                                                          serializeParam(
                                                                        chapterListItem
                                                                            .chapter,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'chapterSequence':
                                                                          serializeParam(
                                                                        chapterListItem
                                                                            .chapterSequence,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Text_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              PaymentBoxWidget(
                                                                            exam:
                                                                                widget.exam!,
                                                                            grade:
                                                                                widget.grade,
                                                                            subject:
                                                                                widget.subject!,
                                                                            examSequence:
                                                                                widget.examSequence,
                                                                            subjectSequence:
                                                                                widget.subjectSequence,
                                                                            packageID:
                                                                                chapterListItem.packageId,
                                                                            chapterItem:
                                                                                chapterListItem,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  TopicsWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'examSequence':
                                                                        serializeParam(
                                                                      widget
                                                                          .examSequence,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'subjectSequence':
                                                                        serializeParam(
                                                                      widget
                                                                          .subjectSequence,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'exam':
                                                                        serializeParam(
                                                                      widget
                                                                          .exam,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'grade':
                                                                        serializeParam(
                                                                      widget
                                                                          .grade,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subject':
                                                                        serializeParam(
                                                                      widget
                                                                          .subject,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'chapter':
                                                                        serializeParam(
                                                                      chapterListItem
                                                                          .chapter,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'chapterSequence':
                                                                        serializeParam(
                                                                      chapterListItem
                                                                          .chapterSequence,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Text_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'You cannot access this chapter',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        child: Text(
                                                          '${(chapterListIndex + 1).toString()}. ${chapterListItem.chapter}'
                                                              .trim(),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
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
                                                      ),
                                                    ),
                                                  ),
                                                  if (((chapterListItem
                                                                  .isPaid ==
                                                              true) &&
                                                          !valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.premiumSubscriber,
                                                              false)) &&
                                                      responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CHAPTERS_PAGE_Container_caq7vv6q_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_revenue_cat');
                                                              _model.purchaseSuccessful1 =
                                                                  await revenue_cat.purchasePackage(revenue_cat
                                                                      .offerings!
                                                                      .current!
                                                                      .lifetime!
                                                                      .identifier);
                                                              if (_model
                                                                  .purchaseSuccessful1!) {
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  premiumSubscriber:
                                                                      true,
                                                                ));
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'There was some error. Please try again.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: 80.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Subscribe',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (chapterListItem.isPaid &&
                                                      ((currentUserDocument
                                                                      ?.chapterPaymentList
                                                                      .toList() ??
                                                                  [])
                                                              .where((e) =>
                                                                  e.chapterCode ==
                                                                  chapterListItem
                                                                      .chapterCode)
                                                              .toList()
                                                              .length ==
                                                          0) &&
                                                      !revenue_cat
                                                          .activeEntitlementIds
                                                          .contains(FFAppConstants
                                                              .EntitlementIDVideoAccess))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Text(
                                                        revenue_cat
                                                            .offerings!
                                                            .current!
                                                            .availablePackages
                                                            .where((e) =>
                                                                e.identifier ==
                                                                chapterListItem
                                                                    .packageId)
                                                            .toList()
                                                            .firstOrNull!
                                                            .storeProduct
                                                            .priceString,
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
                                                  if (!chapterListItem
                                                      .canAccess)
                                                    Icon(
                                                      Icons.lock,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Loading..',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
