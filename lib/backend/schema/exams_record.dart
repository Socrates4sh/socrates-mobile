import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExamsRecord extends FirestoreRecord {
  ExamsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "exam_sequence" field.
  int? _examSequence;
  int get examSequence => _examSequence ?? 0;
  bool hasExamSequence() => _examSequence != null;

  // "exam" field.
  String? _exam;
  String get exam => _exam ?? '';
  bool hasExam() => _exam != null;

  // "exam_image_url" field.
  String? _examImageUrl;
  String get examImageUrl => _examImageUrl ?? '';
  bool hasExamImageUrl() => _examImageUrl != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  // "subheading" field.
  String? _subheading;
  String get subheading => _subheading ?? '';
  bool hasSubheading() => _subheading != null;

  void _initializeFields() {
    _examSequence = castToType<int>(snapshotData['exam_sequence']);
    _exam = snapshotData['exam'] as String?;
    _examImageUrl = snapshotData['exam_image_url'] as String?;
    _isDisplay = snapshotData['is_display'] as bool?;
    _subheading = snapshotData['subheading'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exams');

  static Stream<ExamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExamsRecord.fromSnapshot(s));

  static Future<ExamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExamsRecord.fromSnapshot(s));

  static ExamsRecord fromSnapshot(DocumentSnapshot snapshot) => ExamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExamsRecordData({
  int? examSequence,
  String? exam,
  String? examImageUrl,
  bool? isDisplay,
  String? subheading,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'exam_sequence': examSequence,
      'exam': exam,
      'exam_image_url': examImageUrl,
      'is_display': isDisplay,
      'subheading': subheading,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExamsRecordDocumentEquality implements Equality<ExamsRecord> {
  const ExamsRecordDocumentEquality();

  @override
  bool equals(ExamsRecord? e1, ExamsRecord? e2) {
    return e1?.examSequence == e2?.examSequence &&
        e1?.exam == e2?.exam &&
        e1?.examImageUrl == e2?.examImageUrl &&
        e1?.isDisplay == e2?.isDisplay &&
        e1?.subheading == e2?.subheading;
  }

  @override
  int hash(ExamsRecord? e) => const ListEquality().hash(
      [e?.examSequence, e?.exam, e?.examImageUrl, e?.isDisplay, e?.subheading]);

  @override
  bool isValidKey(Object? o) => o is ExamsRecord;
}
