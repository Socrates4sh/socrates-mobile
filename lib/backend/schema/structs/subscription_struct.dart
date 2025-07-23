// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionStruct extends FFFirebaseStruct {
  SubscriptionStruct({
    double? planAmount,
    String? planTitle,
    DateTime? subscriptionDateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _planAmount = planAmount,
        _planTitle = planTitle,
        _subscriptionDateTime = subscriptionDateTime,
        super(firestoreUtilData);

  // "planAmount" field.
  double? _planAmount;
  double get planAmount => _planAmount ?? 0.0;
  set planAmount(double? val) => _planAmount = val;

  void incrementPlanAmount(double amount) => planAmount = planAmount + amount;

  bool hasPlanAmount() => _planAmount != null;

  // "planTitle" field.
  String? _planTitle;
  String get planTitle => _planTitle ?? '';
  set planTitle(String? val) => _planTitle = val;

  bool hasPlanTitle() => _planTitle != null;

  // "subscriptionDateTime" field.
  DateTime? _subscriptionDateTime;
  DateTime? get subscriptionDateTime => _subscriptionDateTime;
  set subscriptionDateTime(DateTime? val) => _subscriptionDateTime = val;

  bool hasSubscriptionDateTime() => _subscriptionDateTime != null;

  static SubscriptionStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        planAmount: castToType<double>(data['planAmount']),
        planTitle: data['planTitle'] as String?,
        subscriptionDateTime: data['subscriptionDateTime'] as DateTime?,
      );

  static SubscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'planAmount': _planAmount,
        'planTitle': _planTitle,
        'subscriptionDateTime': _subscriptionDateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'planAmount': serializeParam(
          _planAmount,
          ParamType.double,
        ),
        'planTitle': serializeParam(
          _planTitle,
          ParamType.String,
        ),
        'subscriptionDateTime': serializeParam(
          _subscriptionDateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SubscriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        planAmount: deserializeParam(
          data['planAmount'],
          ParamType.double,
          false,
        ),
        planTitle: deserializeParam(
          data['planTitle'],
          ParamType.String,
          false,
        ),
        subscriptionDateTime: deserializeParam(
          data['subscriptionDateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SubscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionStruct &&
        planAmount == other.planAmount &&
        planTitle == other.planTitle &&
        subscriptionDateTime == other.subscriptionDateTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([planAmount, planTitle, subscriptionDateTime]);
}

SubscriptionStruct createSubscriptionStruct({
  double? planAmount,
  String? planTitle,
  DateTime? subscriptionDateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionStruct(
      planAmount: planAmount,
      planTitle: planTitle,
      subscriptionDateTime: subscriptionDateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionStruct? updateSubscriptionStruct(
  SubscriptionStruct? subscription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionStruct? subscription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscription == null) {
    return;
  }
  if (subscription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionData =
      getSubscriptionFirestoreData(subscription, forFieldValue);
  final nestedData =
      subscriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subscription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionFirestoreData(
  SubscriptionStruct? subscription, [
  bool forFieldValue = false,
]) {
  if (subscription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscription.toMap());

  // Add any Firestore field values
  subscription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionListFirestoreData(
  List<SubscriptionStruct>? subscriptions,
) =>
    subscriptions?.map((e) => getSubscriptionFirestoreData(e, true)).toList() ??
    [];
