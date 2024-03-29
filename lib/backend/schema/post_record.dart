import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "contents" field.
  String? _contents;
  String get contents => _contents ?? '';
  bool hasContents() => _contents != null;

  // "uploadTime" field.
  DateTime? _uploadTime;
  DateTime? get uploadTime => _uploadTime;
  bool hasUploadTime() => _uploadTime != null;

  // "uploadUser" field.
  DocumentReference? _uploadUser;
  DocumentReference? get uploadUser => _uploadUser;
  bool hasUploadUser() => _uploadUser != null;

  // "like" field.
  int? _like;
  int get like => _like ?? 0;
  bool hasLike() => _like != null;

  // "likeUsers" field.
  List<DocumentReference>? _likeUsers;
  List<DocumentReference> get likeUsers => _likeUsers ?? const [];
  bool hasLikeUsers() => _likeUsers != null;

  // "commentCount" field.
  List<DocumentReference>? _commentCount;
  List<DocumentReference> get commentCount => _commentCount ?? const [];
  bool hasCommentCount() => _commentCount != null;

  // "uploadedImages" field.
  List<String>? _uploadedImages;
  List<String> get uploadedImages => _uploadedImages ?? const [];
  bool hasUploadedImages() => _uploadedImages != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "forSale" field.
  bool? _forSale;
  bool get forSale => _forSale ?? false;
  bool hasForSale() => _forSale != null;

  // "negoitable" field.
  bool? _negoitable;
  bool get negoitable => _negoitable ?? false;
  bool hasNegoitable() => _negoitable != null;

  // "meetLocation" field.
  LatLng? _meetLocation;
  LatLng? get meetLocation => _meetLocation;
  bool hasMeetLocation() => _meetLocation != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _title = snapshotData['title'] as String?;
    _contents = snapshotData['contents'] as String?;
    _uploadTime = snapshotData['uploadTime'] as DateTime?;
    _uploadUser = snapshotData['uploadUser'] as DocumentReference?;
    _like = castToType<int>(snapshotData['like']);
    _likeUsers = getDataList(snapshotData['likeUsers']);
    _commentCount = getDataList(snapshotData['commentCount']);
    _uploadedImages = getDataList(snapshotData['uploadedImages']);
    _price = castToType<int>(snapshotData['price']);
    _location = snapshotData['location'] as String?;
    _forSale = snapshotData['forSale'] as bool?;
    _negoitable = snapshotData['negoitable'] as bool?;
    _meetLocation = snapshotData['meetLocation'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? category,
  String? title,
  String? contents,
  DateTime? uploadTime,
  DocumentReference? uploadUser,
  int? like,
  int? price,
  String? location,
  bool? forSale,
  bool? negoitable,
  LatLng? meetLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'title': title,
      'contents': contents,
      'uploadTime': uploadTime,
      'uploadUser': uploadUser,
      'like': like,
      'price': price,
      'location': location,
      'forSale': forSale,
      'negoitable': negoitable,
      'meetLocation': meetLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        e1?.title == e2?.title &&
        e1?.contents == e2?.contents &&
        e1?.uploadTime == e2?.uploadTime &&
        e1?.uploadUser == e2?.uploadUser &&
        e1?.like == e2?.like &&
        listEquality.equals(e1?.likeUsers, e2?.likeUsers) &&
        listEquality.equals(e1?.commentCount, e2?.commentCount) &&
        listEquality.equals(e1?.uploadedImages, e2?.uploadedImages) &&
        e1?.price == e2?.price &&
        e1?.location == e2?.location &&
        e1?.forSale == e2?.forSale &&
        e1?.negoitable == e2?.negoitable &&
        e1?.meetLocation == e2?.meetLocation;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.category,
        e?.title,
        e?.contents,
        e?.uploadTime,
        e?.uploadUser,
        e?.like,
        e?.likeUsers,
        e?.commentCount,
        e?.uploadedImages,
        e?.price,
        e?.location,
        e?.forSale,
        e?.negoitable,
        e?.meetLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
