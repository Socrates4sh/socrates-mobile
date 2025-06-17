// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChapterPaymentDetailsStruct extends FFFirebaseStruct {
  ChapterPaymentDetailsStruct({
    String? chapterCode,
    String? chapterName,
    String? paymentAmount,
    String? paymentPackageID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chapterCode = chapterCode,
        _chapterName = chapterName,
        _paymentAmount = paymentAmount,
        _paymentPackageID = paymentPackageID,
        super(firestoreUtilData);

  // "chapterCode" field.
  String? _chapterCode;
  String get chapterCode => _chapterCode ?? '';
  set chapterCode(String? val) => _chapterCode = val;

  bool hasChapterCode() => _chapterCode != null;

  // "chapterName" field.
  String? _chapterName;
  String get chapterName => _chapterName ?? '';
  set chapterName(String? val) => _chapterName = val;

  bool hasChapterName() => _chapterName != null;

  // "paymentAmount" field.
  String? _paymentAmount;
  String get paymentAmount => _paymentAmount ?? '';
  set paymentAmount(String? val) => _paymentAmount = val;

  bool hasPaymentAmount() => _paymentAmount != null;

  // "paymentPackageID" field.
  String? _paymentPackageID;
  String get paymentPackageID => _paymentPackageID ?? '';
  set paymentPackageID(String? val) => _paymentPackageID = val;

  bool hasPaymentPackageID() => _paymentPackageID != null;

  static ChapterPaymentDetailsStruct fromMap(Map<String, dynamic> data) =>
      ChapterPaymentDetailsStruct(
        chapterCode: data['chapterCode'] as String?,
        chapterName: data['chapterName'] as String?,
        paymentAmount: data['paymentAmount'] as String?,
        paymentPackageID: data['paymentPackageID'] as String?,
      );

  static ChapterPaymentDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ChapterPaymentDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chapterCode': _chapterCode,
        'chapterName': _chapterName,
        'paymentAmount': _paymentAmount,
        'paymentPackageID': _paymentPackageID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chapterCode': serializeParam(
          _chapterCode,
          ParamType.String,
        ),
        'chapterName': serializeParam(
          _chapterName,
          ParamType.String,
        ),
        'paymentAmount': serializeParam(
          _paymentAmount,
          ParamType.String,
        ),
        'paymentPackageID': serializeParam(
          _paymentPackageID,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChapterPaymentDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChapterPaymentDetailsStruct(
        chapterCode: deserializeParam(
          data['chapterCode'],
          ParamType.String,
          false,
        ),
        chapterName: deserializeParam(
          data['chapterName'],
          ParamType.String,
          false,
        ),
        paymentAmount: deserializeParam(
          data['paymentAmount'],
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
  String toString() => 'ChapterPaymentDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChapterPaymentDetailsStruct &&
        chapterCode == other.chapterCode &&
        chapterName == other.chapterName &&
        paymentAmount == other.paymentAmount &&
        paymentPackageID == other.paymentPackageID;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([chapterCode, chapterName, paymentAmount, paymentPackageID]);
}

ChapterPaymentDetailsStruct createChapterPaymentDetailsStruct({
  String? chapterCode,
  String? chapterName,
  String? paymentAmount,
  String? paymentPackageID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChapterPaymentDetailsStruct(
      chapterCode: chapterCode,
      chapterName: chapterName,
      paymentAmount: paymentAmount,
      paymentPackageID: paymentPackageID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChapterPaymentDetailsStruct? updateChapterPaymentDetailsStruct(
  ChapterPaymentDetailsStruct? chapterPaymentDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chapterPaymentDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChapterPaymentDetailsStructData(
  Map<String, dynamic> firestoreData,
  ChapterPaymentDetailsStruct? chapterPaymentDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chapterPaymentDetails == null) {
    return;
  }
  if (chapterPaymentDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      chapterPaymentDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chapterPaymentDetailsData = getChapterPaymentDetailsFirestoreData(
      chapterPaymentDetails, forFieldValue);
  final nestedData =
      chapterPaymentDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      chapterPaymentDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChapterPaymentDetailsFirestoreData(
  ChapterPaymentDetailsStruct? chapterPaymentDetails, [
  bool forFieldValue = false,
]) {
  if (chapterPaymentDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chapterPaymentDetails.toMap());

  // Add any Firestore field values
  chapterPaymentDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChapterPaymentDetailsListFirestoreData(
  List<ChapterPaymentDetailsStruct>? chapterPaymentDetailss,
) =>
    chapterPaymentDetailss
        ?.map((e) => getChapterPaymentDetailsFirestoreData(e, true))
        .toList() ??
    [];
