// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HomeAllDataStruct extends FFFirebaseStruct {
  HomeAllDataStruct({
    DocumentReference? referenceWebStructure,
    String? subCategory,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _referenceWebStructure = referenceWebStructure,
        _subCategory = subCategory,
        _language = language,
        super(firestoreUtilData);

  // "referenceWebStructure" field.
  DocumentReference? _referenceWebStructure;
  DocumentReference? get referenceWebStructure => _referenceWebStructure;
  set referenceWebStructure(DocumentReference? val) =>
      _referenceWebStructure = val;

  bool hasReferenceWebStructure() => _referenceWebStructure != null;

  // "subCategory" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  set subCategory(String? val) => _subCategory = val;

  bool hasSubCategory() => _subCategory != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  static HomeAllDataStruct fromMap(Map<String, dynamic> data) =>
      HomeAllDataStruct(
        referenceWebStructure:
            data['referenceWebStructure'] as DocumentReference?,
        subCategory: data['subCategory'] as String?,
        language: data['language'] as String?,
      );

  static HomeAllDataStruct? maybeFromMap(dynamic data) => data is Map
      ? HomeAllDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'referenceWebStructure': _referenceWebStructure,
        'subCategory': _subCategory,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'referenceWebStructure': serializeParam(
          _referenceWebStructure,
          ParamType.DocumentReference,
        ),
        'subCategory': serializeParam(
          _subCategory,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static HomeAllDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      HomeAllDataStruct(
        referenceWebStructure: deserializeParam(
          data['referenceWebStructure'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['WebsiteStructure'],
        ),
        subCategory: deserializeParam(
          data['subCategory'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HomeAllDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HomeAllDataStruct &&
        referenceWebStructure == other.referenceWebStructure &&
        subCategory == other.subCategory &&
        language == other.language;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([referenceWebStructure, subCategory, language]);
}

HomeAllDataStruct createHomeAllDataStruct({
  DocumentReference? referenceWebStructure,
  String? subCategory,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HomeAllDataStruct(
      referenceWebStructure: referenceWebStructure,
      subCategory: subCategory,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HomeAllDataStruct? updateHomeAllDataStruct(
  HomeAllDataStruct? homeAllData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    homeAllData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHomeAllDataStructData(
  Map<String, dynamic> firestoreData,
  HomeAllDataStruct? homeAllData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (homeAllData == null) {
    return;
  }
  if (homeAllData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && homeAllData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final homeAllDataData =
      getHomeAllDataFirestoreData(homeAllData, forFieldValue);
  final nestedData =
      homeAllDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = homeAllData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHomeAllDataFirestoreData(
  HomeAllDataStruct? homeAllData, [
  bool forFieldValue = false,
]) {
  if (homeAllData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(homeAllData.toMap());

  // Add any Firestore field values
  homeAllData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHomeAllDataListFirestoreData(
  List<HomeAllDataStruct>? homeAllDatas,
) =>
    homeAllDatas?.map((e) => getHomeAllDataFirestoreData(e, true)).toList() ??
    [];
