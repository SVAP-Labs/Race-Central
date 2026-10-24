// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserEmergencyDetailsStruct extends FFFirebaseStruct {
  UserEmergencyDetailsStruct({
    String? emergencyName,
    String? emergencyPhone,
    String? relationship,
    String? emergencyEmail,
    String? emergencyAddressLane,
    String? emergencyStreetlane,
    String? emergencyCity,
    String? emergencyState,
    String? emergencyPincode,
    String? emergencyCountry,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emergencyName = emergencyName,
        _emergencyPhone = emergencyPhone,
        _relationship = relationship,
        _emergencyEmail = emergencyEmail,
        _emergencyAddressLane = emergencyAddressLane,
        _emergencyStreetlane = emergencyStreetlane,
        _emergencyCity = emergencyCity,
        _emergencyState = emergencyState,
        _emergencyPincode = emergencyPincode,
        _emergencyCountry = emergencyCountry,
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

  // "emergency_address_Lane" field.
  String? _emergencyAddressLane;
  String get emergencyAddressLane => _emergencyAddressLane ?? '';
  set emergencyAddressLane(String? val) => _emergencyAddressLane = val;

  bool hasEmergencyAddressLane() => _emergencyAddressLane != null;

  // "emergency_streetlane" field.
  String? _emergencyStreetlane;
  String get emergencyStreetlane => _emergencyStreetlane ?? '';
  set emergencyStreetlane(String? val) => _emergencyStreetlane = val;

  bool hasEmergencyStreetlane() => _emergencyStreetlane != null;

  // "emergency_city" field.
  String? _emergencyCity;
  String get emergencyCity => _emergencyCity ?? '';
  set emergencyCity(String? val) => _emergencyCity = val;

  bool hasEmergencyCity() => _emergencyCity != null;

  // "emergency_state" field.
  String? _emergencyState;
  String get emergencyState => _emergencyState ?? '';
  set emergencyState(String? val) => _emergencyState = val;

  bool hasEmergencyState() => _emergencyState != null;

  // "emergency_pincode" field.
  String? _emergencyPincode;
  String get emergencyPincode => _emergencyPincode ?? '';
  set emergencyPincode(String? val) => _emergencyPincode = val;

  bool hasEmergencyPincode() => _emergencyPincode != null;

  // "emergency_country" field.
  String? _emergencyCountry;
  String get emergencyCountry => _emergencyCountry ?? '';
  set emergencyCountry(String? val) => _emergencyCountry = val;

  bool hasEmergencyCountry() => _emergencyCountry != null;

  static UserEmergencyDetailsStruct fromMap(Map<String, dynamic> data) =>
      UserEmergencyDetailsStruct(
        emergencyName: data['emergency_name'] as String?,
        emergencyPhone: data['emergency_phone'] as String?,
        relationship: data['relationship'] as String?,
        emergencyEmail: data['emergency_email'] as String?,
        emergencyAddressLane: data['emergency_address_Lane'] as String?,
        emergencyStreetlane: data['emergency_streetlane'] as String?,
        emergencyCity: data['emergency_city'] as String?,
        emergencyState: data['emergency_state'] as String?,
        emergencyPincode: data['emergency_pincode'] as String?,
        emergencyCountry: data['emergency_country'] as String?,
      );

  static UserEmergencyDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserEmergencyDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'emergency_name': _emergencyName,
        'emergency_phone': _emergencyPhone,
        'relationship': _relationship,
        'emergency_email': _emergencyEmail,
        'emergency_address_Lane': _emergencyAddressLane,
        'emergency_streetlane': _emergencyStreetlane,
        'emergency_city': _emergencyCity,
        'emergency_state': _emergencyState,
        'emergency_pincode': _emergencyPincode,
        'emergency_country': _emergencyCountry,
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
        'emergency_address_Lane': serializeParam(
          _emergencyAddressLane,
          ParamType.String,
        ),
        'emergency_streetlane': serializeParam(
          _emergencyStreetlane,
          ParamType.String,
        ),
        'emergency_city': serializeParam(
          _emergencyCity,
          ParamType.String,
        ),
        'emergency_state': serializeParam(
          _emergencyState,
          ParamType.String,
        ),
        'emergency_pincode': serializeParam(
          _emergencyPincode,
          ParamType.String,
        ),
        'emergency_country': serializeParam(
          _emergencyCountry,
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
        emergencyAddressLane: deserializeParam(
          data['emergency_address_Lane'],
          ParamType.String,
          false,
        ),
        emergencyStreetlane: deserializeParam(
          data['emergency_streetlane'],
          ParamType.String,
          false,
        ),
        emergencyCity: deserializeParam(
          data['emergency_city'],
          ParamType.String,
          false,
        ),
        emergencyState: deserializeParam(
          data['emergency_state'],
          ParamType.String,
          false,
        ),
        emergencyPincode: deserializeParam(
          data['emergency_pincode'],
          ParamType.String,
          false,
        ),
        emergencyCountry: deserializeParam(
          data['emergency_country'],
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
        emergencyEmail == other.emergencyEmail &&
        emergencyAddressLane == other.emergencyAddressLane &&
        emergencyStreetlane == other.emergencyStreetlane &&
        emergencyCity == other.emergencyCity &&
        emergencyState == other.emergencyState &&
        emergencyPincode == other.emergencyPincode &&
        emergencyCountry == other.emergencyCountry;
  }

  @override
  int get hashCode => const ListEquality().hash([
        emergencyName,
        emergencyPhone,
        relationship,
        emergencyEmail,
        emergencyAddressLane,
        emergencyStreetlane,
        emergencyCity,
        emergencyState,
        emergencyPincode,
        emergencyCountry
      ]);
}

UserEmergencyDetailsStruct createUserEmergencyDetailsStruct({
  String? emergencyName,
  String? emergencyPhone,
  String? relationship,
  String? emergencyEmail,
  String? emergencyAddressLane,
  String? emergencyStreetlane,
  String? emergencyCity,
  String? emergencyState,
  String? emergencyPincode,
  String? emergencyCountry,
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
      emergencyAddressLane: emergencyAddressLane,
      emergencyStreetlane: emergencyStreetlane,
      emergencyCity: emergencyCity,
      emergencyState: emergencyState,
      emergencyPincode: emergencyPincode,
      emergencyCountry: emergencyCountry,
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
