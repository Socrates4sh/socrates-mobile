// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectChaptersStruct extends FFFirebaseStruct {
  SubjectChaptersStruct({
    String? chapterCode,
    int? chapterSequence,
    String? exam,
    String? subject,
    String? chapter,
    List<String>? topics,
    bool? isPaid,
    bool? isDisplay,
    bool? canAccess,
    String? packageId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chapterCode = chapterCode,
        _chapterSequence = chapterSequence,
        _exam = exam,
        _subject = subject,
        _chapter = chapter,
        _topics = topics,
        _isPaid = isPaid,
        _isDisplay = isDisplay,
        _canAccess = canAccess,
        _packageId = packageId,
        super(firestoreUtilData);

  // "chapter_code" field.
  String? _chapterCode;
  String get chapterCode => _chapterCode ?? '';
  set chapterCode(String? val) => _chapterCode = val;

  bool hasChapterCode() => _chapterCode != null;

  // "chapter_sequence" field.
  int? _chapterSequence;
  int get chapterSequence => _chapterSequence ?? 0;
  set chapterSequence(int? val) => _chapterSequence = val;

  void incrementChapterSequence(int amount) =>
      chapterSequence = chapterSequence + amount;

  bool hasChapterSequence() => _chapterSequence != null;

  // "exam" field.
  String? _exam;
  String get exam => _exam ?? '';
  set exam(String? val) => _exam = val;

  bool hasExam() => _exam != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "chapter" field.
  String? _chapter;
  String get chapter => _chapter ?? '';
  set chapter(String? val) => _chapter = val;

  bool hasChapter() => _chapter != null;

  // "topics" field.
  List<String>? _topics;
  List<String> get topics => _topics ?? const [];
  set topics(List<String>? val) => _topics = val;

  void updateTopics(Function(List<String>) updateFn) {
    updateFn(_topics ??= []);
  }

  bool hasTopics() => _topics != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  set isPaid(bool? val) => _isPaid = val;

  bool hasIsPaid() => _isPaid != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  set isDisplay(bool? val) => _isDisplay = val;

  bool hasIsDisplay() => _isDisplay != null;

  // "canAccess" field.
  bool? _canAccess;
  bool get canAccess => _canAccess ?? false;
  set canAccess(bool? val) => _canAccess = val;

  bool hasCanAccess() => _canAccess != null;

  // "packageId" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  set packageId(String? val) => _packageId = val;

  bool hasPackageId() => _packageId != null;

  static SubjectChaptersStruct fromMap(Map<String, dynamic> data) =>
      SubjectChaptersStruct(
        chapterCode: data['chapter_code'] as String?,
        chapterSequence: castToType<int>(data['chapter_sequence']),
        exam: data['exam'] as String?,
        subject: data['subject'] as String?,
        chapter: data['chapter'] as String?,
        topics: getDataList(data['topics']),
        isPaid: data['isPaid'] as bool?,
        isDisplay: data['is_display'] as bool?,
        canAccess: data['canAccess'] as bool?,
        packageId: data['packageId'] as String?,
      );

  static SubjectChaptersStruct? maybeFromMap(dynamic data) => data is Map
      ? SubjectChaptersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chapter_code': _chapterCode,
        'chapter_sequence': _chapterSequence,
        'exam': _exam,
        'subject': _subject,
        'chapter': _chapter,
        'topics': _topics,
        'isPaid': _isPaid,
        'is_display': _isDisplay,
        'canAccess': _canAccess,
        'packageId': _packageId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chapter_code': serializeParam(
          _chapterCode,
          ParamType.String,
        ),
        'chapter_sequence': serializeParam(
          _chapterSequence,
          ParamType.int,
        ),
        'exam': serializeParam(
          _exam,
          ParamType.String,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'chapter': serializeParam(
          _chapter,
          ParamType.String,
        ),
        'topics': serializeParam(
          _topics,
          ParamType.String,
          isList: true,
        ),
        'isPaid': serializeParam(
          _isPaid,
          ParamType.bool,
        ),
        'is_display': serializeParam(
          _isDisplay,
          ParamType.bool,
        ),
        'canAccess': serializeParam(
          _canAccess,
          ParamType.bool,
        ),
        'packageId': serializeParam(
          _packageId,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubjectChaptersStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubjectChaptersStruct(
        chapterCode: deserializeParam(
          data['chapter_code'],
          ParamType.String,
          false,
        ),
        chapterSequence: deserializeParam(
          data['chapter_sequence'],
          ParamType.int,
          false,
        ),
        exam: deserializeParam(
          data['exam'],
          ParamType.String,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        chapter: deserializeParam(
          data['chapter'],
          ParamType.String,
          false,
        ),
        topics: deserializeParam<String>(
          data['topics'],
          ParamType.String,
          true,
        ),
        isPaid: deserializeParam(
          data['isPaid'],
          ParamType.bool,
          false,
        ),
        isDisplay: deserializeParam(
          data['is_display'],
          ParamType.bool,
          false,
        ),
        canAccess: deserializeParam(
          data['canAccess'],
          ParamType.bool,
          false,
        ),
        packageId: deserializeParam(
          data['packageId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SubjectChaptersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SubjectChaptersStruct &&
        chapterCode == other.chapterCode &&
        chapterSequence == other.chapterSequence &&
        exam == other.exam &&
        subject == other.subject &&
        chapter == other.chapter &&
        listEquality.equals(topics, other.topics) &&
        isPaid == other.isPaid &&
        isDisplay == other.isDisplay &&
        canAccess == other.canAccess &&
        packageId == other.packageId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        chapterCode,
        chapterSequence,
        exam,
        subject,
        chapter,
        topics,
        isPaid,
        isDisplay,
        canAccess,
        packageId
      ]);
}

SubjectChaptersStruct createSubjectChaptersStruct({
  String? chapterCode,
  int? chapterSequence,
  String? exam,
  String? subject,
  String? chapter,
  bool? isPaid,
  bool? isDisplay,
  bool? canAccess,
  String? packageId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubjectChaptersStruct(
      chapterCode: chapterCode,
      chapterSequence: chapterSequence,
      exam: exam,
      subject: subject,
      chapter: chapter,
      isPaid: isPaid,
      isDisplay: isDisplay,
      canAccess: canAccess,
      packageId: packageId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubjectChaptersStruct? updateSubjectChaptersStruct(
  SubjectChaptersStruct? subjectChapters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subjectChapters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubjectChaptersStructData(
  Map<String, dynamic> firestoreData,
  SubjectChaptersStruct? subjectChapters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subjectChapters == null) {
    return;
  }
  if (subjectChapters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subjectChapters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subjectChaptersData =
      getSubjectChaptersFirestoreData(subjectChapters, forFieldValue);
  final nestedData =
      subjectChaptersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subjectChapters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubjectChaptersFirestoreData(
  SubjectChaptersStruct? subjectChapters, [
  bool forFieldValue = false,
]) {
  if (subjectChapters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subjectChapters.toMap());

  // Add any Firestore field values
  subjectChapters.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubjectChaptersListFirestoreData(
  List<SubjectChaptersStruct>? subjectChapterss,
) =>
    subjectChapterss
        ?.map((e) => getSubjectChaptersFirestoreData(e, true))
        .toList() ??
    [];
