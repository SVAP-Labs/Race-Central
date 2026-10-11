import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "role" field.
  UserRole? _role;
  UserRole? get role => _role;
  bool hasRole() => _role != null;

  // "dateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "racingTeam" field.
  String? _racingTeam;
  String get racingTeam => _racingTeam ?? '';
  bool hasRacingTeam() => _racingTeam != null;

  // "cuurentAge" field.
  int? _cuurentAge;
  int get cuurentAge => _cuurentAge ?? 0;
  bool hasCuurentAge() => _cuurentAge != null;

  // "bloodGroup" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  bool hasBloodGroup() => _bloodGroup != null;

  // "parentName" field.
  String? _parentName;
  String get parentName => _parentName ?? '';
  bool hasParentName() => _parentName != null;

  // "emergencyContact" field.
  String? _emergencyContact;
  String get emergencyContact => _emergencyContact ?? '';
  bool hasEmergencyContact() => _emergencyContact != null;

  // "supaBaseUID" field.
  String? _supaBaseUID;
  String get supaBaseUID => _supaBaseUID ?? '';
  bool hasSupaBaseUID() => _supaBaseUID != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "alternate_email" field.
  String? _alternateEmail;
  String get alternateEmail => _alternateEmail ?? '';
  bool hasAlternateEmail() => _alternateEmail != null;

  // "preffered_entry_number" field.
  String? _prefferedEntryNumber;
  String get prefferedEntryNumber => _prefferedEntryNumber ?? '';
  bool hasPrefferedEntryNumber() => _prefferedEntryNumber != null;

  // "Address" field.
  UserAddressStruct? _address;
  UserAddressStruct get address => _address ?? UserAddressStruct();
  bool hasAddress() => _address != null;

  // "event_Emegency_Details" field.
  UserEmergencyDetailsStruct? _eventEmegencyDetails;
  UserEmergencyDetailsStruct get eventEmegencyDetails =>
      _eventEmegencyDetails ?? UserEmergencyDetailsStruct();
  bool hasEventEmegencyDetails() => _eventEmegencyDetails != null;

  // "user_id_proof" field.
  String? _userIdProof;
  String get userIdProof => _userIdProof ?? '';
  bool hasUserIdProof() => _userIdProof != null;

  // "user_detail_profile" field.
  UserDetailsProfileStruct? _userDetailProfile;
  UserDetailsProfileStruct get userDetailProfile =>
      _userDetailProfile ?? UserDetailsProfileStruct();
  bool hasUserDetailProfile() => _userDetailProfile != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _fcmToken = snapshotData['fcm_token'] as String?;
    _role = snapshotData['role'] is UserRole
        ? snapshotData['role']
        : deserializeEnum<UserRole>(snapshotData['role']);
    _dateOfBirth = snapshotData['dateOfBirth'] as DateTime?;
    _racingTeam = snapshotData['racingTeam'] as String?;
    _cuurentAge = castToType<int>(snapshotData['cuurentAge']);
    _bloodGroup = snapshotData['bloodGroup'] as String?;
    _parentName = snapshotData['parentName'] as String?;
    _emergencyContact = snapshotData['emergencyContact'] as String?;
    _supaBaseUID = snapshotData['supaBaseUID'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _alternateEmail = snapshotData['alternate_email'] as String?;
    _prefferedEntryNumber = snapshotData['preffered_entry_number'] as String?;
    _address = snapshotData['Address'] is UserAddressStruct
        ? snapshotData['Address']
        : UserAddressStruct.maybeFromMap(snapshotData['Address']);
    _eventEmegencyDetails =
        snapshotData['event_Emegency_Details'] is UserEmergencyDetailsStruct
            ? snapshotData['event_Emegency_Details']
            : UserEmergencyDetailsStruct.maybeFromMap(
                snapshotData['event_Emegency_Details']);
    _userIdProof = snapshotData['user_id_proof'] as String?;
    _userDetailProfile =
        snapshotData['user_detail_profile'] is UserDetailsProfileStruct
            ? snapshotData['user_detail_profile']
            : UserDetailsProfileStruct.maybeFromMap(
                snapshotData['user_detail_profile']);
    _gender = snapshotData['gender'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? title,
  String? fcmToken,
  UserRole? role,
  DateTime? dateOfBirth,
  String? racingTeam,
  int? cuurentAge,
  String? bloodGroup,
  String? parentName,
  String? emergencyContact,
  String? supaBaseUID,
  String? firstName,
  String? lastName,
  String? alternateEmail,
  String? prefferedEntryNumber,
  UserAddressStruct? address,
  UserEmergencyDetailsStruct? eventEmegencyDetails,
  String? userIdProof,
  UserDetailsProfileStruct? userDetailProfile,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'title': title,
      'fcm_token': fcmToken,
      'role': role,
      'dateOfBirth': dateOfBirth,
      'racingTeam': racingTeam,
      'cuurentAge': cuurentAge,
      'bloodGroup': bloodGroup,
      'parentName': parentName,
      'emergencyContact': emergencyContact,
      'supaBaseUID': supaBaseUID,
      'first_name': firstName,
      'last_name': lastName,
      'alternate_email': alternateEmail,
      'preffered_entry_number': prefferedEntryNumber,
      'Address': UserAddressStruct().toMap(),
      'event_Emegency_Details': UserEmergencyDetailsStruct().toMap(),
      'user_id_proof': userIdProof,
      'user_detail_profile': UserDetailsProfileStruct().toMap(),
      'gender': gender,
    }.withoutNulls,
  );

  // Handle nested data for "Address" field.
  addUserAddressStructData(firestoreData, address, 'Address');

  // Handle nested data for "event_Emegency_Details" field.
  addUserEmergencyDetailsStructData(
      firestoreData, eventEmegencyDetails, 'event_Emegency_Details');

  // Handle nested data for "user_detail_profile" field.
  addUserDetailsProfileStructData(
      firestoreData, userDetailProfile, 'user_detail_profile');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.title == e2?.title &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.role == e2?.role &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.racingTeam == e2?.racingTeam &&
        e1?.cuurentAge == e2?.cuurentAge &&
        e1?.bloodGroup == e2?.bloodGroup &&
        e1?.parentName == e2?.parentName &&
        e1?.emergencyContact == e2?.emergencyContact &&
        e1?.supaBaseUID == e2?.supaBaseUID &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.alternateEmail == e2?.alternateEmail &&
        e1?.prefferedEntryNumber == e2?.prefferedEntryNumber &&
        e1?.address == e2?.address &&
        e1?.eventEmegencyDetails == e2?.eventEmegencyDetails &&
        e1?.userIdProof == e2?.userIdProof &&
        e1?.userDetailProfile == e2?.userDetailProfile &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.title,
        e?.fcmToken,
        e?.role,
        e?.dateOfBirth,
        e?.racingTeam,
        e?.cuurentAge,
        e?.bloodGroup,
        e?.parentName,
        e?.emergencyContact,
        e?.supaBaseUID,
        e?.firstName,
        e?.lastName,
        e?.alternateEmail,
        e?.prefferedEntryNumber,
        e?.address,
        e?.eventEmegencyDetails,
        e?.userIdProof,
        e?.userDetailProfile,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
