import '../database.dart';

class RegistrationPaymentsTable extends SupabaseTable<RegistrationPaymentsRow> {
  @override
  String get tableName => 'registration_payments';

  @override
  RegistrationPaymentsRow createRow(Map<String, dynamic> data) =>
      RegistrationPaymentsRow(data);
}

class RegistrationPaymentsRow extends SupabaseDataRow {
  RegistrationPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RegistrationPaymentsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get registrationId => getField<String>('registration_id')!;
  set registrationId(String value) =>
      setField<String>('registration_id', value);

  String? get purpose => getField<String>('purpose');
  set purpose(String? value) => setField<String>('purpose', value);

  String? get mode => getField<String>('mode');
  set mode(String? value) => setField<String>('mode', value);

  String? get amount => getField<String>('amount');
  set amount(String? value) => setField<String>('amount', value);

  String? get referenceField => getField<String>('reference');
  set referenceField(String? value) => setField<String>('reference', value);

  DateTime? get paidAt => getField<DateTime>('paid_at');
  set paidAt(DateTime? value) => setField<DateTime>('paid_at', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  String? get verifiedBy => getField<String>('verified_by');
  set verifiedBy(String? value) => setField<String>('verified_by', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
