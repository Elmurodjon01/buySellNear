import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserCredentialsRecord extends FirestoreRecord {
  UserCredentialsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "locations" field.
  List<LatLng>? _locations;
  List<LatLng> get locations => _locations ?? const [];
  bool hasLocations() => _locations != null;

  void _initializeFields() {
    _locations = getDataList(snapshotData['locations']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userCredentials');

  static Stream<UserCredentialsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCredentialsRecord.fromSnapshot(s));

  static Future<UserCredentialsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCredentialsRecord.fromSnapshot(s));

  static UserCredentialsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCredentialsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCredentialsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCredentialsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCredentialsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCredentialsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCredentialsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class UserCredentialsRecordDocumentEquality
    implements Equality<UserCredentialsRecord> {
  const UserCredentialsRecordDocumentEquality();

  @override
  bool equals(UserCredentialsRecord? e1, UserCredentialsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.locations, e2?.locations);
  }

  @override
  int hash(UserCredentialsRecord? e) =>
      const ListEquality().hash([e?.locations]);

  @override
  bool isValidKey(Object? o) => o is UserCredentialsRecord;
}
