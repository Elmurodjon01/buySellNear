import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Join_campain" field.
  List<DocumentReference>? _joinCampain;
  List<DocumentReference> get joinCampain => _joinCampain ?? const [];
  bool hasJoinCampain() => _joinCampain != null;

  // "like_campain" field.
  List<DocumentReference>? _likeCampain;
  List<DocumentReference> get likeCampain => _likeCampain ?? const [];
  bool hasLikeCampain() => _likeCampain != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "studyRef" field.
  List<EndData2Struct>? _studyRef;
  List<EndData2Struct> get studyRef => _studyRef ?? const [];
  bool hasStudyRef() => _studyRef != null;

  // "userInfo" field.
  ListeningJourneyStruct? _userInfo;
  ListeningJourneyStruct get userInfo => _userInfo ?? ListeningJourneyStruct();
  bool hasUserInfo() => _userInfo != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _joinCampain = getDataList(snapshotData['Join_campain']);
    _likeCampain = getDataList(snapshotData['like_campain']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _studyRef = getStructList(
      snapshotData['studyRef'],
      EndData2Struct.fromMap,
    );
    _userInfo = ListeningJourneyStruct.maybeFromMap(snapshotData['userInfo']);
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  String? phoneNumber,
  DateTime? createdTime,
  ListeningJourneyStruct? userInfo,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'userInfo': ListeningJourneyStruct().toMap(),
      'location': location,
    }.withoutNulls,
  );

  // Handle nested data for "userInfo" field.
  addListeningJourneyStructData(firestoreData, userInfo, 'userInfo');

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.joinCampain, e2?.joinCampain) &&
        listEquality.equals(e1?.likeCampain, e2?.likeCampain) &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.studyRef, e2?.studyRef) &&
        e1?.userInfo == e2?.userInfo &&
        e1?.location == e2?.location;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.phoneNumber,
        e?.joinCampain,
        e?.likeCampain,
        e?.createdTime,
        e?.studyRef,
        e?.userInfo,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
