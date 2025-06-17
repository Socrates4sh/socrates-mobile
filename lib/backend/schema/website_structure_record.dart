import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WebsiteStructureRecord extends FirestoreRecord {
  WebsiteStructureRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nav_seq" field.
  int? _navSeq;
  int get navSeq => _navSeq ?? 0;
  bool hasNavSeq() => _navSeq != null;

  // "categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  void _initializeFields() {
    _navSeq = castToType<int>(snapshotData['nav_seq']);
    _categories = snapshotData['categories'] as String?;
    _isDisplay = snapshotData['is_display'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WebsiteStructure');

  static Stream<WebsiteStructureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WebsiteStructureRecord.fromSnapshot(s));

  static Future<WebsiteStructureRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WebsiteStructureRecord.fromSnapshot(s));

  static WebsiteStructureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WebsiteStructureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WebsiteStructureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WebsiteStructureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WebsiteStructureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WebsiteStructureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWebsiteStructureRecordData({
  int? navSeq,
  String? categories,
  bool? isDisplay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nav_seq': navSeq,
      'categories': categories,
      'is_display': isDisplay,
    }.withoutNulls,
  );

  return firestoreData;
}

class WebsiteStructureRecordDocumentEquality
    implements Equality<WebsiteStructureRecord> {
  const WebsiteStructureRecordDocumentEquality();

  @override
  bool equals(WebsiteStructureRecord? e1, WebsiteStructureRecord? e2) {
    return e1?.navSeq == e2?.navSeq &&
        e1?.categories == e2?.categories &&
        e1?.isDisplay == e2?.isDisplay;
  }

  @override
  int hash(WebsiteStructureRecord? e) =>
      const ListEquality().hash([e?.navSeq, e?.categories, e?.isDisplay]);

  @override
  bool isValidKey(Object? o) => o is WebsiteStructureRecord;
}
