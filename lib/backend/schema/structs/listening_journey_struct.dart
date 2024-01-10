// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListeningJourneyStruct extends FFFirebaseStruct {
  ListeningJourneyStruct({
    DateTime? startTime,
    String? category,
    String? levels,
    int? steps,
    DocumentReference? userRef,
    String? userName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startTime = startTime,
        _category = category,
        _levels = levels,
        _steps = steps,
        _userRef = userRef,
        _userName = userName,
        super(firestoreUtilData);

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "levels" field.
  String? _levels;
  String get levels => _levels ?? '';
  set levels(String? val) => _levels = val;
  bool hasLevels() => _levels != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  set steps(int? val) => _steps = val;
  void incrementSteps(int amount) => _steps = steps + amount;
  bool hasSteps() => _steps != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  static ListeningJourneyStruct fromMap(Map<String, dynamic> data) =>
      ListeningJourneyStruct(
        startTime: data['startTime'] as DateTime?,
        category: data['category'] as String?,
        levels: data['levels'] as String?,
        steps: castToType<int>(data['steps']),
        userRef: data['userRef'] as DocumentReference?,
        userName: data['userName'] as String?,
      );

  static ListeningJourneyStruct? maybeFromMap(dynamic data) => data is Map
      ? ListeningJourneyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime,
        'category': _category,
        'levels': _levels,
        'steps': _steps,
        'userRef': _userRef,
        'userName': _userName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'levels': serializeParam(
          _levels,
          ParamType.String,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.int,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ListeningJourneyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListeningJourneyStruct(
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        levels: deserializeParam(
          data['levels'],
          ParamType.String,
          false,
        ),
        steps: deserializeParam(
          data['steps'],
          ParamType.int,
          false,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['User'],
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ListeningJourneyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListeningJourneyStruct &&
        startTime == other.startTime &&
        category == other.category &&
        levels == other.levels &&
        steps == other.steps &&
        userRef == other.userRef &&
        userName == other.userName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([startTime, category, levels, steps, userRef, userName]);
}

ListeningJourneyStruct createListeningJourneyStruct({
  DateTime? startTime,
  String? category,
  String? levels,
  int? steps,
  DocumentReference? userRef,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ListeningJourneyStruct(
      startTime: startTime,
      category: category,
      levels: levels,
      steps: steps,
      userRef: userRef,
      userName: userName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ListeningJourneyStruct? updateListeningJourneyStruct(
  ListeningJourneyStruct? listeningJourney, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    listeningJourney
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addListeningJourneyStructData(
  Map<String, dynamic> firestoreData,
  ListeningJourneyStruct? listeningJourney,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (listeningJourney == null) {
    return;
  }
  if (listeningJourney.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && listeningJourney.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final listeningJourneyData =
      getListeningJourneyFirestoreData(listeningJourney, forFieldValue);
  final nestedData =
      listeningJourneyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = listeningJourney.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getListeningJourneyFirestoreData(
  ListeningJourneyStruct? listeningJourney, [
  bool forFieldValue = false,
]) {
  if (listeningJourney == null) {
    return {};
  }
  final firestoreData = mapToFirestore(listeningJourney.toMap());

  // Add any Firestore field values
  listeningJourney.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getListeningJourneyListFirestoreData(
  List<ListeningJourneyStruct>? listeningJourneys,
) =>
    listeningJourneys
        ?.map((e) => getListeningJourneyFirestoreData(e, true))
        .toList() ??
    [];
