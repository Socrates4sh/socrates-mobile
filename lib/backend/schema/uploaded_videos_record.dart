import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadedVideosRecord extends FirestoreRecord {
  UploadedVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter" field.
  String? _chapter;
  String get chapter => _chapter ?? '';
  bool hasChapter() => _chapter != null;

  // "exam" field.
  String? _exam;
  String get exam => _exam ?? '';
  bool hasExam() => _exam != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "video_name" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  // "video_sequence" field.
  double? _videoSequence;
  double get videoSequence => _videoSequence ?? 0.0;
  bool hasVideoSequence() => _videoSequence != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  void _initializeFields() {
    _chapter = snapshotData['chapter'] as String?;
    _exam = snapshotData['exam'] as String?;
    _subject = snapshotData['subject'] as String?;
    _topic = snapshotData['topic'] as String?;
    _videoName = snapshotData['video_name'] as String?;
    _isDisplay = snapshotData['is_display'] as bool?;
    _videoSequence = castToType<double>(snapshotData['video_sequence']);
    _videoUrl = snapshotData['video_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('uploadedVideos');

  static Stream<UploadedVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UploadedVideosRecord.fromSnapshot(s));

  static Future<UploadedVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UploadedVideosRecord.fromSnapshot(s));

  static UploadedVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UploadedVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UploadedVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UploadedVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UploadedVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UploadedVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUploadedVideosRecordData({
  String? chapter,
  String? exam,
  String? subject,
  String? topic,
  String? videoName,
  bool? isDisplay,
  double? videoSequence,
  String? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter': chapter,
      'exam': exam,
      'subject': subject,
      'topic': topic,
      'video_name': videoName,
      'is_display': isDisplay,
      'video_sequence': videoSequence,
      'video_url': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UploadedVideosRecordDocumentEquality
    implements Equality<UploadedVideosRecord> {
  const UploadedVideosRecordDocumentEquality();

  @override
  bool equals(UploadedVideosRecord? e1, UploadedVideosRecord? e2) {
    return e1?.chapter == e2?.chapter &&
        e1?.exam == e2?.exam &&
        e1?.subject == e2?.subject &&
        e1?.topic == e2?.topic &&
        e1?.videoName == e2?.videoName &&
        e1?.isDisplay == e2?.isDisplay &&
        e1?.videoSequence == e2?.videoSequence &&
        e1?.videoUrl == e2?.videoUrl;
  }

  @override
  int hash(UploadedVideosRecord? e) => const ListEquality().hash([
        e?.chapter,
        e?.exam,
        e?.subject,
        e?.topic,
        e?.videoName,
        e?.isDisplay,
        e?.videoSequence,
        e?.videoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is UploadedVideosRecord;
}
