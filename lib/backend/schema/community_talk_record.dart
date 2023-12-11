import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommunityTalkRecord extends FirestoreRecord {
  CommunityTalkRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "like" field.
  int? _like;
  int get like => _like ?? 0;
  bool hasLike() => _like != null;

  // "likedUsers" field.
  List<DocumentReference>? _likedUsers;
  List<DocumentReference> get likedUsers => _likedUsers ?? const [];
  bool hasLikedUsers() => _likedUsers != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "uploadTime" field.
  DateTime? _uploadTime;
  DateTime? get uploadTime => _uploadTime;
  bool hasUploadTime() => _uploadTime != null;

  // "address" field.
  LatLng? _address;
  LatLng? get address => _address;
  bool hasAddress() => _address != null;

  // "uploadImage" field.
  String? _uploadImage;
  String get uploadImage => _uploadImage ?? '';
  bool hasUploadImage() => _uploadImage != null;

  // "uploadUser" field.
  DocumentReference? _uploadUser;
  DocumentReference? get uploadUser => _uploadUser;
  bool hasUploadUser() => _uploadUser != null;

  // "commentCount" field.
  List<DocumentReference>? _commentCount;
  List<DocumentReference> get commentCount => _commentCount ?? const [];
  bool hasCommentCount() => _commentCount != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _content = snapshotData['content'] as String?;
    _like = castToType<int>(snapshotData['like']);
    _likedUsers = getDataList(snapshotData['likedUsers']);
    _title = snapshotData['title'] as String?;
    _uploadTime = snapshotData['uploadTime'] as DateTime?;
    _address = snapshotData['address'] as LatLng?;
    _uploadImage = snapshotData['uploadImage'] as String?;
    _uploadUser = snapshotData['uploadUser'] as DocumentReference?;
    _commentCount = getDataList(snapshotData['commentCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communityTalk');

  static Stream<CommunityTalkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityTalkRecord.fromSnapshot(s));

  static Future<CommunityTalkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityTalkRecord.fromSnapshot(s));

  static CommunityTalkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityTalkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityTalkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityTalkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityTalkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityTalkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityTalkRecordData({
  String? category,
  String? content,
  int? like,
  String? title,
  DateTime? uploadTime,
  LatLng? address,
  String? uploadImage,
  DocumentReference? uploadUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'content': content,
      'like': like,
      'title': title,
      'uploadTime': uploadTime,
      'address': address,
      'uploadImage': uploadImage,
      'uploadUser': uploadUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityTalkRecordDocumentEquality
    implements Equality<CommunityTalkRecord> {
  const CommunityTalkRecordDocumentEquality();

  @override
  bool equals(CommunityTalkRecord? e1, CommunityTalkRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        e1?.content == e2?.content &&
        e1?.like == e2?.like &&
        listEquality.equals(e1?.likedUsers, e2?.likedUsers) &&
        e1?.title == e2?.title &&
        e1?.uploadTime == e2?.uploadTime &&
        e1?.address == e2?.address &&
        e1?.uploadImage == e2?.uploadImage &&
        e1?.uploadUser == e2?.uploadUser &&
        listEquality.equals(e1?.commentCount, e2?.commentCount);
  }

  @override
  int hash(CommunityTalkRecord? e) => const ListEquality().hash([
        e?.category,
        e?.content,
        e?.like,
        e?.likedUsers,
        e?.title,
        e?.uploadTime,
        e?.address,
        e?.uploadImage,
        e?.uploadUser,
        e?.commentCount
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityTalkRecord;
}
