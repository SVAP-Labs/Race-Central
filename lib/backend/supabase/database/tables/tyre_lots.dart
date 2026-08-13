import '../database.dart';

class TyreLotsTable extends SupabaseTable<TyreLotsRow> {
  @override
  String get tableName => 'tyre_lots';

  @override
  TyreLotsRow createRow(Map<String, dynamic> data) => TyreLotsRow(data);
}

class TyreLotsRow extends SupabaseDataRow {
  TyreLotsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TyreLotsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get lotNumber => getField<String>('lot_number')!;
  set lotNumber(String value) => setField<String>('lot_number', value);

  String? get assignedCompNo => getField<String>('assigned_comp_no');
  set assignedCompNo(String? value) =>
      setField<String>('assigned_comp_no', value);

  String? get assignedDriver => getField<String>('assigned_driver');
  set assignedDriver(String? value) =>
      setField<String>('assigned_driver', value);

  DateTime? get assignedAt => getField<DateTime>('assigned_at');
  set assignedAt(DateTime? value) => setField<DateTime>('assigned_at', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);
}
