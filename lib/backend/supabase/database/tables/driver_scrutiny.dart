import '../database.dart';

class DriverScrutinyTable extends SupabaseTable<DriverScrutinyRow> {
  @override
  String get tableName => 'driver_scrutiny';

  @override
  DriverScrutinyRow createRow(Map<String, dynamic> data) =>
      DriverScrutinyRow(data);
}

class DriverScrutinyRow extends SupabaseDataRow {
  DriverScrutinyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriverScrutinyTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get registrationId => getField<String>('registration_id')!;
  set registrationId(String value) =>
      setField<String>('registration_id', value);

  String? get helmetStandard => getField<String>('helmet_standard');
  set helmetStandard(String? value) =>
      setField<String>('helmet_standard', value);

  String? get helmetSerialNumber => getField<String>('helmet_serial_number');
  set helmetSerialNumber(String? value) =>
      setField<String>('helmet_serial_number', value);

  String? get overallsStandard => getField<String>('overalls_standard');
  set overallsStandard(String? value) =>
      setField<String>('overalls_standard', value);

  String? get overallsSerialNumber =>
      getField<String>('overalls_serial_number');
  set overallsSerialNumber(String? value) =>
      setField<String>('overalls_serial_number', value);

  String? get glovesStandard => getField<String>('gloves_standard');
  set glovesStandard(String? value) =>
      setField<String>('gloves_standard', value);

  String? get glovesSerialNumber => getField<String>('gloves_serial_number');
  set glovesSerialNumber(String? value) =>
      setField<String>('gloves_serial_number', value);

  String? get shoesStandard => getField<String>('shoes_standard');
  set shoesStandard(String? value) => setField<String>('shoes_standard', value);

  String? get shoesSerialNumber => getField<String>('shoes_serial_number');
  set shoesSerialNumber(String? value) =>
      setField<String>('shoes_serial_number', value);

  String? get bodyProtectionStandard =>
      getField<String>('body_protection_standard');
  set bodyProtectionStandard(String? value) =>
      setField<String>('body_protection_standard', value);

  String? get bodyProtectionSerialNumber =>
      getField<String>('body_protection_serial_number');
  set bodyProtectionSerialNumber(String? value) =>
      setField<String>('body_protection_serial_number', value);

  bool? get passed => getField<bool>('passed');
  set passed(bool? value) => setField<bool>('passed', value);

  String? get remarks => getField<String>('remarks');
  set remarks(String? value) => setField<String>('remarks', value);

  DateTime? get scrutinisedAt => getField<DateTime>('scrutinised_at');
  set scrutinisedAt(DateTime? value) =>
      setField<DateTime>('scrutinised_at', value);

  String? get scrutinisedBy => getField<String>('scrutinised_by');
  set scrutinisedBy(String? value) => setField<String>('scrutinised_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get driverSignature => getField<String>('driverSignature');
  set driverSignature(String? value) =>
      setField<String>('driverSignature', value);

  bool? get isSubmited => getField<bool>('isSubmited');
  set isSubmited(bool? value) => setField<bool>('isSubmited', value);

  bool? get isHelmetChecked => getField<bool>('isHelmetChecked');
  set isHelmetChecked(bool? value) => setField<bool>('isHelmetChecked', value);

  bool? get isOverallsChecked => getField<bool>('isOverallsChecked');
  set isOverallsChecked(bool? value) =>
      setField<bool>('isOverallsChecked', value);

  bool? get isGlovesChecked => getField<bool>('isGlovesChecked');
  set isGlovesChecked(bool? value) => setField<bool>('isGlovesChecked', value);

  bool? get isShoesChecked => getField<bool>('isShoesChecked');
  set isShoesChecked(bool? value) => setField<bool>('isShoesChecked', value);

  bool? get isBodyProtChecked => getField<bool>('isBodyProtChecked');
  set isBodyProtChecked(bool? value) =>
      setField<bool>('isBodyProtChecked', value);
}
