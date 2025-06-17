// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionPaymentStruct extends FFFirebaseStruct {
  SubscriptionPaymentStruct({
    String? subscriptionPlan,
    DateTime? subscriptionDate,
    String? packageID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subscriptionPlan = subscriptionPlan,
        _subscriptionDate = subscriptionDate,
        _packageID = packageID,
        super(firestoreUtilData);

  // "subscriptionPlan" field.
  String? _subscriptionPlan;
  String get subscriptionPlan => _subscriptionPlan ?? '';
  set subscriptionPlan(String? val) => _subscriptionPlan = val;

  bool hasSubscriptionPlan() => _subscriptionPlan != null;

  // "subscriptionDate" field.
  DateTime? _subscriptionDate;
  DateTime? get subscriptionDate => _subscriptionDate;
  set subscriptionDate(DateTime? val) => _subscriptionDate = val;

  bool hasSubscriptionDate() => _subscriptionDate != null;

  // "packageID" field.
  String? _packageID;
  String get packageID => _packageID ?? '';
  set packageID(String? val) => _packageID = val;

  bool hasPackageID() => _packageID != null;

  static SubscriptionPaymentStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionPaymentStruct(
        subscriptionPlan: data['subscriptionPlan'] as String?,
        subscriptionDate: data['subscriptionDate'] as DateTime?,
        packageID: data['packageID'] as String?,
      );

  static SubscriptionPaymentStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionPaymentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subscriptionPlan': _subscriptionPlan,
        'subscriptionDate': _subscriptionDate,
        'packageID': _packageID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subscriptionPlan': serializeParam(
          _subscriptionPlan,
          ParamType.String,
        ),
        'subscriptionDate': serializeParam(
          _subscriptionDate,
          ParamType.DateTime,
        ),
        'packageID': serializeParam(
          _packageID,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubscriptionPaymentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubscriptionPaymentStruct(
        subscriptionPlan: deserializeParam(
          data['subscriptionPlan'],
          ParamType.String,
          false,
        ),
        subscriptionDate: deserializeParam(
          data['subscriptionDate'],
          ParamType.DateTime,
          false,
        ),
        packageID: deserializeParam(
          data['packageID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SubscriptionPaymentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionPaymentStruct &&
        subscriptionPlan == other.subscriptionPlan &&
        subscriptionDate == other.subscriptionDate &&
        packageID == other.packageID;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subscriptionPlan, subscriptionDate, packageID]);
}

SubscriptionPaymentStruct createSubscriptionPaymentStruct({
  String? subscriptionPlan,
  DateTime? subscriptionDate,
  String? packageID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionPaymentStruct(
      subscriptionPlan: subscriptionPlan,
      subscriptionDate: subscriptionDate,
      packageID: packageID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionPaymentStruct? updateSubscriptionPaymentStruct(
  SubscriptionPaymentStruct? subscriptionPayment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscriptionPayment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionPaymentStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionPaymentStruct? subscriptionPayment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscriptionPayment == null) {
    return;
  }
  if (subscriptionPayment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscriptionPayment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionPaymentData =
      getSubscriptionPaymentFirestoreData(subscriptionPayment, forFieldValue);
  final nestedData =
      subscriptionPaymentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      subscriptionPayment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionPaymentFirestoreData(
  SubscriptionPaymentStruct? subscriptionPayment, [
  bool forFieldValue = false,
]) {
  if (subscriptionPayment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscriptionPayment.toMap());

  // Add any Firestore field values
  subscriptionPayment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionPaymentListFirestoreData(
  List<SubscriptionPaymentStruct>? subscriptionPayments,
) =>
    subscriptionPayments
        ?.map((e) => getSubscriptionPaymentFirestoreData(e, true))
        .toList() ??
    [];
