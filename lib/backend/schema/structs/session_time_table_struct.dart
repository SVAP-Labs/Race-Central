// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SessionTimeTableStruct extends FFFirebaseStruct {
  SessionTimeTableStruct({
    int? orderIndex,
    String? startTime,
    String? endTime,
    String? sessionDetail,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderIndex = orderIndex,
        _startTime = startTime,
        _endTime = endTime,
        _sessionDetail = sessionDetail,
        _id = id,
        super(firestoreUtilData);

  // "order_index" field.
  int? _orderIndex;
  int get orderIndex => _orderIndex ?? 0;
  set orderIndex(int? val) => _orderIndex = val;

  void incrementOrderIndex(int amount) => orderIndex = orderIndex + amount;

  bool hasOrderIndex() => _orderIndex != null;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "sessionDetail" field.
  String? _sessionDetail;
  String get sessionDetail => _sessionDetail ?? '';
  set sessionDetail(String? val) => _sessionDetail = val;

  bool hasSessionDetail() => _sessionDetail != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static SessionTimeTableStruct fromMap(Map<String, dynamic> data) =>
      SessionTimeTableStruct(
        orderIndex: castToType<int>(data['order_index']),
        startTime: data['startTime'] as String?,
        endTime: data['endTime'] as String?,
        sessionDetail: data['sessionDetail'] as String?,
        id: data['id'] as String?,
      );

  static SessionTimeTableStruct? maybeFromMap(dynamic data) => data is Map
      ? SessionTimeTableStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'order_index': _orderIndex,
        'startTime': _startTime,
        'endTime': _endTime,
        'sessionDetail': _sessionDetail,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_index': serializeParam(
          _orderIndex,
          ParamType.int,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'sessionDetail': serializeParam(
          _sessionDetail,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static SessionTimeTableStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SessionTimeTableStruct(
        orderIndex: deserializeParam(
          data['order_index'],
          ParamType.int,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.String,
          false,
        ),
        sessionDetail: deserializeParam(
          data['sessionDetail'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SessionTimeTableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SessionTimeTableStruct &&
        orderIndex == other.orderIndex &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        sessionDetail == other.sessionDetail &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([orderIndex, startTime, endTime, sessionDetail, id]);
}

SessionTimeTableStruct createSessionTimeTableStruct({
  int? orderIndex,
  String? startTime,
  String? endTime,
  String? sessionDetail,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SessionTimeTableStruct(
      orderIndex: orderIndex,
      startTime: startTime,
      endTime: endTime,
      sessionDetail: sessionDetail,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SessionTimeTableStruct? updateSessionTimeTableStruct(
  SessionTimeTableStruct? sessionTimeTable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sessionTimeTable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSessionTimeTableStructData(
  Map<String, dynamic> firestoreData,
  SessionTimeTableStruct? sessionTimeTable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sessionTimeTable == null) {
    return;
  }
  if (sessionTimeTable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sessionTimeTable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sessionTimeTableData =
      getSessionTimeTableFirestoreData(sessionTimeTable, forFieldValue);
  final nestedData =
      sessionTimeTableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sessionTimeTable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSessionTimeTableFirestoreData(
  SessionTimeTableStruct? sessionTimeTable, [
  bool forFieldValue = false,
]) {
  if (sessionTimeTable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sessionTimeTable.toMap());

  // Add any Firestore field values
  mapToFirestore(sessionTimeTable.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSessionTimeTableListFirestoreData(
  List<SessionTimeTableStruct>? sessionTimeTables,
) =>
    sessionTimeTables
        ?.map((e) => getSessionTimeTableFirestoreData(e, true))
        .toList() ??
    [];
