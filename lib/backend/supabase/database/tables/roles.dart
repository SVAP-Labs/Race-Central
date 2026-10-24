import '../database.dart';

class RolesTable extends SupabaseTable<RolesRow> {
  @override
  String get tableName => 'roles';

  @override
  RolesRow createRow(Map<String, dynamic> data) => RolesRow(data);
}

class RolesRow extends SupabaseDataRow {
  RolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RolesTable();

  String get key => getField<String>('key')!;
  set key(String value) => setField<String>('key', value);

  String get label => getField<String>('label')!;
  set label(String value) => setField<String>('label', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get permissions => getListField<String>('permissions');
  set permissions(List<String>? value) =>
      setListField<String>('permissions', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get assignable => getField<bool>('assignable');
  set assignable(bool? value) => setField<bool>('assignable', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
