import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WebsiteVideosRecord extends FirestoreRecord {
  WebsiteVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_sequence" field.
  double? _videoSequence;
  double get videoSequence => _videoSequence ?? 0.0;
  bool hasVideoSequence() => _videoSequence != null;

  // "website_category" field.
  String? _websiteCategory;
  String get websiteCategory => _websiteCategory ?? '';
  bool hasWebsiteCategory() => _websiteCategory != null;

  // "sub_category" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  bool hasSubCategory() => _subCategory != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "video_file_url" field.
  String? _videoFileUrl;
  String get videoFileUrl => _videoFileUrl ?? '';
  bool hasVideoFileUrl() => _videoFileUrl != null;

  // "video_thumbnail_image_url" field.
  String? _videoThumbnailImageUrl;
  String get videoThumbnailImageUrl => _videoThumbnailImageUrl ?? '';
  bool hasVideoThumbnailImageUrl() => _videoThumbnailImageUrl != null;

  // "recommended_videos_homepage" field.
  bool? _recommendedVideosHomepage;
  bool get recommendedVideosHomepage => _recommendedVideosHomepage ?? false;
  bool hasRecommendedVideosHomepage() => _recommendedVideosHomepage != null;

  // "is_display" field.
  bool? _isDisplay;
  bool get isDisplay => _isDisplay ?? false;
  bool hasIsDisplay() => _isDisplay != null;

  void _initializeFields() {
    _videoSequence = castToType<double>(snapshotData['video_sequence']);
    _websiteCategory = snapshotData['website_category'] as String?;
    _subCategory = snapshotData['sub_category'] as String?;
    _topic = snapshotData['topic'] as String?;
    _videoFileUrl = snapshotData['video_file_url'] as String?;
    _videoThumbnailImageUrl =
        snapshotData['video_thumbnail_image_url'] as String?;
    _recommendedVideosHomepage =
        snapshotData['recommended_videos_homepage'] as bool?;
    _isDisplay = snapshotData['is_display'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WebsiteVideos');

  static Stream<WebsiteVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WebsiteVideosRecord.fromSnapshot(s));

  static Future<WebsiteVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WebsiteVideosRecord.fromSnapshot(s));

  static WebsiteVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WebsiteVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WebsiteVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WebsiteVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WebsiteVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WebsiteVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWebsiteVideosRecordData({
  double? videoSequence,
  String? websiteCategory,
  String? subCategory,
  String? topic,
  String? videoFileUrl,
  String? videoThumbnailImageUrl,
  bool? recommendedVideosHomepage,
  bool? isDisplay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_sequence': videoSequence,
      'website_category': websiteCategory,
      'sub_category': subCategory,
      'topic': topic,
      'video_file_url': videoFileUrl,
      'video_thumbnail_image_url': videoThumbnailImageUrl,
      'recommended_videos_homepage': recommendedVideosHomepage,
      'is_display': isDisplay,
    }.withoutNulls,
  );

  return firestoreData;
}

class WebsiteVideosRecordDocumentEquality
    implements Equality<WebsiteVideosRecord> {
  const WebsiteVideosRecordDocumentEquality();

  @override
  bool equals(WebsiteVideosRecord? e1, WebsiteVideosRecord? e2) {
    return e1?.videoSequence == e2?.videoSequence &&
        e1?.websiteCategory == e2?.websiteCategory &&
        e1?.subCategory == e2?.subCategory &&
        e1?.topic == e2?.topic &&
        e1?.videoFileUrl == e2?.videoFileUrl &&
        e1?.videoThumbnailImageUrl == e2?.videoThumbnailImageUrl &&
        e1?.recommendedVideosHomepage == e2?.recommendedVideosHomepage &&
        e1?.isDisplay == e2?.isDisplay;
  }

  @override
  int hash(WebsiteVideosRecord? e) => const ListEquality().hash([
        e?.videoSequence,
        e?.websiteCategory,
        e?.subCategory,
        e?.topic,
        e?.videoFileUrl,
        e?.videoThumbnailImageUrl,
        e?.recommendedVideosHomepage,
        e?.isDisplay
      ]);

  @override
  bool isValidKey(Object? o) => o is WebsiteVideosRecord;
}
