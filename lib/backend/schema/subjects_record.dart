import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectsRecord extends FirestoreRecord {
  SubjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subject_sequence" field.
  int? _subjectSequence;
  int get subjectSequence => _subjectSequence ?? 0;
  bool hasSubjectSequence() => _subjectSequence != null;

  // "exam" field.
  String? _exam;
  String get exam => _exam ?? '';
  bool hasExam() => _exam != null;

  // "subject_name" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  // "subject_image_url" field.
  String? _subjectImageUrl;
  String get subjectImageUrl => _subjectImageUrl ?? '';
  bool hasSubjectImageUrl() => _subjectImageUrl != null;

  // "chapters" field.
  List<SubjectChaptersStruct>? _chapters;
  List<SubjectChaptersStruct> get chapters => _chapters ?? const [];
  bool hasChapters() => _chapters != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _subjectSequence = castToType<int>(snapshotData['subject_sequence']);
    _exam = snapshotData['exam'] as String?;
    _subjectName = snapshotData['subject_name'] as String?;
    _subjectImageUrl = snapshotData['subject_image_url'] as String?;
    _chapters = getStructList(
      snapshotData['chapters'],
      SubjectChaptersStruct.fromMap,
    );
    _isDisplay = snapshotData['is_display'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subjects')
          : FirebaseFirestore.instance.collectionGroup('subjects');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('subjects').doc(id);

  static Stream<SubjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectsRecord.fromSnapshot(s));

  static Future<SubjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectsRecord.fromSnapshot(s));

  static SubjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectsRecordData({
  int? subjectSequence,
  String? exam,
  String? subjectName,
  String? subjectImageUrl,
  bool? isDisplay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subject_sequence': subjectSequence,
      'exam': exam,
      'subject_name': subjectName,
      'subject_image_url': subjectImageUrl,
      'is_display': isDisplay,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubjectsRecordDocumentEquality implements Equality<SubjectsRecord> {
  const SubjectsRecordDocumentEquality();

  @override
  bool equals(SubjectsRecord? e1, SubjectsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.subjectSequence == e2?.subjectSequence &&
        e1?.exam == e2?.exam &&
        e1?.subjectName == e2?.subjectName &&
        e1?.subjectImageUrl == e2?.subjectImageUrl &&
        listEquality.equals(e1?.chapters, e2?.chapters) &&
        e1?.isDisplay == e2?.isDisplay;
  }

  @override
  int hash(SubjectsRecord? e) => const ListEquality().hash([
        e?.subjectSequence,
        e?.exam,
        e?.subjectName,
        e?.subjectImageUrl,
        e?.chapters,
        e?.isDisplay
      ]);

  @override
  bool isValidKey(Object? o) => o is SubjectsRecord;
}
