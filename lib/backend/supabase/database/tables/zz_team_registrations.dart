import '../database.dart';

class ZzTeamRegistrationsTable extends SupabaseTable<ZzTeamRegistrationsRow> {
  @override
  String get tableName => 'zz_team_registrations';

  @override
  ZzTeamRegistrationsRow createRow(Map<String, dynamic> data) =>
      ZzTeamRegistrationsRow(data);
}

class ZzTeamRegistrationsRow extends SupabaseDataRow {
  ZzTeamRegistrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ZzTeamRegistrationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get teamName => getField<String>('team_name')!;
  set teamName(String value) => setField<String>('team_name', value);

  String? get fmsciLicense => getField<String>('fmsci_license');
  set fmsciLicense(String? value) => setField<String>('fmsci_license', value);

  String? get principalName => getField<String>('principal_name');
  set principalName(String? value) => setField<String>('principal_name', value);

  String? get principalEmail => getField<String>('principal_email');
  set principalEmail(String? value) =>
      setField<String>('principal_email', value);

  String? get principalPhone => getField<String>('principal_phone');
  set principalPhone(String? value) =>
      setField<String>('principal_phone', value);

  String? get managerName => getField<String>('manager_name');
  set managerName(String? value) => setField<String>('manager_name', value);

  String? get managerEmail => getField<String>('manager_email');
  set managerEmail(String? value) => setField<String>('manager_email', value);

  String? get managerPhone => getField<String>('manager_phone');
  set managerPhone(String? value) => setField<String>('manager_phone', value);

  bool? get micro => getField<bool>('micro');
  set micro(bool? value) => setField<bool>('micro', value);

  bool? get mini => getField<bool>('mini');
  set mini(bool? value) => setField<bool>('mini', value);

  bool? get junior => getField<bool>('junior');
  set junior(bool? value) => setField<bool>('junior', value);

  bool? get senior => getField<bool>('senior');
  set senior(bool? value) => setField<bool>('senior', value);

  String? get paymentMode => getField<String>('payment_mode');
  set paymentMode(String? value) => setField<String>('payment_mode', value);

  DateTime? get dateOfTransaction => getField<DateTime>('date_of_transaction');
  set dateOfTransaction(DateTime? value) =>
      setField<DateTime>('date_of_transaction', value);

  String? get amountPaid => getField<String>('amount_paid');
  set amountPaid(String? value) => setField<String>('amount_paid', value);

  String? get utrReference => getField<String>('utr_reference');
  set utrReference(String? value) => setField<String>('utr_reference', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
