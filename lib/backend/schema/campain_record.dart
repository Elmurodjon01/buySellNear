import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CampainRecord extends FirestoreRecord {
  CampainRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "UploadUser" field.
  DocumentReference? _uploadUser;
  DocumentReference? get uploadUser => _uploadUser;
  bool hasUploadUser() => _uploadUser != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "contents_type" field.
  String? _contentsType;
  String get contentsType => _contentsType ?? '';
  bool hasContentsType() => _contentsType != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "recruit" field.
  int? _recruit;
  int get recruit => _recruit ?? 0;
  bool hasRecruit() => _recruit != null;

  // "applicationUser" field.
  List<DocumentReference>? _applicationUser;
  List<DocumentReference> get applicationUser => _applicationUser ?? const [];
  bool hasApplicationUser() => _applicationUser != null;

  // "SupportTitle" field.
  String? _supportTitle;
  String get supportTitle => _supportTitle ?? '';
  bool hasSupportTitle() => _supportTitle != null;

  // "SupportDetail" field.
  String? _supportDetail;
  String get supportDetail => _supportDetail ?? '';
  bool hasSupportDetail() => _supportDetail != null;

  // "Datail_image" field.
  String? _datailImage;
  String get datailImage => _datailImage ?? '';
  bool hasDatailImage() => _datailImage != null;

  // "missionCategory" field.
  List<String>? _missionCategory;
  List<String> get missionCategory => _missionCategory ?? const [];
  bool hasMissionCategory() => _missionCategory != null;

  // "missionDetail" field.
  String? _missionDetail;
  String get missionDetail => _missionDetail ?? '';
  bool hasMissionDetail() => _missionDetail != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "etc" field.
  String? _etc;
  String get etc => _etc ?? '';
  bool hasEtc() => _etc != null;

  // "likeUser" field.
  List<DocumentReference>? _likeUser;
  List<DocumentReference> get likeUser => _likeUser ?? const [];
  bool hasLikeUser() => _likeUser != null;

  // "ChannelType" field.
  String? _channelType;
  String get channelType => _channelType ?? '';
  bool hasChannelType() => _channelType != null;

  // "UploadDate2" field.
  DateTime? _uploadDate2;
  DateTime? get uploadDate2 => _uploadDate2;
  bool hasUploadDate2() => _uploadDate2 != null;

  // "appli_start2" field.
  DateTime? _appliStart2;
  DateTime? get appliStart2 => _appliStart2;
  bool hasAppliStart2() => _appliStart2 != null;

  // "appli_end2" field.
  DateTime? _appliEnd2;
  DateTime? get appliEnd2 => _appliEnd2;
  bool hasAppliEnd2() => _appliEnd2 != null;

  // "announce2" field.
  DateTime? _announce2;
  DateTime? get announce2 => _announce2;
  bool hasAnnounce2() => _announce2 != null;

  // "snsUploadStart2" field.
  DateTime? _snsUploadStart2;
  DateTime? get snsUploadStart2 => _snsUploadStart2;
  bool hasSnsUploadStart2() => _snsUploadStart2 != null;

  // "snsUploadEnd2" field.
  DateTime? _snsUploadEnd2;
  DateTime? get snsUploadEnd2 => _snsUploadEnd2;
  bool hasSnsUploadEnd2() => _snsUploadEnd2 != null;

  // "Result_announce2" field.
  DateTime? _resultAnnounce2;
  DateTime? get resultAnnounce2 => _resultAnnounce2;
  bool hasResultAnnounce2() => _resultAnnounce2 != null;

  // "text_limit" field.
  int? _textLimit;
  int get textLimit => _textLimit ?? 0;
  bool hasTextLimit() => _textLimit != null;

  // "image_limit" field.
  int? _imageLimit;
  int get imageLimit => _imageLimit ?? 0;
  bool hasImageLimit() => _imageLimit != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _uploadUser = snapshotData['UploadUser'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _contentsType = snapshotData['contents_type'] as String?;
    _category = snapshotData['category'] as String?;
    _recruit = castToType<int>(snapshotData['recruit']);
    _applicationUser = getDataList(snapshotData['applicationUser']);
    _supportTitle = snapshotData['SupportTitle'] as String?;
    _supportDetail = snapshotData['SupportDetail'] as String?;
    _datailImage = snapshotData['Datail_image'] as String?;
    _missionCategory = getDataList(snapshotData['missionCategory']);
    _missionDetail = snapshotData['missionDetail'] as String?;
    _tag = snapshotData['tag'] as String?;
    _etc = snapshotData['etc'] as String?;
    _likeUser = getDataList(snapshotData['likeUser']);
    _channelType = snapshotData['ChannelType'] as String?;
    _uploadDate2 = snapshotData['UploadDate2'] as DateTime?;
    _appliStart2 = snapshotData['appli_start2'] as DateTime?;
    _appliEnd2 = snapshotData['appli_end2'] as DateTime?;
    _announce2 = snapshotData['announce2'] as DateTime?;
    _snsUploadStart2 = snapshotData['snsUploadStart2'] as DateTime?;
    _snsUploadEnd2 = snapshotData['snsUploadEnd2'] as DateTime?;
    _resultAnnounce2 = snapshotData['Result_announce2'] as DateTime?;
    _textLimit = castToType<int>(snapshotData['text_limit']);
    _imageLimit = castToType<int>(snapshotData['image_limit']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('campain');

  static Stream<CampainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampainRecord.fromSnapshot(s));

  static Future<CampainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampainRecord.fromSnapshot(s));

  static CampainRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampainRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampainRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampainRecordData({
  String? image,
  DocumentReference? uploadUser,
  String? title,
  String? contentsType,
  String? category,
  int? recruit,
  String? supportTitle,
  String? supportDetail,
  String? datailImage,
  String? missionDetail,
  String? tag,
  String? etc,
  String? channelType,
  DateTime? uploadDate2,
  DateTime? appliStart2,
  DateTime? appliEnd2,
  DateTime? announce2,
  DateTime? snsUploadStart2,
  DateTime? snsUploadEnd2,
  DateTime? resultAnnounce2,
  int? textLimit,
  int? imageLimit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'UploadUser': uploadUser,
      'title': title,
      'contents_type': contentsType,
      'category': category,
      'recruit': recruit,
      'SupportTitle': supportTitle,
      'SupportDetail': supportDetail,
      'Datail_image': datailImage,
      'missionDetail': missionDetail,
      'tag': tag,
      'etc': etc,
      'ChannelType': channelType,
      'UploadDate2': uploadDate2,
      'appli_start2': appliStart2,
      'appli_end2': appliEnd2,
      'announce2': announce2,
      'snsUploadStart2': snsUploadStart2,
      'snsUploadEnd2': snsUploadEnd2,
      'Result_announce2': resultAnnounce2,
      'text_limit': textLimit,
      'image_limit': imageLimit,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampainRecordDocumentEquality implements Equality<CampainRecord> {
  const CampainRecordDocumentEquality();

  @override
  bool equals(CampainRecord? e1, CampainRecord? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.uploadUser == e2?.uploadUser &&
        e1?.title == e2?.title &&
        e1?.contentsType == e2?.contentsType &&
        e1?.category == e2?.category &&
        e1?.recruit == e2?.recruit &&
        listEquality.equals(e1?.applicationUser, e2?.applicationUser) &&
        e1?.supportTitle == e2?.supportTitle &&
        e1?.supportDetail == e2?.supportDetail &&
        e1?.datailImage == e2?.datailImage &&
        listEquality.equals(e1?.missionCategory, e2?.missionCategory) &&
        e1?.missionDetail == e2?.missionDetail &&
        e1?.tag == e2?.tag &&
        e1?.etc == e2?.etc &&
        listEquality.equals(e1?.likeUser, e2?.likeUser) &&
        e1?.channelType == e2?.channelType &&
        e1?.uploadDate2 == e2?.uploadDate2 &&
        e1?.appliStart2 == e2?.appliStart2 &&
        e1?.appliEnd2 == e2?.appliEnd2 &&
        e1?.announce2 == e2?.announce2 &&
        e1?.snsUploadStart2 == e2?.snsUploadStart2 &&
        e1?.snsUploadEnd2 == e2?.snsUploadEnd2 &&
        e1?.resultAnnounce2 == e2?.resultAnnounce2 &&
        e1?.textLimit == e2?.textLimit &&
        e1?.imageLimit == e2?.imageLimit;
  }

  @override
  int hash(CampainRecord? e) => const ListEquality().hash([
        e?.image,
        e?.uploadUser,
        e?.title,
        e?.contentsType,
        e?.category,
        e?.recruit,
        e?.applicationUser,
        e?.supportTitle,
        e?.supportDetail,
        e?.datailImage,
        e?.missionCategory,
        e?.missionDetail,
        e?.tag,
        e?.etc,
        e?.likeUser,
        e?.channelType,
        e?.uploadDate2,
        e?.appliStart2,
        e?.appliEnd2,
        e?.announce2,
        e?.snsUploadStart2,
        e?.snsUploadEnd2,
        e?.resultAnnounce2,
        e?.textLimit,
        e?.imageLimit
      ]);

  @override
  bool isValidKey(Object? o) => o is CampainRecord;
}
