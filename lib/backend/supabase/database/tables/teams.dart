import '../database.dart';

class TeamsTable extends SupabaseTable<TeamsRow> {
  @override
  String get tableName => 'teams';

  @override
  TeamsRow createRow(Map<String, dynamic> data) => TeamsRow(data);
}

class TeamsRow extends SupabaseDataRow {
  TeamsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeamsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get organiserId => getField<String>('organiser_id')!;
  set organiserId(String value) => setField<String>('organiser_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get licenceNumber => getField<String>('licence_number');
  set licenceNumber(String? value) => setField<String>('licence_number', value);

  String? get manager => getField<String>('manager');
  set manager(String? value) => setField<String>('manager', value);

  String? get managerMobile => getField<String>('manager_mobile');
  set managerMobile(String? value) => setField<String>('manager_mobile', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
