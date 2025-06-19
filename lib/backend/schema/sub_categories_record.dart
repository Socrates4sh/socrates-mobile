import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubCategoriesRecord extends FirestoreRecord {
  SubCategoriesRecord._(
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

  // "entrance" field.
  String? _entrance;
  String get entrance => _entrance ?? '';
  bool hasEntrance() => _entrance != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "exam_image_url" field.
  String? _examImageUrl;
  String get examImageUrl => _examImageUrl ?? '';
  bool hasExamImageUrl() => _examImageUrl != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  // "subjects" field.
  List<SubjectsWebsiteStruct>? _subjects;
  List<SubjectsWebsiteStruct> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _examSequence = castToType<int>(snapshotData['exam_sequence']);
    _exam = snapshotData['exam'] as String?;
    _entrance = snapshotData['entrance'] as String?;
    _region = snapshotData['region'] as String?;
    _examImageUrl = snapshotData['exam_image_url'] as String?;
    _isDisplay = snapshotData['is_display'] as bool?;
    _subjects = getStructList(
      snapshotData['subjects'],
      SubjectsWebsiteStruct.fromMap,
    );
    _language = snapshotData['language'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sub-categories')
          : FirebaseFirestore.instance.collectionGroup('sub-categories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sub-categories').doc(id);

  static Stream<SubCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubCategoriesRecord.fromSnapshot(s));

  static Future<SubCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubCategoriesRecord.fromSnapshot(s));

  static SubCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubCategoriesRecordData({
  int? examSequence,
  String? exam,
  String? entrance,
  String? region,
  String? examImageUrl,
  bool? isDisplay,
  String? language,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'exam_sequence': examSequence,
      'exam': exam,
      'entrance': entrance,
      'region': region,
      'exam_image_url': examImageUrl,
      'is_display': isDisplay,
      'language': language,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubCategoriesRecordDocumentEquality
    implements Equality<SubCategoriesRecord> {
  const SubCategoriesRecordDocumentEquality();

  @override
  bool equals(SubCategoriesRecord? e1, SubCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.examSequence == e2?.examSequence &&
        e1?.exam == e2?.exam &&
        e1?.entrance == e2?.entrance &&
        e1?.region == e2?.region &&
        e1?.examImageUrl == e2?.examImageUrl &&
        e1?.isDisplay == e2?.isDisplay &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.language == e2?.language;
  }

  @override
  int hash(SubCategoriesRecord? e) => const ListEquality().hash([
        e?.examSequence,
        e?.exam,
        e?.entrance,
        e?.region,
        e?.examImageUrl,
        e?.isDisplay,
        e?.subjects,
        e?.language
      ]);

  @override
  bool isValidKey(Object? o) => o is SubCategoriesRecord;
}
