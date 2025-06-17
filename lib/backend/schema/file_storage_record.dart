import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileStorageRecord extends FirestoreRecord {
  FileStorageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "file_video_url" field.
  String? _fileVideoUrl;
  String get fileVideoUrl => _fileVideoUrl ?? '';
  bool hasFileVideoUrl() => _fileVideoUrl != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _fileVideoUrl = snapshotData['file_video_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FileStorage');

  static Stream<FileStorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FileStorageRecord.fromSnapshot(s));

  static Future<FileStorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FileStorageRecord.fromSnapshot(s));

  static FileStorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FileStorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FileStorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FileStorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FileStorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FileStorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFileStorageRecordData({
  String? title,
  String? fileVideoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'file_video_url': fileVideoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class FileStorageRecordDocumentEquality implements Equality<FileStorageRecord> {
  const FileStorageRecordDocumentEquality();

  @override
  bool equals(FileStorageRecord? e1, FileStorageRecord? e2) {
    return e1?.title == e2?.title && e1?.fileVideoUrl == e2?.fileVideoUrl;
  }

  @override
  int hash(FileStorageRecord? e) =>
      const ListEquality().hash([e?.title, e?.fileVideoUrl]);

  @override
  bool isValidKey(Object? o) => o is FileStorageRecord;
}
