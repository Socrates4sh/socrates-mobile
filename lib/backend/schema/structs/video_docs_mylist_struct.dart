// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VideoDocsMylistStruct extends FFFirebaseStruct {
  VideoDocsMylistStruct({
    int? listSeq,
    DocumentReference? videoDocId,
    String? topic,
    String? subCategory,
    String? websiteCategory,
    String? videoThumbnailImageUrl,
    String? videoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _listSeq = listSeq,
        _videoDocId = videoDocId,
        _topic = topic,
        _subCategory = subCategory,
        _websiteCategory = websiteCategory,
        _videoThumbnailImageUrl = videoThumbnailImageUrl,
        _videoUrl = videoUrl,
        super(firestoreUtilData);

  // "list_seq" field.
  int? _listSeq;
  int get listSeq => _listSeq ?? 0;
  set listSeq(int? val) => _listSeq = val;

  void incrementListSeq(int amount) => listSeq = listSeq + amount;

  bool hasListSeq() => _listSeq != null;

  // "video_doc_id" field.
  DocumentReference? _videoDocId;
  DocumentReference? get videoDocId => _videoDocId;
  set videoDocId(DocumentReference? val) => _videoDocId = val;

  bool hasVideoDocId() => _videoDocId != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  set topic(String? val) => _topic = val;

  bool hasTopic() => _topic != null;

  // "subCategory" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  set subCategory(String? val) => _subCategory = val;

  bool hasSubCategory() => _subCategory != null;

  // "websiteCategory" field.
  String? _websiteCategory;
  String get websiteCategory => _websiteCategory ?? '';
  set websiteCategory(String? val) => _websiteCategory = val;

  bool hasWebsiteCategory() => _websiteCategory != null;

  // "video_thumbnail_image_url" field.
  String? _videoThumbnailImageUrl;
  String get videoThumbnailImageUrl => _videoThumbnailImageUrl ?? '';
  set videoThumbnailImageUrl(String? val) => _videoThumbnailImageUrl = val;

  bool hasVideoThumbnailImageUrl() => _videoThumbnailImageUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  static VideoDocsMylistStruct fromMap(Map<String, dynamic> data) =>
      VideoDocsMylistStruct(
        listSeq: castToType<int>(data['list_seq']),
        videoDocId: data['video_doc_id'] as DocumentReference?,
        topic: data['topic'] as String?,
        subCategory: data['subCategory'] as String?,
        websiteCategory: data['websiteCategory'] as String?,
        videoThumbnailImageUrl: data['video_thumbnail_image_url'] as String?,
        videoUrl: data['video_url'] as String?,
      );

  static VideoDocsMylistStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoDocsMylistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'list_seq': _listSeq,
        'video_doc_id': _videoDocId,
        'topic': _topic,
        'subCategory': _subCategory,
        'websiteCategory': _websiteCategory,
        'video_thumbnail_image_url': _videoThumbnailImageUrl,
        'video_url': _videoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'list_seq': serializeParam(
          _listSeq,
          ParamType.int,
        ),
        'video_doc_id': serializeParam(
          _videoDocId,
          ParamType.DocumentReference,
        ),
        'topic': serializeParam(
          _topic,
          ParamType.String,
        ),
        'subCategory': serializeParam(
          _subCategory,
          ParamType.String,
        ),
        'websiteCategory': serializeParam(
          _websiteCategory,
          ParamType.String,
        ),
        'video_thumbnail_image_url': serializeParam(
          _videoThumbnailImageUrl,
          ParamType.String,
        ),
        'video_url': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoDocsMylistStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoDocsMylistStruct(
        listSeq: deserializeParam(
          data['list_seq'],
          ParamType.int,
          false,
        ),
        videoDocId: deserializeParam(
          data['video_doc_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['WebsiteVideos'],
        ),
        topic: deserializeParam(
          data['topic'],
          ParamType.String,
          false,
        ),
        subCategory: deserializeParam(
          data['subCategory'],
          ParamType.String,
          false,
        ),
        websiteCategory: deserializeParam(
          data['websiteCategory'],
          ParamType.String,
          false,
        ),
        videoThumbnailImageUrl: deserializeParam(
          data['video_thumbnail_image_url'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['video_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoDocsMylistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoDocsMylistStruct &&
        listSeq == other.listSeq &&
        videoDocId == other.videoDocId &&
        topic == other.topic &&
        subCategory == other.subCategory &&
        websiteCategory == other.websiteCategory &&
        videoThumbnailImageUrl == other.videoThumbnailImageUrl &&
        videoUrl == other.videoUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        listSeq,
        videoDocId,
        topic,
        subCategory,
        websiteCategory,
        videoThumbnailImageUrl,
        videoUrl
      ]);
}

VideoDocsMylistStruct createVideoDocsMylistStruct({
  int? listSeq,
  DocumentReference? videoDocId,
  String? topic,
  String? subCategory,
  String? websiteCategory,
  String? videoThumbnailImageUrl,
  String? videoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoDocsMylistStruct(
      listSeq: listSeq,
      videoDocId: videoDocId,
      topic: topic,
      subCategory: subCategory,
      websiteCategory: websiteCategory,
      videoThumbnailImageUrl: videoThumbnailImageUrl,
      videoUrl: videoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoDocsMylistStruct? updateVideoDocsMylistStruct(
  VideoDocsMylistStruct? videoDocsMylist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videoDocsMylist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoDocsMylistStructData(
  Map<String, dynamic> firestoreData,
  VideoDocsMylistStruct? videoDocsMylist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videoDocsMylist == null) {
    return;
  }
  if (videoDocsMylist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videoDocsMylist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoDocsMylistData =
      getVideoDocsMylistFirestoreData(videoDocsMylist, forFieldValue);
  final nestedData =
      videoDocsMylistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = videoDocsMylist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoDocsMylistFirestoreData(
  VideoDocsMylistStruct? videoDocsMylist, [
  bool forFieldValue = false,
]) {
  if (videoDocsMylist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videoDocsMylist.toMap());

  // Add any Firestore field values
  videoDocsMylist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoDocsMylistListFirestoreData(
  List<VideoDocsMylistStruct>? videoDocsMylists,
) =>
    videoDocsMylists
        ?.map((e) => getVideoDocsMylistFirestoreData(e, true))
        .toList() ??
    [];
