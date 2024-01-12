import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvertisementsRecord extends FirestoreRecord {
  AdvertisementsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uploadStore" field.
  DocumentReference? _uploadStore;
  DocumentReference? get uploadStore => _uploadStore;
  bool hasUploadStore() => _uploadStore != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "uploadDate" field.
  DateTime? _uploadDate;
  DateTime? get uploadDate => _uploadDate;
  bool hasUploadDate() => _uploadDate != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "howFar" field.
  String? _howFar;
  String get howFar => _howFar ?? '';
  bool hasHowFar() => _howFar != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "phoneNum" field.
  int? _phoneNum;
  int get phoneNum => _phoneNum ?? 0;
  bool hasPhoneNum() => _phoneNum != null;

  // "newsTitle" field.
  String? _newsTitle;
  String get newsTitle => _newsTitle ?? '';
  bool hasNewsTitle() => _newsTitle != null;

  // "newsContent" field.
  String? _newsContent;
  String get newsContent => _newsContent ?? '';
  bool hasNewsContent() => _newsContent != null;

  // "newsImage" field.
  List<String>? _newsImage;
  List<String> get newsImage => _newsImage ?? const [];
  bool hasNewsImage() => _newsImage != null;

  // "newsTime" field.
  DateTime? _newsTime;
  DateTime? get newsTime => _newsTime;
  bool hasNewsTime() => _newsTime != null;

  void _initializeFields() {
    _uploadStore = snapshotData['uploadStore'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _uploadDate = snapshotData['uploadDate'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _howFar = snapshotData['howFar'] as String?;
    _reviews = getDataList(snapshotData['reviews']);
    _address = snapshotData['address'] as String?;
    _images = getDataList(snapshotData['images']);
    _phoneNum = castToType<int>(snapshotData['phoneNum']);
    _newsTitle = snapshotData['newsTitle'] as String?;
    _newsContent = snapshotData['newsContent'] as String?;
    _newsImage = getDataList(snapshotData['newsImage']);
    _newsTime = snapshotData['newsTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advertisements');

  static Stream<AdvertisementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvertisementsRecord.fromSnapshot(s));

  static Future<AdvertisementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvertisementsRecord.fromSnapshot(s));

  static AdvertisementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdvertisementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvertisementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvertisementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvertisementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvertisementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvertisementsRecordData({
  DocumentReference? uploadStore,
  String? title,
  String? content,
  DateTime? uploadDate,
  String? howFar,
  String? address,
  int? phoneNum,
  String? newsTitle,
  String? newsContent,
  DateTime? newsTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uploadStore': uploadStore,
      'title': title,
      'content': content,
      'uploadDate': uploadDate,
      'howFar': howFar,
      'address': address,
      'phoneNum': phoneNum,
      'newsTitle': newsTitle,
      'newsContent': newsContent,
      'newsTime': newsTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvertisementsRecordDocumentEquality
    implements Equality<AdvertisementsRecord> {
  const AdvertisementsRecordDocumentEquality();

  @override
  bool equals(AdvertisementsRecord? e1, AdvertisementsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uploadStore == e2?.uploadStore &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.uploadDate == e2?.uploadDate &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.howFar == e2?.howFar &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.phoneNum == e2?.phoneNum &&
        e1?.newsTitle == e2?.newsTitle &&
        e1?.newsContent == e2?.newsContent &&
        listEquality.equals(e1?.newsImage, e2?.newsImage) &&
        e1?.newsTime == e2?.newsTime;
  }

  @override
  int hash(AdvertisementsRecord? e) => const ListEquality().hash([
        e?.uploadStore,
        e?.title,
        e?.content,
        e?.uploadDate,
        e?.likes,
        e?.howFar,
        e?.reviews,
        e?.address,
        e?.images,
        e?.phoneNum,
        e?.newsTitle,
        e?.newsContent,
        e?.newsImage,
        e?.newsTime
      ]);

  @override
  bool isValidKey(Object? o) => o is AdvertisementsRecord;
}
