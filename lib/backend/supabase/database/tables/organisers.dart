import '../database.dart';

class OrganisersTable extends SupabaseTable<OrganisersRow> {
  @override
  String get tableName => 'organisers';

  @override
  OrganisersRow createRow(Map<String, dynamic> data) => OrganisersRow(data);
}

class OrganisersRow extends SupabaseDataRow {
  OrganisersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrganisersTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get contactEmail => getField<String>('contact_email');
  set contactEmail(String? value) => setField<String>('contact_email', value);
}
