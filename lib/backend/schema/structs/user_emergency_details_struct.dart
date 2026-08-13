// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserEmergencyDetailsStruct extends FFFirebaseStruct {
  UserEmergencyDetailsStruct({
    String? emergencyName,
    String? emergencyPhone,
    String? relationship,
    String? emergencyEmail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emergencyName = emergencyName,
        _emergencyPhone = emergencyPhone,
        _relationship = relationship,
        _emergencyEmail = emergencyEmail,
        super(firestoreUtilData);

  // "emergency_name" field.
  String? _emergencyName;
  String get emergencyName => _emergencyName ?? '';
  set emergencyName(String? val) => _emergencyName = val;

  bool hasEmergencyName() => _emergencyName != null;

  // "emergency_phone" field.
  String? _emergencyPhone;
  String get emergencyPhone => _emergencyPhone ?? '';
  set emergencyPhone(String? val) => _emergencyPhone = val;

  bool hasEmergencyPhone() => _emergencyPhone != null;

  // "relationship" field.
  String? _relationship;
  String get relationship => _relationship ?? '';
  set relationship(String? val) => _relationship = val;

  bool hasRelationship() => _relationship != null;

  // "emergency_email" field.
  String? _emergencyEmail;
  String get emergencyEmail => _emergencyEmail ?? '';
  set emergencyEmail(String? val) => _emergencyEmail = val;

  bool hasEmergencyEmail() => _emergencyEmail != null;

  static UserEmergencyDetailsStruct fromMap(Map<String, dynamic> data) =>
      UserEmergencyDetailsStruct(
        emergencyName: data['emergency_name'] as String?,
        emergencyPhone: data['emergency_phone'] as String?,
        relationship: data['relationship'] as String?,
        emergencyEmail: data['emergency_email'] as String?,
      );

  static UserEmergencyDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserEmergencyDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'emergency_name': _emergencyName,
        'emergency_phone': _emergencyPhone,
        'relationship': _relationship,
        'emergency_email': _emergencyEmail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'emergency_name': serializeParam(
          _emergencyName,
          ParamType.String,
        ),
        'emergency_phone': serializeParam(
          _emergencyPhone,
          ParamType.String,
        ),
        'relationship': serializeParam(
          _relationship,
          ParamType.String,
        ),
        'emergency_email': serializeParam(
          _emergencyEmail,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserEmergencyDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserEmergencyDetailsStruct(
        emergencyName: deserializeParam(
          data['emergency_name'],
          ParamType.String,
          false,
        ),
        emergencyPhone: deserializeParam(
          data['emergency_phone'],
          ParamType.String,
          false,
        ),
        relationship: deserializeParam(
          data['relationship'],
          ParamType.String,
          false,
        ),
        emergencyEmail: deserializeParam(
          data['emergency_email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserEmergencyDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserEmergencyDetailsStruct &&
        emergencyName == other.emergencyName &&
        emergencyPhone == other.emergencyPhone &&
        relationship == other.relationship &&
        emergencyEmail == other.emergencyEmail;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([emergencyName, emergencyPhone, relationship, emergencyEmail]);
}

UserEmergencyDetailsStruct createUserEmergencyDetailsStruct({
  String? emergencyName,
  String? emergencyPhone,
  String? relationship,
  String? emergencyEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserEmergencyDetailsStruct(
      emergencyName: emergencyName,
      emergencyPhone: emergencyPhone,
      relationship: relationship,
      emergencyEmail: emergencyEmail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserEmergencyDetailsStruct? updateUserEmergencyDetailsStruct(
  UserEmergencyDetailsStruct? userEmergencyDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userEmergencyDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserEmergencyDetailsStructData(
  Map<String, dynamic> firestoreData,
  UserEmergencyDetailsStruct? userEmergencyDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userEmergencyDetails == null) {
    return;
  }
  if (userEmergencyDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userEmergencyDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userEmergencyDetailsData =
      getUserEmergencyDetailsFirestoreData(userEmergencyDetails, forFieldValue);
  final nestedData =
      userEmergencyDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userEmergencyDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserEmergencyDetailsFirestoreData(
  UserEmergencyDetailsStruct? userEmergencyDetails, [
  bool forFieldValue = false,
]) {
  if (userEmergencyDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userEmergencyDetails.toMap());

  // Add any Firestore field values
  mapToFirestore(userEmergencyDetails.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserEmergencyDetailsListFirestoreData(
  List<UserEmergencyDetailsStruct>? userEmergencyDetailss,
) =>
    userEmergencyDetailss
        ?.map((e) => getUserEmergencyDetailsFirestoreData(e, true))
        .toList() ??
    [];
