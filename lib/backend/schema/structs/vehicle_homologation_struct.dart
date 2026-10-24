// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VehicleHomologationStruct extends FFFirebaseStruct {
  VehicleHomologationStruct({
    String? homologationNo,
    double? cc,
    double? minWt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _homologationNo = homologationNo,
        _cc = cc,
        _minWt = minWt,
        super(firestoreUtilData);

  // "homologationNo" field.
  String? _homologationNo;
  String get homologationNo => _homologationNo ?? '';
  set homologationNo(String? val) => _homologationNo = val;

  bool hasHomologationNo() => _homologationNo != null;

  // "cc" field.
  double? _cc;
  double get cc => _cc ?? 0.0;
  set cc(double? val) => _cc = val;

  void incrementCc(double amount) => cc = cc + amount;

  bool hasCc() => _cc != null;

  // "minWt" field.
  double? _minWt;
  double get minWt => _minWt ?? 0.0;
  set minWt(double? val) => _minWt = val;

  void incrementMinWt(double amount) => minWt = minWt + amount;

  bool hasMinWt() => _minWt != null;

  static VehicleHomologationStruct fromMap(Map<String, dynamic> data) =>
      VehicleHomologationStruct(
        homologationNo: data['homologationNo'] as String?,
        cc: castToType<double>(data['cc']),
        minWt: castToType<double>(data['minWt']),
      );

  static VehicleHomologationStruct? maybeFromMap(dynamic data) => data is Map
      ? VehicleHomologationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'homologationNo': _homologationNo,
        'cc': _cc,
        'minWt': _minWt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'homologationNo': serializeParam(
          _homologationNo,
          ParamType.String,
        ),
        'cc': serializeParam(
          _cc,
          ParamType.double,
        ),
        'minWt': serializeParam(
          _minWt,
          ParamType.double,
        ),
      }.withoutNulls;

  static VehicleHomologationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VehicleHomologationStruct(
        homologationNo: deserializeParam(
          data['homologationNo'],
          ParamType.String,
          false,
        ),
        cc: deserializeParam(
          data['cc'],
          ParamType.double,
          false,
        ),
        minWt: deserializeParam(
          data['minWt'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'VehicleHomologationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VehicleHomologationStruct &&
        homologationNo == other.homologationNo &&
        cc == other.cc &&
        minWt == other.minWt;
  }

  @override
  int get hashCode => const ListEquality().hash([homologationNo, cc, minWt]);
}

VehicleHomologationStruct createVehicleHomologationStruct({
  String? homologationNo,
  double? cc,
  double? minWt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VehicleHomologationStruct(
      homologationNo: homologationNo,
      cc: cc,
      minWt: minWt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VehicleHomologationStruct? updateVehicleHomologationStruct(
  VehicleHomologationStruct? vehicleHomologation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vehicleHomologation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVehicleHomologationStructData(
  Map<String, dynamic> firestoreData,
  VehicleHomologationStruct? vehicleHomologation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vehicleHomologation == null) {
    return;
  }
  if (vehicleHomologation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vehicleHomologation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vehicleHomologationData =
      getVehicleHomologationFirestoreData(vehicleHomologation, forFieldValue);
  final nestedData =
      vehicleHomologationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      vehicleHomologation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVehicleHomologationFirestoreData(
  VehicleHomologationStruct? vehicleHomologation, [
  bool forFieldValue = false,
]) {
  if (vehicleHomologation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vehicleHomologation.toMap());

  // Add any Firestore field values
  mapToFirestore(vehicleHomologation.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVehicleHomologationListFirestoreData(
  List<VehicleHomologationStruct>? vehicleHomologations,
) =>
    vehicleHomologations
        ?.map((e) => getVehicleHomologationFirestoreData(e, true))
        .toList() ??
    [];
