import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ApplicationCampaignRecord extends FirestoreRecord {
  ApplicationCampaignRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "campaignref" field.
  DocumentReference? _campaignref;
  DocumentReference? get campaignref => _campaignref;
  bool hasCampaignref() => _campaignref != null;

  // "Userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  bool hasChannel() => _channel != null;

  // "ChannelID" field.
  String? _channelID;
  String get channelID => _channelID ?? '';
  bool hasChannelID() => _channelID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "birth" field.
  DateTime? _birth;
  DateTime? get birth => _birth;
  bool hasBirth() => _birth != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "call" field.
  String? _call;
  String get call => _call ?? '';
  bool hasCall() => _call != null;

  // "camera" field.
  String? _camera;
  String get camera => _camera ?? '';
  bool hasCamera() => _camera != null;

  // "jointOperation" field.
  String? _jointOperation;
  String get jointOperation => _jointOperation ?? '';
  bool hasJointOperation() => _jointOperation != null;

  // "reserve" field.
  DateTime? _reserve;
  DateTime? get reserve => _reserve;
  bool hasReserve() => _reserve != null;

  // "etc" field.
  String? _etc;
  String get etc => _etc ?? '';
  bool hasEtc() => _etc != null;

  // "sign" field.
  String? _sign;
  String get sign => _sign ?? '';
  bool hasSign() => _sign != null;

  // "agree" field.
  bool? _agree;
  bool get agree => _agree ?? false;
  bool hasAgree() => _agree != null;

  void _initializeFields() {
    _campaignref = snapshotData['campaignref'] as DocumentReference?;
    _userref = snapshotData['Userref'] as DocumentReference?;
    _channel = snapshotData['channel'] as String?;
    _channelID = snapshotData['ChannelID'] as String?;
    _name = snapshotData['name'] as String?;
    _birth = snapshotData['birth'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _call = snapshotData['call'] as String?;
    _camera = snapshotData['camera'] as String?;
    _jointOperation = snapshotData['jointOperation'] as String?;
    _reserve = snapshotData['reserve'] as DateTime?;
    _etc = snapshotData['etc'] as String?;
    _sign = snapshotData['sign'] as String?;
    _agree = snapshotData['agree'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('applicationCampaign');

  static Stream<ApplicationCampaignRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApplicationCampaignRecord.fromSnapshot(s));

  static Future<ApplicationCampaignRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ApplicationCampaignRecord.fromSnapshot(s));

  static ApplicationCampaignRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApplicationCampaignRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApplicationCampaignRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApplicationCampaignRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApplicationCampaignRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApplicationCampaignRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApplicationCampaignRecordData({
  DocumentReference? campaignref,
  DocumentReference? userref,
  String? channel,
  String? channelID,
  String? name,
  DateTime? birth,
  String? gender,
  String? call,
  String? camera,
  String? jointOperation,
  DateTime? reserve,
  String? etc,
  String? sign,
  bool? agree,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'campaignref': campaignref,
      'Userref': userref,
      'channel': channel,
      'ChannelID': channelID,
      'name': name,
      'birth': birth,
      'gender': gender,
      'call': call,
      'camera': camera,
      'jointOperation': jointOperation,
      'reserve': reserve,
      'etc': etc,
      'sign': sign,
      'agree': agree,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApplicationCampaignRecordDocumentEquality
    implements Equality<ApplicationCampaignRecord> {
  const ApplicationCampaignRecordDocumentEquality();

  @override
  bool equals(ApplicationCampaignRecord? e1, ApplicationCampaignRecord? e2) {
    return e1?.campaignref == e2?.campaignref &&
        e1?.userref == e2?.userref &&
        e1?.channel == e2?.channel &&
        e1?.channelID == e2?.channelID &&
        e1?.name == e2?.name &&
        e1?.birth == e2?.birth &&
        e1?.gender == e2?.gender &&
        e1?.call == e2?.call &&
        e1?.camera == e2?.camera &&
        e1?.jointOperation == e2?.jointOperation &&
        e1?.reserve == e2?.reserve &&
        e1?.etc == e2?.etc &&
        e1?.sign == e2?.sign &&
        e1?.agree == e2?.agree;
  }

  @override
  int hash(ApplicationCampaignRecord? e) => const ListEquality().hash([
        e?.campaignref,
        e?.userref,
        e?.channel,
        e?.channelID,
        e?.name,
        e?.birth,
        e?.gender,
        e?.call,
        e?.camera,
        e?.jointOperation,
        e?.reserve,
        e?.etc,
        e?.sign,
        e?.agree
      ]);

  @override
  bool isValidKey(Object? o) => o is ApplicationCampaignRecord;
}
