import '../database.dart';

class EngineSealsTable extends SupabaseTable<EngineSealsRow> {
  @override
  String get tableName => 'engine_seals';

  @override
  EngineSealsRow createRow(Map<String, dynamic> data) => EngineSealsRow(data);
}

class EngineSealsRow extends SupabaseDataRow {
  EngineSealsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EngineSealsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get compNo => getField<String>('comp_no')!;
  set compNo(String value) => setField<String>('comp_no', value);

  String? get driverName => getField<String>('driver_name');
  set driverName(String? value) => setField<String>('driver_name', value);

  String get sealNo => getField<String>('seal_no')!;
  set sealNo(String value) => setField<String>('seal_no', value);

  int? get position => getField<int>('position');
  set position(int? value) => setField<int>('position', value);
}
