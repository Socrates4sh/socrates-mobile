import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "terms_and_privacy_accepted" field.
  bool? _termsAndPrivacyAccepted;
  bool get termsAndPrivacyAccepted => _termsAndPrivacyAccepted ?? false;
  bool hasTermsAndPrivacyAccepted() => _termsAndPrivacyAccepted != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "newsletters" field.
  bool? _newsletters;
  bool get newsletters => _newsletters ?? false;
  bool hasNewsletters() => _newsletters != null;

  // "interests" field.
  String? _interests;
  String get interests => _interests ?? '';
  bool hasInterests() => _interests != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "onBoardingComplete" field.
  bool? _onBoardingComplete;
  bool get onBoardingComplete => _onBoardingComplete ?? false;
  bool hasOnBoardingComplete() => _onBoardingComplete != null;

  // "premiumSubscriber" field.
  bool? _premiumSubscriber;
  bool get premiumSubscriber => _premiumSubscriber ?? false;
  bool hasPremiumSubscriber() => _premiumSubscriber != null;

  // "paymentDetails" field.
  List<PaymentDetailsStruct>? _paymentDetails;
  List<PaymentDetailsStruct> get paymentDetails => _paymentDetails ?? const [];
  bool hasPaymentDetails() => _paymentDetails != null;

  // "profileType" field.
  String? _profileType;
  String get profileType => _profileType ?? '';
  bool hasProfileType() => _profileType != null;

  // "chapterPaymentList" field.
  List<ChapterPaymentDetailsStruct>? _chapterPaymentList;
  List<ChapterPaymentDetailsStruct> get chapterPaymentList =>
      _chapterPaymentList ?? const [];
  bool hasChapterPaymentList() => _chapterPaymentList != null;

  // "subscriptionPaymentList" field.
  List<SubscriptionPaymentStruct>? _subscriptionPaymentList;
  List<SubscriptionPaymentStruct> get subscriptionPaymentList =>
      _subscriptionPaymentList ?? const [];
  bool hasSubscriptionPaymentList() => _subscriptionPaymentList != null;

  // "subscribedEmail" field.
  String? _subscribedEmail;
  String get subscribedEmail => _subscribedEmail ?? '';
  bool hasSubscribedEmail() => _subscribedEmail != null;

  // "WACommunity" field.
  bool? _wACommunity;
  bool get wACommunity => _wACommunity ?? false;
  bool hasWACommunity() => _wACommunity != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "videos_mylist" field.
  List<VideoDocsMylistStruct>? _videosMylist;
  List<VideoDocsMylistStruct> get videosMylist => _videosMylist ?? const [];
  bool hasVideosMylist() => _videosMylist != null;

  // "customerId" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  bool hasCustomerId() => _customerId != null;

  // "subscriptionEndDateTime" field.
  DateTime? _subscriptionEndDateTime;
  DateTime? get subscriptionEndDateTime => _subscriptionEndDateTime;
  bool hasSubscriptionEndDateTime() => _subscriptionEndDateTime != null;

  // "subscriptionStartDateTime" field.
  DateTime? _subscriptionStartDateTime;
  DateTime? get subscriptionStartDateTime => _subscriptionStartDateTime;
  bool hasSubscriptionStartDateTime() => _subscriptionStartDateTime != null;

  // "subscriptionID" field.
  String? _subscriptionID;
  String get subscriptionID => _subscriptionID ?? '';
  bool hasSubscriptionID() => _subscriptionID != null;

  // "userSubscribed" field.
  bool? _userSubscribed;
  bool get userSubscribed => _userSubscribed ?? false;
  bool hasUserSubscribed() => _userSubscribed != null;

  // "subscriptionCancelled" field.
  bool? _subscriptionCancelled;
  bool get subscriptionCancelled => _subscriptionCancelled ?? false;
  bool hasSubscriptionCancelled() => _subscriptionCancelled != null;

  // "subscriptionDetails" field.
  List<SubscriptionStruct>? _subscriptionDetails;
  List<SubscriptionStruct> get subscriptionDetails =>
      _subscriptionDetails ?? const [];
  bool hasSubscriptionDetails() => _subscriptionDetails != null;

  // "subscriptionEndDate" field.
  DateTime? _subscriptionEndDate;
  DateTime? get subscriptionEndDate => _subscriptionEndDate;
  bool hasSubscriptionEndDate() => _subscriptionEndDate != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _termsAndPrivacyAccepted =
        snapshotData['terms_and_privacy_accepted'] as bool?;
    _email = snapshotData['email'] as String?;
    _newsletters = snapshotData['newsletters'] as bool?;
    _interests = snapshotData['interests'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _onBoardingComplete = snapshotData['onBoardingComplete'] as bool?;
    _premiumSubscriber = snapshotData['premiumSubscriber'] as bool?;
    _paymentDetails = getStructList(
      snapshotData['paymentDetails'],
      PaymentDetailsStruct.fromMap,
    );
    _profileType = snapshotData['profileType'] as String?;
    _chapterPaymentList = getStructList(
      snapshotData['chapterPaymentList'],
      ChapterPaymentDetailsStruct.fromMap,
    );
    _subscriptionPaymentList = getStructList(
      snapshotData['subscriptionPaymentList'],
      SubscriptionPaymentStruct.fromMap,
    );
    _subscribedEmail = snapshotData['subscribedEmail'] as String?;
    _wACommunity = snapshotData['WACommunity'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _videosMylist = getStructList(
      snapshotData['videos_mylist'],
      VideoDocsMylistStruct.fromMap,
    );
    _customerId = snapshotData['customerId'] as String?;
    _subscriptionEndDateTime =
        snapshotData['subscriptionEndDateTime'] as DateTime?;
    _subscriptionStartDateTime =
        snapshotData['subscriptionStartDateTime'] as DateTime?;
    _subscriptionID = snapshotData['subscriptionID'] as String?;
    _userSubscribed = snapshotData['userSubscribed'] as bool?;
    _subscriptionCancelled = snapshotData['subscriptionCancelled'] as bool?;
    _subscriptionDetails = getStructList(
      snapshotData['subscriptionDetails'],
      SubscriptionStruct.fromMap,
    );
    _subscriptionEndDate = snapshotData['subscriptionEndDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? termsAndPrivacyAccepted,
  String? email,
  bool? newsletters,
  String? interests,
  String? lastName,
  String? displayName,
  bool? onBoardingComplete,
  bool? premiumSubscriber,
  String? profileType,
  String? subscribedEmail,
  bool? wACommunity,
  String? photoUrl,
  String? customerId,
  DateTime? subscriptionEndDateTime,
  DateTime? subscriptionStartDateTime,
  String? subscriptionID,
  bool? userSubscribed,
  bool? subscriptionCancelled,
  DateTime? subscriptionEndDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'terms_and_privacy_accepted': termsAndPrivacyAccepted,
      'email': email,
      'newsletters': newsletters,
      'interests': interests,
      'last_name': lastName,
      'display_name': displayName,
      'onBoardingComplete': onBoardingComplete,
      'premiumSubscriber': premiumSubscriber,
      'profileType': profileType,
      'subscribedEmail': subscribedEmail,
      'WACommunity': wACommunity,
      'photo_url': photoUrl,
      'customerId': customerId,
      'subscriptionEndDateTime': subscriptionEndDateTime,
      'subscriptionStartDateTime': subscriptionStartDateTime,
      'subscriptionID': subscriptionID,
      'userSubscribed': userSubscribed,
      'subscriptionCancelled': subscriptionCancelled,
      'subscriptionEndDate': subscriptionEndDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.termsAndPrivacyAccepted == e2?.termsAndPrivacyAccepted &&
        e1?.email == e2?.email &&
        e1?.newsletters == e2?.newsletters &&
        e1?.interests == e2?.interests &&
        e1?.lastName == e2?.lastName &&
        e1?.displayName == e2?.displayName &&
        e1?.onBoardingComplete == e2?.onBoardingComplete &&
        e1?.premiumSubscriber == e2?.premiumSubscriber &&
        listEquality.equals(e1?.paymentDetails, e2?.paymentDetails) &&
        e1?.profileType == e2?.profileType &&
        listEquality.equals(e1?.chapterPaymentList, e2?.chapterPaymentList) &&
        listEquality.equals(
            e1?.subscriptionPaymentList, e2?.subscriptionPaymentList) &&
        e1?.subscribedEmail == e2?.subscribedEmail &&
        e1?.wACommunity == e2?.wACommunity &&
        e1?.photoUrl == e2?.photoUrl &&
        listEquality.equals(e1?.videosMylist, e2?.videosMylist) &&
        e1?.customerId == e2?.customerId &&
        e1?.subscriptionEndDateTime == e2?.subscriptionEndDateTime &&
        e1?.subscriptionStartDateTime == e2?.subscriptionStartDateTime &&
        e1?.subscriptionID == e2?.subscriptionID &&
        e1?.userSubscribed == e2?.userSubscribed &&
        e1?.subscriptionCancelled == e2?.subscriptionCancelled &&
        listEquality.equals(e1?.subscriptionDetails, e2?.subscriptionDetails) &&
        e1?.subscriptionEndDate == e2?.subscriptionEndDate;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.termsAndPrivacyAccepted,
        e?.email,
        e?.newsletters,
        e?.interests,
        e?.lastName,
        e?.displayName,
        e?.onBoardingComplete,
        e?.premiumSubscriber,
        e?.paymentDetails,
        e?.profileType,
        e?.chapterPaymentList,
        e?.subscriptionPaymentList,
        e?.subscribedEmail,
        e?.wACommunity,
        e?.photoUrl,
        e?.videosMylist,
        e?.customerId,
        e?.subscriptionEndDateTime,
        e?.subscriptionStartDateTime,
        e?.subscriptionID,
        e?.userSubscribed,
        e?.subscriptionCancelled,
        e?.subscriptionDetails,
        e?.subscriptionEndDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
