import '../database.dart';

class PointsSchemesTable extends SupabaseTable<PointsSchemesRow> {
  @override
  String get tableName => 'points_schemes';

  @override
  PointsSchemesRow createRow(Map<String, dynamic> data) =>
      PointsSchemesRow(data);
}

class PointsSchemesRow extends SupabaseDataRow {
  PointsSchemesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PointsSchemesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get chshipId => getField<String>('chship_id');
  set chshipId(String? value) => setField<String>('chship_id', value);

  String get schemeName => getField<String>('scheme_name')!;
  set schemeName(String value) => setField<String>('scheme_name', value);

  String? get discipline => getField<String>('discipline');
  set discipline(String? value) => setField<String>('discipline', value);

  dynamic get rule => getField<dynamic>('rule')!;
  set rule(dynamic value) => setField<dynamic>('rule', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
