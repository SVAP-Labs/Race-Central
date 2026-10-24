// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserDetailsProfileStruct extends FFFirebaseStruct {
  UserDetailsProfileStruct({
    String? nationality,
    String? facebookHandle,
    String? instagramHandle,
    String? racingSince,
    String? numberOfRacesParticpated,
    String? noOfPodiums,
    String? hobby,
    String? motorsportIdol,
    String? aim,
    bool? isNonVeg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nationality = nationality,
        _facebookHandle = facebookHandle,
        _instagramHandle = instagramHandle,
        _racingSince = racingSince,
        _numberOfRacesParticpated = numberOfRacesParticpated,
        _noOfPodiums = noOfPodiums,
        _hobby = hobby,
        _motorsportIdol = motorsportIdol,
        _aim = aim,
        _isNonVeg = isNonVeg,
        super(firestoreUtilData);

  // "Nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  set nationality(String? val) => _nationality = val;

  bool hasNationality() => _nationality != null;

  // "facebook_handle" field.
  String? _facebookHandle;
  String get facebookHandle => _facebookHandle ?? '';
  set facebookHandle(String? val) => _facebookHandle = val;

  bool hasFacebookHandle() => _facebookHandle != null;

  // "instagram_handle" field.
  String? _instagramHandle;
  String get instagramHandle => _instagramHandle ?? '';
  set instagramHandle(String? val) => _instagramHandle = val;

  bool hasInstagramHandle() => _instagramHandle != null;

  // "racing_since" field.
  String? _racingSince;
  String get racingSince => _racingSince ?? '';
  set racingSince(String? val) => _racingSince = val;

  bool hasRacingSince() => _racingSince != null;

  // "number_of_races_particpated" field.
  String? _numberOfRacesParticpated;
  String get numberOfRacesParticpated => _numberOfRacesParticpated ?? '';
  set numberOfRacesParticpated(String? val) => _numberOfRacesParticpated = val;

  bool hasNumberOfRacesParticpated() => _numberOfRacesParticpated != null;

  // "no_of_podiums" field.
  String? _noOfPodiums;
  String get noOfPodiums => _noOfPodiums ?? '';
  set noOfPodiums(String? val) => _noOfPodiums = val;

  bool hasNoOfPodiums() => _noOfPodiums != null;

  // "hobby" field.
  String? _hobby;
  String get hobby => _hobby ?? '';
  set hobby(String? val) => _hobby = val;

  bool hasHobby() => _hobby != null;

  // "motorsport_idol" field.
  String? _motorsportIdol;
  String get motorsportIdol => _motorsportIdol ?? '';
  set motorsportIdol(String? val) => _motorsportIdol = val;

  bool hasMotorsportIdol() => _motorsportIdol != null;

  // "AIM" field.
  String? _aim;
  String get aim => _aim ?? '';
  set aim(String? val) => _aim = val;

  bool hasAim() => _aim != null;

  // "isNonVeg" field.
  bool? _isNonVeg;
  bool get isNonVeg => _isNonVeg ?? false;
  set isNonVeg(bool? val) => _isNonVeg = val;

  bool hasIsNonVeg() => _isNonVeg != null;

  static UserDetailsProfileStruct fromMap(Map<String, dynamic> data) =>
      UserDetailsProfileStruct(
        nationality: data['Nationality'] as String?,
        facebookHandle: data['facebook_handle'] as String?,
        instagramHandle: data['instagram_handle'] as String?,
        racingSince: data['racing_since'] as String?,
        numberOfRacesParticpated:
            data['number_of_races_particpated'] as String?,
        noOfPodiums: data['no_of_podiums'] as String?,
        hobby: data['hobby'] as String?,
        motorsportIdol: data['motorsport_idol'] as String?,
        aim: data['AIM'] as String?,
        isNonVeg: data['isNonVeg'] as bool?,
      );

  static UserDetailsProfileStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDetailsProfileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Nationality': _nationality,
        'facebook_handle': _facebookHandle,
        'instagram_handle': _instagramHandle,
        'racing_since': _racingSince,
        'number_of_races_particpated': _numberOfRacesParticpated,
        'no_of_podiums': _noOfPodiums,
        'hobby': _hobby,
        'motorsport_idol': _motorsportIdol,
        'AIM': _aim,
        'isNonVeg': _isNonVeg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nationality': serializeParam(
          _nationality,
          ParamType.String,
        ),
        'facebook_handle': serializeParam(
          _facebookHandle,
          ParamType.String,
        ),
        'instagram_handle': serializeParam(
          _instagramHandle,
          ParamType.String,
        ),
        'racing_since': serializeParam(
          _racingSince,
          ParamType.String,
        ),
        'number_of_races_particpated': serializeParam(
          _numberOfRacesParticpated,
          ParamType.String,
        ),
        'no_of_podiums': serializeParam(
          _noOfPodiums,
          ParamType.String,
        ),
        'hobby': serializeParam(
          _hobby,
          ParamType.String,
        ),
        'motorsport_idol': serializeParam(
          _motorsportIdol,
          ParamType.String,
        ),
        'AIM': serializeParam(
          _aim,
          ParamType.String,
        ),
        'isNonVeg': serializeParam(
          _isNonVeg,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserDetailsProfileStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserDetailsProfileStruct(
        nationality: deserializeParam(
          data['Nationality'],
          ParamType.String,
          false,
        ),
        facebookHandle: deserializeParam(
          data['facebook_handle'],
          ParamType.String,
          false,
        ),
        instagramHandle: deserializeParam(
          data['instagram_handle'],
          ParamType.String,
          false,
        ),
        racingSince: deserializeParam(
          data['racing_since'],
          ParamType.String,
          false,
        ),
        numberOfRacesParticpated: deserializeParam(
          data['number_of_races_particpated'],
          ParamType.String,
          false,
        ),
        noOfPodiums: deserializeParam(
          data['no_of_podiums'],
          ParamType.String,
          false,
        ),
        hobby: deserializeParam(
          data['hobby'],
          ParamType.String,
          false,
        ),
        motorsportIdol: deserializeParam(
          data['motorsport_idol'],
          ParamType.String,
          false,
        ),
        aim: deserializeParam(
          data['AIM'],
          ParamType.String,
          false,
        ),
        isNonVeg: deserializeParam(
          data['isNonVeg'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserDetailsProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDetailsProfileStruct &&
        nationality == other.nationality &&
        facebookHandle == other.facebookHandle &&
        instagramHandle == other.instagramHandle &&
        racingSince == other.racingSince &&
        numberOfRacesParticpated == other.numberOfRacesParticpated &&
        noOfPodiums == other.noOfPodiums &&
        hobby == other.hobby &&
        motorsportIdol == other.motorsportIdol &&
        aim == other.aim &&
        isNonVeg == other.isNonVeg;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nationality,
        facebookHandle,
        instagramHandle,
        racingSince,
        numberOfRacesParticpated,
        noOfPodiums,
        hobby,
        motorsportIdol,
        aim,
        isNonVeg
      ]);
}

UserDetailsProfileStruct createUserDetailsProfileStruct({
  String? nationality,
  String? facebookHandle,
  String? instagramHandle,
  String? racingSince,
  String? numberOfRacesParticpated,
  String? noOfPodiums,
  String? hobby,
  String? motorsportIdol,
  String? aim,
  bool? isNonVeg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDetailsProfileStruct(
      nationality: nationality,
      facebookHandle: facebookHandle,
      instagramHandle: instagramHandle,
      racingSince: racingSince,
      numberOfRacesParticpated: numberOfRacesParticpated,
      noOfPodiums: noOfPodiums,
      hobby: hobby,
      motorsportIdol: motorsportIdol,
      aim: aim,
      isNonVeg: isNonVeg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDetailsProfileStruct? updateUserDetailsProfileStruct(
  UserDetailsProfileStruct? userDetailsProfile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userDetailsProfile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDetailsProfileStructData(
  Map<String, dynamic> firestoreData,
  UserDetailsProfileStruct? userDetailsProfile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userDetailsProfile == null) {
    return;
  }
  if (userDetailsProfile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userDetailsProfile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDetailsProfileData =
      getUserDetailsProfileFirestoreData(userDetailsProfile, forFieldValue);
  final nestedData =
      userDetailsProfileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userDetailsProfile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDetailsProfileFirestoreData(
  UserDetailsProfileStruct? userDetailsProfile, [
  bool forFieldValue = false,
]) {
  if (userDetailsProfile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userDetailsProfile.toMap());

  // Add any Firestore field values
  mapToFirestore(userDetailsProfile.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDetailsProfileListFirestoreData(
  List<UserDetailsProfileStruct>? userDetailsProfiles,
) =>
    userDetailsProfiles
        ?.map((e) => getUserDetailsProfileFirestoreData(e, true))
        .toList() ??
    [];
