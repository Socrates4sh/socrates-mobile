// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubjectsWebsiteStruct extends FFFirebaseStruct {
  SubjectsWebsiteStruct({
    int? sequence,
    String? subject,
    bool? isDisplay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sequence = sequence,
        _subject = subject,
        _isDisplay = isDisplay,
        super(firestoreUtilData);

  // "sequence" field.
  int? _sequence;
  int get sequence => _sequence ?? 0;
  set sequence(int? val) => _sequence = val;

  void incrementSequence(int amount) => sequence = sequence + amount;

  bool hasSequence() => _sequence != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  set isDisplay(bool? val) => _isDisplay = val;

  bool hasIsDisplay() => _isDisplay != null;

  static SubjectsWebsiteStruct fromMap(Map<String, dynamic> data) =>
      SubjectsWebsiteStruct(
        sequence: castToType<int>(data['sequence']),
        subject: data['subject'] as String?,
        isDisplay: data['is_display'] as bool?,
      );

  static SubjectsWebsiteStruct? maybeFromMap(dynamic data) => data is Map
      ? SubjectsWebsiteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sequence': _sequence,
        'subject': _subject,
        'is_display': _isDisplay,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sequence': serializeParam(
          _sequence,
          ParamType.int,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'is_display': serializeParam(
          _isDisplay,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SubjectsWebsiteStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubjectsWebsiteStruct(
        sequence: deserializeParam(
          data['sequence'],
          ParamType.int,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        isDisplay: deserializeParam(
          data['is_display'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SubjectsWebsiteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubjectsWebsiteStruct &&
        sequence == other.sequence &&
        subject == other.subject &&
        isDisplay == other.isDisplay;
  }

  @override
  int get hashCode => const ListEquality().hash([sequence, subject, isDisplay]);
}

SubjectsWebsiteStruct createSubjectsWebsiteStruct({
  int? sequence,
  String? subject,
  bool? isDisplay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubjectsWebsiteStruct(
      sequence: sequence,
      subject: subject,
      isDisplay: isDisplay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubjectsWebsiteStruct? updateSubjectsWebsiteStruct(
  SubjectsWebsiteStruct? subjectsWebsite, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subjectsWebsite
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubjectsWebsiteStructData(
  Map<String, dynamic> firestoreData,
  SubjectsWebsiteStruct? subjectsWebsite,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subjectsWebsite == null) {
    return;
  }
  if (subjectsWebsite.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subjectsWebsite.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subjectsWebsiteData =
      getSubjectsWebsiteFirestoreData(subjectsWebsite, forFieldValue);
  final nestedData =
      subjectsWebsiteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subjectsWebsite.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubjectsWebsiteFirestoreData(
  SubjectsWebsiteStruct? subjectsWebsite, [
  bool forFieldValue = false,
]) {
  if (subjectsWebsite == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subjectsWebsite.toMap());

  // Add any Firestore field values
  subjectsWebsite.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubjectsWebsiteListFirestoreData(
  List<SubjectsWebsiteStruct>? subjectsWebsites,
) =>
    subjectsWebsites
        ?.map((e) => getSubjectsWebsiteFirestoreData(e, true))
        .toList() ??
    [];
