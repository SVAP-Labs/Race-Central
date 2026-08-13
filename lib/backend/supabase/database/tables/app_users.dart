import '../database.dart';

class AppUsersTable extends SupabaseTable<AppUsersRow> {
  @override
  String get tableName => 'app_users';

  @override
  AppUsersRow createRow(Map<String, dynamic> data) => AppUsersRow(data);
}

class AppUsersRow extends SupabaseDataRow {
  AppUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppUsersTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get firebaseUid => getField<String>('firebase_uid')!;
  set firebaseUid(String value) => setField<String>('firebase_uid', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get dob => getField<DateTime>('dob');
  set dob(DateTime? value) => setField<DateTime>('dob', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  String? get bloodGroup => getField<String>('bloodGroup');
  set bloodGroup(String? value) => setField<String>('bloodGroup', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get uniqueUserCode => getField<String>('uniqueUserCode');
  set uniqueUserCode(String? value) =>
      setField<String>('uniqueUserCode', value);

  String? get parentName => getField<String>('parentName');
  set parentName(String? value) => setField<String>('parentName', value);

  String? get parentContact => getField<String>('parentContact');
  set parentContact(String? value) => setField<String>('parentContact', value);

  String? get emailID => getField<String>('emailID');
  set emailID(String? value) => setField<String>('emailID', value);

  bool? get profileOK => getField<bool>('profileOK');
  set profileOK(bool? value) => setField<bool>('profileOK', value);

  String? get alternateEmail => getField<String>('alternate_email');
  set alternateEmail(String? value) =>
      setField<String>('alternate_email', value);

  String? get addressLane1 => getField<String>('address_lane_1');
  set addressLane1(String? value) => setField<String>('address_lane_1', value);

  String? get addressLane2 => getField<String>('address_lane_2');
  set addressLane2(String? value) => setField<String>('address_lane_2', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  String? get zipcode => getField<String>('zipcode');
  set zipcode(String? value) => setField<String>('zipcode', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get emergyName => getField<String>('emergy_name');
  set emergyName(String? value) => setField<String>('emergy_name', value);

  String? get emergyRelation => getField<String>('emergy_relation');
  set emergyRelation(String? value) =>
      setField<String>('emergy_relation', value);

  String? get emergyContact => getField<String>('emergy_contact');
  set emergyContact(String? value) => setField<String>('emergy_contact', value);

  String? get emergyEmail => getField<String>('emergy_email');
  set emergyEmail(String? value) => setField<String>('emergy_email', value);

  bool? get isSuperAdmin => getField<bool>('is_super_admin');
  set isSuperAdmin(bool? value) => setField<bool>('is_super_admin', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get fmsciLicenseNo => getField<String>('fmsci_license_no');
  set fmsciLicenseNo(String? value) =>
      setField<String>('fmsci_license_no', value);
}
