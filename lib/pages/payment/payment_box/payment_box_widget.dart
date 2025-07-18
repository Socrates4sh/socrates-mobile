import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_box_model.dart';
export 'payment_box_model.dart';

/// PaymentBox for access to premium videos
class PaymentBoxWidget extends StatefulWidget {
  const PaymentBoxWidget({
    super.key,
    required this.exam,
    this.grade,
    required this.subject,
    this.examSequence,
    this.subjectSequence,
    required this.packageID,
    required this.chapterItem,
  });

  final String? exam;
  final String? grade;
  final String? subject;
  final int? examSequence;
  final int? subjectSequence;
  final String? packageID;
  final SubjectChaptersStruct? chapterItem;

  @override
  State<PaymentBoxWidget> createState() => _PaymentBoxWidgetState();
}

class _PaymentBoxWidgetState extends State<PaymentBoxWidget> {
  late PaymentBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Continue your learning with access to videos pertaining to this chapter.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                    Text(
                      revenue_cat.offerings!.current!.availablePackages
                          .where((e) => e.identifier == widget.packageID)
                          .toList()
                          .firstOrNull!
                          .storeProduct
                          .priceString,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelLargeIsCustom,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PAYMENT_BOX_Container_9psl8dei_ON_TAP');
                        logFirebaseEvent('Container_revenue_cat');
                        _model.purchaseSuccessful = await revenue_cat
                            .purchasePackage(widget.packageID!);
                        if (_model.purchaseSuccessful!) {
                          logFirebaseEvent('Container_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_backend_call');

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'chapterPaymentList': FieldValue.arrayUnion([
                                  getChapterPaymentDetailsFirestoreData(
                                    createChapterPaymentDetailsStruct(
                                      chapterCode:
                                          widget.chapterItem?.chapterCode,
                                      chapterName: widget.chapterItem?.chapter,
                                      paymentAmount: revenue_cat
                                          .offerings!.current!.availablePackages
                                          .where((e) =>
                                              e.identifier == widget.packageID)
                                          .toList()
                                          .firstOrNull!
                                          .storeProduct
                                          .priceString,
                                      paymentPackageID: widget.packageID,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            ChaptersWidget.routeName,
                            queryParameters: {
                              'exam': serializeParam(
                                widget.exam,
                                ParamType.String,
                              ),
                              'subject': serializeParam(
                                widget.subject,
                                ParamType.String,
                              ),
                              'grade': serializeParam(
                                widget.grade,
                                ParamType.String,
                              ),
                              'examSequence': serializeParam(
                                widget.examSequence,
                                ParamType.int,
                              ),
                              'subjectSequence': serializeParam(
                                widget.subjectSequence,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          logFirebaseEvent('Container_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'There was some error. Please try again.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: 80.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Subscribe',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 15.0,
                  borderWidth: 1.0,
                  buttonSize: 30.0,
                  fillColor: FlutterFlowTheme.of(context).secondary,
                  icon: Icon(
                    Icons.close_sharp,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 15.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('PAYMENT_BOX_COMP_close_sharp_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
