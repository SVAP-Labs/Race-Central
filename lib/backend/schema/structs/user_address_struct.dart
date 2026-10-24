// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserAddressStruct extends FFFirebaseStruct {
  UserAddressStruct({
    String? addressLane,
    String? streetLane,
    String? city,
    String? state,
    String? pincode,
    String? country,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _addressLane = addressLane,
        _streetLane = streetLane,
        _city = city,
        _state = state,
        _pincode = pincode,
        _country = country,
        super(firestoreUtilData);

  // "Address_Lane" field.
  String? _addressLane;
  String get addressLane => _addressLane ?? '';
  set addressLane(String? val) => _addressLane = val;

  bool hasAddressLane() => _addressLane != null;

  // "Street_Lane" field.
  String? _streetLane;
  String get streetLane => _streetLane ?? '';
  set streetLane(String? val) => _streetLane = val;

  bool hasStreetLane() => _streetLane != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  set pincode(String? val) => _pincode = val;

  bool hasPincode() => _pincode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  static UserAddressStruct fromMap(Map<String, dynamic> data) =>
      UserAddressStruct(
        addressLane: data['Address_Lane'] as String?,
        streetLane: data['Street_Lane'] as String?,
        city: data['city'] as String?,
        state: data['State'] as String?,
        pincode: data['pincode'] as String?,
        country: data['country'] as String?,
      );

  static UserAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Address_Lane': _addressLane,
        'Street_Lane': _streetLane,
        'city': _city,
        'State': _state,
        'pincode': _pincode,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Address_Lane': serializeParam(
          _addressLane,
          ParamType.String,
        ),
        'Street_Lane': serializeParam(
          _streetLane,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'State': serializeParam(
          _state,
          ParamType.String,
        ),
        'pincode': serializeParam(
          _pincode,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAddressStruct(
        addressLane: deserializeParam(
          data['Address_Lane'],
          ParamType.String,
          false,
        ),
        streetLane: deserializeParam(
          data['Street_Lane'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['State'],
          ParamType.String,
          false,
        ),
        pincode: deserializeParam(
          data['pincode'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAddressStruct &&
        addressLane == other.addressLane &&
        streetLane == other.streetLane &&
        city == other.city &&
        state == other.state &&
        pincode == other.pincode &&
        country == other.country;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([addressLane, streetLane, city, state, pincode, country]);
}

UserAddressStruct createUserAddressStruct({
  String? addressLane,
  String? streetLane,
  String? city,
  String? state,
  String? pincode,
  String? country,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAddressStruct(
      addressLane: addressLane,
      streetLane: streetLane,
      city: city,
      state: state,
      pincode: pincode,
      country: country,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAddressStruct? updateUserAddressStruct(
  UserAddressStruct? userAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAddressStructData(
  Map<String, dynamic> firestoreData,
  UserAddressStruct? userAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAddress == null) {
    return;
  }
  if (userAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAddressData =
      getUserAddressFirestoreData(userAddress, forFieldValue);
  final nestedData =
      userAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAddressFirestoreData(
  UserAddressStruct? userAddress, [
  bool forFieldValue = false,
]) {
  if (userAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAddress.toMap());

  // Add any Firestore field values
  mapToFirestore(userAddress.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAddressListFirestoreData(
  List<UserAddressStruct>? userAddresss,
) =>
    userAddresss?.map((e) => getUserAddressFirestoreData(e, true)).toList() ??
    [];
