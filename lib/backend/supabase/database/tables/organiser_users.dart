import '../database.dart';

class OrganiserUsersTable extends SupabaseTable<OrganiserUsersRow> {
  @override
  String get tableName => 'organiser_users';

  @override
  OrganiserUsersRow createRow(Map<String, dynamic> data) =>
      OrganiserUsersRow(data);
}

class OrganiserUsersRow extends SupabaseDataRow {
  OrganiserUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrganiserUsersTable();

  String get appUserId => getField<String>('app_user_id')!;
  set appUserId(String value) => setField<String>('app_user_id', value);

  String get organiserId => getField<String>('organiser_id')!;
  set organiserId(String value) => setField<String>('organiser_id', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
