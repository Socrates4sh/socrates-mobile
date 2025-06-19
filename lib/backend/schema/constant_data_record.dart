import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConstantDataRecord extends FirestoreRecord {
  ConstantDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data_dummy" field.
  String? _dataDummy;
  String get dataDummy => _dataDummy ?? '';
  bool hasDataDummy() => _dataDummy != null;

  void _initializeFields() {
    _dataDummy = snapshotData['data_dummy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ConstantData');

  static Stream<ConstantDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConstantDataRecord.fromSnapshot(s));

  static Future<ConstantDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConstantDataRecord.fromSnapshot(s));

  static ConstantDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConstantDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConstantDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConstantDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConstantDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConstantDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConstantDataRecordData({
  String? dataDummy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data_dummy': dataDummy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConstantDataRecordDocumentEquality
    implements Equality<ConstantDataRecord> {
  const ConstantDataRecordDocumentEquality();

  @override
  bool equals(ConstantDataRecord? e1, ConstantDataRecord? e2) {
    return e1?.dataDummy == e2?.dataDummy;
  }

  @override
  int hash(ConstantDataRecord? e) => const ListEquality().hash([e?.dataDummy]);

  @override
  bool isValidKey(Object? o) => o is ConstantDataRecord;
}
