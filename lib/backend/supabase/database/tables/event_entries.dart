import '../database.dart';

class EventEntriesTable extends SupabaseTable<EventEntriesRow> {
  @override
  String get tableName => 'event_entries';

  @override
  EventEntriesRow createRow(Map<String, dynamic> data) => EventEntriesRow(data);
}

class EventEntriesRow extends SupabaseDataRow {
  EventEntriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventEntriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);

  int get entryNumber => getField<int>('entry_number')!;
  set entryNumber(int value) => setField<int>('entry_number', value);

  String get driverName => getField<String>('driver_name')!;
  set driverName(String value) => setField<String>('driver_name', value);

  String? get teamName => getField<String>('team_name');
  set teamName(String? value) => setField<String>('team_name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
