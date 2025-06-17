// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentDetailsStruct extends FFFirebaseStruct {
  PaymentDetailsStruct({
    String? paymentSubject,
    DocumentReference? subjectDocRef,
    String? paymentString,
    String? paymentPackageID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _paymentSubject = paymentSubject,
        _subjectDocRef = subjectDocRef,
        _paymentString = paymentString,
        _paymentPackageID = paymentPackageID,
        super(firestoreUtilData);

  // "paymentSubject" field.
  String? _paymentSubject;
  String get paymentSubject => _paymentSubject ?? '';
  set paymentSubject(String? val) => _paymentSubject = val;

  bool hasPaymentSubject() => _paymentSubject != null;

  // "subjectDocRef" field.
  DocumentReference? _subjectDocRef;
  DocumentReference? get subjectDocRef => _subjectDocRef;
  set subjectDocRef(DocumentReference? val) => _subjectDocRef = val;

  bool hasSubjectDocRef() => _subjectDocRef != null;

  // "paymentString" field.
  String? _paymentString;
  String get paymentString => _paymentString ?? '';
  set paymentString(String? val) => _paymentString = val;

  bool hasPaymentString() => _paymentString != null;

  // "paymentPackageID" field.
  String? _paymentPackageID;
  String get paymentPackageID => _paymentPackageID ?? '';
  set paymentPackageID(String? val) => _paymentPackageID = val;

  bool hasPaymentPackageID() => _paymentPackageID != null;

  static PaymentDetailsStruct fromMap(Map<String, dynamic> data) =>
      PaymentDetailsStruct(
        paymentSubject: data['paymentSubject'] as String?,
        subjectDocRef: data['subjectDocRef'] as DocumentReference?,
        paymentString: data['paymentString'] as String?,
        paymentPackageID: data['paymentPackageID'] as String?,
      );

  static PaymentDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'paymentSubject': _paymentSubject,
        'subjectDocRef': _subjectDocRef,
        'paymentString': _paymentString,
        'paymentPackageID': _paymentPackageID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'paymentSubject': serializeParam(
          _paymentSubject,
          ParamType.String,
        ),
        'subjectDocRef': serializeParam(
          _subjectDocRef,
          ParamType.DocumentReference,
        ),
        'paymentString': serializeParam(
          _paymentString,
          ParamType.String,
        ),
        'paymentPackageID': serializeParam(
          _paymentPackageID,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentDetailsStruct(
        paymentSubject: deserializeParam(
          data['paymentSubject'],
          ParamType.String,
          false,
        ),
        subjectDocRef: deserializeParam(
          data['subjectDocRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['exams', 'subjects'],
        ),
        paymentString: deserializeParam(
          data['paymentString'],
          ParamType.String,
          false,
        ),
        paymentPackageID: deserializeParam(
          data['paymentPackageID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentDetailsStruct &&
        paymentSubject == other.paymentSubject &&
        subjectDocRef == other.subjectDocRef &&
        paymentString == other.paymentString &&
        paymentPackageID == other.paymentPackageID;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([paymentSubject, subjectDocRef, paymentString, paymentPackageID]);
}

PaymentDetailsStruct createPaymentDetailsStruct({
  String? paymentSubject,
  DocumentReference? subjectDocRef,
  String? paymentString,
  String? paymentPackageID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentDetailsStruct(
      paymentSubject: paymentSubject,
      subjectDocRef: subjectDocRef,
      paymentString: paymentString,
      paymentPackageID: paymentPackageID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentDetailsStruct? updatePaymentDetailsStruct(
  PaymentDetailsStruct? paymentDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentDetailsStructData(
  Map<String, dynamic> firestoreData,
  PaymentDetailsStruct? paymentDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentDetails == null) {
    return;
  }
  if (paymentDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentDetailsData =
      getPaymentDetailsFirestoreData(paymentDetails, forFieldValue);
  final nestedData =
      paymentDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentDetailsFirestoreData(
  PaymentDetailsStruct? paymentDetails, [
  bool forFieldValue = false,
]) {
  if (paymentDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentDetails.toMap());

  // Add any Firestore field values
  paymentDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentDetailsListFirestoreData(
  List<PaymentDetailsStruct>? paymentDetailss,
) =>
    paymentDetailss
        ?.map((e) => getPaymentDetailsFirestoreData(e, true))
        .toList() ??
    [];
