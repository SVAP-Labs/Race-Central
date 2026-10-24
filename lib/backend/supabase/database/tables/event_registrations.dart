import '../database.dart';

class EventRegistrationsTable extends SupabaseTable<EventRegistrationsRow> {
  @override
  String get tableName => 'event_registrations';

  @override
  EventRegistrationsRow createRow(Map<String, dynamic> data) =>
      EventRegistrationsRow(data);
}

class EventRegistrationsRow extends SupabaseDataRow {
  EventRegistrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventRegistrationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get driverId => getField<String>('driver_id')!;
  set driverId(String value) => setField<String>('driver_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get entryNumber => getField<int>('entry_number');
  set entryNumber(int? value) => setField<int>('entry_number', value);

  String? get entryNumber2 => getField<String>('entry_number_2');
  set entryNumber2(String? value) => setField<String>('entry_number_2', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  bool? get ageVerified => getField<bool>('age_verified');
  set ageVerified(bool? value) => setField<bool>('age_verified', value);

  String? get paymentAmount => getField<String>('payment_amount');
  set paymentAmount(String? value) => setField<String>('payment_amount', value);

  String? get paymentReference => getField<String>('payment_reference');
  set paymentReference(String? value) =>
      setField<String>('payment_reference', value);

  DateTime? get paidAt => getField<DateTime>('paid_at');
  set paidAt(DateTime? value) => setField<DateTime>('paid_at', value);

  DateTime? get registeredAt => getField<DateTime>('registered_at');
  set registeredAt(DateTime? value) =>
      setField<DateTime>('registered_at', value);

  DateTime? get approvedAt => getField<DateTime>('approved_at');
  set approvedAt(DateTime? value) => setField<DateTime>('approved_at', value);

  String? get approvedBy => getField<String>('approved_by');
  set approvedBy(String? value) => setField<String>('approved_by', value);

  String? get teamName => getField<String>('teamName');
  set teamName(String? value) => setField<String>('teamName', value);

  bool? get isEventCompleted => getField<bool>('isEventCompleted');
  set isEventCompleted(bool? value) =>
      setField<bool>('isEventCompleted', value);

  String? get kartScrutinyId => getField<String>('kartScrutiny_id');
  set kartScrutinyId(String? value) =>
      setField<String>('kartScrutiny_id', value);

  String? get driverScrutinyId => getField<String>('driverScrutiny_id');
  set driverScrutinyId(String? value) =>
      setField<String>('driverScrutiny_id', value);

  bool? get driverOK => getField<bool>('driverOK');
  set driverOK(bool? value) => setField<bool>('driverOK', value);

  bool? get kartOK => getField<bool>('kartOK');
  set kartOK(bool? value) => setField<bool>('kartOK', value);

  bool? get somOK => getField<bool>('somOK');
  set somOK(bool? value) => setField<bool>('somOK', value);

  bool? get isScrutineerOK => getField<bool>('isScrutineerOK');
  set isScrutineerOK(bool? value) => setField<bool>('isScrutineerOK', value);

  String? get fmsciLicenseNumber => getField<String>('fmsci_licenseNumber');
  set fmsciLicenseNumber(String? value) =>
      setField<String>('fmsci_licenseNumber', value);

  String? get paymentMode => getField<String>('payment_mode');
  set paymentMode(String? value) => setField<String>('payment_mode', value);

  String? get somRemarks => getField<String>('som_Remarks');
  set somRemarks(String? value) => setField<String>('som_Remarks', value);

  String? get tyrePaymentMode => getField<String>('tyre_paymentMode');
  set tyrePaymentMode(String? value) =>
      setField<String>('tyre_paymentMode', value);

  DateTime? get tyrePaymentTime => getField<DateTime>('tyre_PaymentTime');
  set tyrePaymentTime(DateTime? value) =>
      setField<DateTime>('tyre_PaymentTime', value);

  String? get typrePaymentUTR => getField<String>('typre_paymentUTR');
  set typrePaymentUTR(String? value) =>
      setField<String>('typre_paymentUTR', value);

  String? get teamManager => getField<String>('teamManager');
  set teamManager(String? value) => setField<String>('teamManager', value);

  String? get teamMangerPhone => getField<String>('teamMangerPhone');
  set teamMangerPhone(String? value) =>
      setField<String>('teamMangerPhone', value);

  String? get teamEmail => getField<String>('team_email');
  set teamEmail(String? value) => setField<String>('team_email', value);

  String? get teamFmsciLicense => getField<String>('team_fmsciLicense');
  set teamFmsciLicense(String? value) =>
      setField<String>('team_fmsciLicense', value);

  bool? get feeVerified => getField<bool>('fee_verified');
  set feeVerified(bool? value) => setField<bool>('fee_verified', value);

  bool? get tyreFeeVerified => getField<bool>('tyre_fee_verified');
  set tyreFeeVerified(bool? value) =>
      setField<bool>('tyre_fee_verified', value);

  String? get applicantCity => getField<String>('applicant_city');
  set applicantCity(String? value) => setField<String>('applicant_city', value);

  String? get championshipId => getField<String>('championship_id');
  set championshipId(String? value) =>
      setField<String>('championship_id', value);

  String? get tyreAmount => getField<String>('tyre_amount');
  set tyreAmount(String? value) => setField<String>('tyre_amount', value);

  String? get attachmentLink => getField<String>('attachmentLink');
  set attachmentLink(String? value) =>
      setField<String>('attachmentLink', value);

  String? get driverRemarks => getField<String>('driverRemarks');
  set driverRemarks(String? value) => setField<String>('driverRemarks', value);

  String? get issuingASN => getField<String>('issuing_ASN');
  set issuingASN(String? value) => setField<String>('issuing_ASN', value);

  String? get entryNumber3 => getField<String>('entry_number_3');
  set entryNumber3(String? value) => setField<String>('entry_number_3', value);

  bool? get isRookie => getField<bool>('isRookie');
  set isRookie(bool? value) => setField<bool>('isRookie', value);

  bool? get isNonVeg => getField<bool>('isNonVeg');
  set isNonVeg(bool? value) => setField<bool>('isNonVeg', value);

  String? get vehicleModel => getField<String>('vehicleModel');
  set vehicleModel(String? value) => setField<String>('vehicleModel', value);

  String? get tyreSize => getField<String>('tyre_size');
  set tyreSize(String? value) => setField<String>('tyre_size', value);

  int? get preferredNumber1 => getField<int>('preferred_number_1');
  set preferredNumber1(int? value) =>
      setField<int>('preferred_number_1', value);

  DateTime? get numberAllocatedAt => getField<DateTime>('number_allocated_at');
  set numberAllocatedAt(DateTime? value) =>
      setField<DateTime>('number_allocated_at', value);

  String? get numberAllocatedBy => getField<String>('number_allocated_by');
  set numberAllocatedBy(String? value) =>
      setField<String>('number_allocated_by', value);

  bool? get dnp => getField<bool>('dnp');
  set dnp(bool? value) => setField<bool>('dnp', value);

  String? get dnpReason => getField<String>('dnp_reason');
  set dnpReason(String? value) => setField<String>('dnp_reason', value);

  DateTime? get dnpAt => getField<DateTime>('dnp_at');
  set dnpAt(DateTime? value) => setField<DateTime>('dnp_at', value);

  String? get dnpBy => getField<String>('dnp_by');
  set dnpBy(String? value) => setField<String>('dnp_by', value);

  bool? get documentationOk => getField<bool>('documentation_ok');
  set documentationOk(bool? value) => setField<bool>('documentation_ok', value);

  DateTime? get documentationAt => getField<DateTime>('documentation_at');
  set documentationAt(DateTime? value) =>
      setField<DateTime>('documentation_at', value);

  String? get documentationBy => getField<String>('documentation_by');
  set documentationBy(String? value) =>
      setField<String>('documentation_by', value);

  bool? get licenceOk => getField<bool>('licence_ok');
  set licenceOk(bool? value) => setField<bool>('licence_ok', value);

  DateTime? get licenceAt => getField<DateTime>('licence_at');
  set licenceAt(DateTime? value) => setField<DateTime>('licence_at', value);

  String? get licenceBy => getField<String>('licence_by');
  set licenceBy(String? value) => setField<String>('licence_by', value);
}
