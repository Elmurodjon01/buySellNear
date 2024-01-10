// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EndData2Struct extends FFFirebaseStruct {
  EndData2Struct({
    DateTime? startTime,
    String? category,
    String? levels,
    int? steps,
    DocumentReference? userRef,
    String? userName,
    DateTime? endTime,
    DateTime? overall,
    bool? isPassedf,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startTime = startTime,
        _category = category,
        _levels = levels,
        _steps = steps,
        _userRef = userRef,
        _userName = userName,
        _endTime = endTime,
        _overall = overall,
        _isPassedf = isPassedf,
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

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  // "overall" field.
  DateTime? _overall;
  DateTime? get overall => _overall;
  set overall(DateTime? val) => _overall = val;
  bool hasOverall() => _overall != null;

  // "isPassedf" field.
  bool? _isPassedf;
  bool get isPassedf => _isPassedf ?? false;
  set isPassedf(bool? val) => _isPassedf = val;
  bool hasIsPassedf() => _isPassedf != null;

  static EndData2Struct fromMap(Map<String, dynamic> data) => EndData2Struct(
        startTime: data['startTime'] as DateTime?,
        category: data['category'] as String?,
        levels: data['levels'] as String?,
        steps: castToType<int>(data['steps']),
        userRef: data['userRef'] as DocumentReference?,
        userName: data['userName'] as String?,
        endTime: data['endTime'] as DateTime?,
        overall: data['overall'] as DateTime?,
        isPassedf: data['isPassedf'] as bool?,
      );

  static EndData2Struct? maybeFromMap(dynamic data) =>
      data is Map ? EndData2Struct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime,
        'category': _category,
        'levels': _levels,
        'steps': _steps,
        'userRef': _userRef,
        'userName': _userName,
        'endTime': _endTime,
        'overall': _overall,
        'isPassedf': _isPassedf,
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
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'overall': serializeParam(
          _overall,
          ParamType.DateTime,
        ),
        'isPassedf': serializeParam(
          _isPassedf,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EndData2Struct fromSerializableMap(Map<String, dynamic> data) =>
      EndData2Struct(
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
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
        overall: deserializeParam(
          data['overall'],
          ParamType.DateTime,
          false,
        ),
        isPassedf: deserializeParam(
          data['isPassedf'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EndData2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EndData2Struct &&
        startTime == other.startTime &&
        category == other.category &&
        levels == other.levels &&
        steps == other.steps &&
        userRef == other.userRef &&
        userName == other.userName &&
        endTime == other.endTime &&
        overall == other.overall &&
        isPassedf == other.isPassedf;
  }

  @override
  int get hashCode => const ListEquality().hash([
        startTime,
        category,
        levels,
        steps,
        userRef,
        userName,
        endTime,
        overall,
        isPassedf
      ]);
}

EndData2Struct createEndData2Struct({
  DateTime? startTime,
  String? category,
  String? levels,
  int? steps,
  DocumentReference? userRef,
  String? userName,
  DateTime? endTime,
  DateTime? overall,
  bool? isPassedf,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EndData2Struct(
      startTime: startTime,
      category: category,
      levels: levels,
      steps: steps,
      userRef: userRef,
      userName: userName,
      endTime: endTime,
      overall: overall,
      isPassedf: isPassedf,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EndData2Struct? updateEndData2Struct(
  EndData2Struct? endData2, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    endData2
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEndData2StructData(
  Map<String, dynamic> firestoreData,
  EndData2Struct? endData2,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (endData2 == null) {
    return;
  }
  if (endData2.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && endData2.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final endData2Data = getEndData2FirestoreData(endData2, forFieldValue);
  final nestedData = endData2Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = endData2.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEndData2FirestoreData(
  EndData2Struct? endData2, [
  bool forFieldValue = false,
]) {
  if (endData2 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(endData2.toMap());

  // Add any Firestore field values
  endData2.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEndData2ListFirestoreData(
  List<EndData2Struct>? endData2s,
) =>
    endData2s?.map((e) => getEndData2FirestoreData(e, true)).toList() ?? [];
