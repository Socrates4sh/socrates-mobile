import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentPlanDetailsRecord extends FirestoreRecord {
  PaymentPlanDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "plan_id" field.
  String? _planId;
  String get planId => _planId ?? '';
  bool hasPlanId() => _planId != null;

  // "plan_type" field.
  String? _planType;
  String get planType => _planType ?? '';
  bool hasPlanType() => _planType != null;

  // "original_price" field.
  int? _originalPrice;
  int get originalPrice => _originalPrice ?? 0;
  bool hasOriginalPrice() => _originalPrice != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _planId = snapshotData['plan_id'] as String?;
    _planType = snapshotData['plan_type'] as String?;
    _originalPrice = castToType<int>(snapshotData['original_price']);
    _isDisplay = snapshotData['is_display'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('payment_plan_details')
          : FirebaseFirestore.instance.collectionGroup('payment_plan_details');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('payment_plan_details').doc(id);

  static Stream<PaymentPlanDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentPlanDetailsRecord.fromSnapshot(s));

  static Future<PaymentPlanDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PaymentPlanDetailsRecord.fromSnapshot(s));

  static PaymentPlanDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentPlanDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentPlanDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentPlanDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentPlanDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentPlanDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentPlanDetailsRecordData({
  String? planId,
  String? planType,
  int? originalPrice,
  bool? isDisplay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plan_id': planId,
      'plan_type': planType,
      'original_price': originalPrice,
      'is_display': isDisplay,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentPlanDetailsRecordDocumentEquality
    implements Equality<PaymentPlanDetailsRecord> {
  const PaymentPlanDetailsRecordDocumentEquality();

  @override
  bool equals(PaymentPlanDetailsRecord? e1, PaymentPlanDetailsRecord? e2) {
    return e1?.planId == e2?.planId &&
        e1?.planType == e2?.planType &&
        e1?.originalPrice == e2?.originalPrice &&
        e1?.isDisplay == e2?.isDisplay;
  }

  @override
  int hash(PaymentPlanDetailsRecord? e) => const ListEquality()
      .hash([e?.planId, e?.planType, e?.originalPrice, e?.isDisplay]);

  @override
  bool isValidKey(Object? o) => o is PaymentPlanDetailsRecord;
}
