import '../database.dart';

class RegistrationDocumentChecksTable
    extends SupabaseTable<RegistrationDocumentChecksRow> {
  @override
  String get tableName => 'registration_document_checks';

  @override
  RegistrationDocumentChecksRow createRow(Map<String, dynamic> data) =>
      RegistrationDocumentChecksRow(data);
}

class RegistrationDocumentChecksRow extends SupabaseDataRow {
  RegistrationDocumentChecksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RegistrationDocumentChecksTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get registrationId => getField<String>('registration_id')!;
  set registrationId(String value) =>
      setField<String>('registration_id', value);

  String get docKind => getField<String>('doc_kind')!;
  set docKind(String value) => setField<String>('doc_kind', value);

  bool? get valid => getField<bool>('valid');
  set valid(bool? value) => setField<bool>('valid', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  String? get checkedBy => getField<String>('checked_by');
  set checkedBy(String? value) => setField<String>('checked_by', value);

  DateTime? get checkedAt => getField<DateTime>('checked_at');
  set checkedAt(DateTime? value) => setField<DateTime>('checked_at', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);
}
