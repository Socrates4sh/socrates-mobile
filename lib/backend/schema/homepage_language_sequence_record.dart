import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomepageLanguageSequenceRecord extends FirestoreRecord {
  HomepageLanguageSequenceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lang_seq" field.
  int? _langSeq;
  int get langSeq => _langSeq ?? 0;
  bool hasLangSeq() => _langSeq != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _langSeq = castToType<int>(snapshotData['lang_seq']);
    _language = snapshotData['language'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('homepageLanguageSequence')
          : FirebaseFirestore.instance
              .collectionGroup('homepageLanguageSequence');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('homepageLanguageSequence').doc(id);

  static Stream<HomepageLanguageSequenceRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => HomepageLanguageSequenceRecord.fromSnapshot(s));

  static Future<HomepageLanguageSequenceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HomepageLanguageSequenceRecord.fromSnapshot(s));

  static HomepageLanguageSequenceRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      HomepageLanguageSequenceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomepageLanguageSequenceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomepageLanguageSequenceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomepageLanguageSequenceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomepageLanguageSequenceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomepageLanguageSequenceRecordData({
  int? langSeq,
  String? language,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lang_seq': langSeq,
      'language': language,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomepageLanguageSequenceRecordDocumentEquality
    implements Equality<HomepageLanguageSequenceRecord> {
  const HomepageLanguageSequenceRecordDocumentEquality();

  @override
  bool equals(
      HomepageLanguageSequenceRecord? e1, HomepageLanguageSequenceRecord? e2) {
    return e1?.langSeq == e2?.langSeq && e1?.language == e2?.language;
  }

  @override
  int hash(HomepageLanguageSequenceRecord? e) =>
      const ListEquality().hash([e?.langSeq, e?.language]);

  @override
  bool isValidKey(Object? o) => o is HomepageLanguageSequenceRecord;
}
