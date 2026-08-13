import '../database.dart';

class EntryApplicationsTable extends SupabaseTable<EntryApplicationsRow> {
  @override
  String get tableName => 'entry_applications';

  @override
  EntryApplicationsRow createRow(Map<String, dynamic> data) =>
      EntryApplicationsRow(data);
}

class EntryApplicationsRow extends SupabaseDataRow {
  EntryApplicationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EntryApplicationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get driverId => getField<String>('driver_id');
  set driverId(String? value) => setField<String>('driver_id', value);

  String? get fmsciLicenseNumber => getField<String>('fmsci_license_number');
  set fmsciLicenseNumber(String? value) =>
      setField<String>('fmsci_license_number', value);

  String? get teamName => getField<String>('team_name');
  set teamName(String? value) => setField<String>('team_name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  bool? get existingDriver => getField<bool>('existing_driver');
  set existingDriver(bool? value) => setField<bool>('existing_driver', value);

  String? get entryPaymentMode => getField<String>('entry_payment_mode');
  set entryPaymentMode(String? value) =>
      setField<String>('entry_payment_mode', value);

  DateTime? get entryTransDate => getField<DateTime>('entry_trans_date');
  set entryTransDate(DateTime? value) =>
      setField<DateTime>('entry_trans_date', value);

  String? get entryFeeAmount => getField<String>('entry_fee_amount');
  set entryFeeAmount(String? value) =>
      setField<String>('entry_fee_amount', value);

  String? get feeUtr => getField<String>('fee_utr');
  set feeUtr(String? value) => setField<String>('fee_utr', value);

  String? get tyrePaymentMode => getField<String>('tyre_payment_mode');
  set tyrePaymentMode(String? value) =>
      setField<String>('tyre_payment_mode', value);

  DateTime? get tyreDot => getField<DateTime>('tyre_dot');
  set tyreDot(DateTime? value) => setField<DateTime>('tyre_dot', value);

  String? get tyreUtrNumber => getField<String>('tyre_utr_number');
  set tyreUtrNumber(String? value) =>
      setField<String>('tyre_utr_number', value);

  int? get entryNum1 => getField<int>('entry_num1');
  set entryNum1(int? value) => setField<int>('entry_num1', value);

  int? get entryNum2 => getField<int>('entry_num2');
  set entryNum2(int? value) => setField<int>('entry_num2', value);

  DateTime? get registeredAt => getField<DateTime>('registered_at');
  set registeredAt(DateTime? value) =>
      setField<DateTime>('registered_at', value);

  bool? get isSubmitted => getField<bool>('is_submitted');
  set isSubmitted(bool? value) => setField<bool>('is_submitted', value);

  String? get somRemarks => getField<String>('som_remarks');
  set somRemarks(String? value) => setField<String>('som_remarks', value);

  bool? get isCreated => getField<bool>('is_created');
  set isCreated(bool? value) => setField<bool>('is_created', value);

  bool? get isSomApproved => getField<bool>('is_som_approved');
  set isSomApproved(bool? value) => setField<bool>('is_som_approved', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String? get teamManager => getField<String>('teamManager');
  set teamManager(String? value) => setField<String>('teamManager', value);

  String? get teamManagerMobile => getField<String>('teamManagerMobile');
  set teamManagerMobile(String? value) =>
      setField<String>('teamManagerMobile', value);

  String? get teamEmail => getField<String>('team_email');
  set teamEmail(String? value) => setField<String>('team_email', value);

  String? get teamFMSCILicense => getField<String>('team_FMSCI_license');
  set teamFMSCILicense(String? value) =>
      setField<String>('team_FMSCI_license', value);

  bool? get feeVerified => getField<bool>('fee_verified');
  set feeVerified(bool? value) => setField<bool>('fee_verified', value);

  bool? get tyreFeeVerified => getField<bool>('tyre_fee_verified');
  set tyreFeeVerified(bool? value) =>
      setField<bool>('tyre_fee_verified', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);
}
