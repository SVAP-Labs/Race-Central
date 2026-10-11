import '../database.dart';

class EventLogosTable extends SupabaseTable<EventLogosRow> {
  @override
  String get tableName => 'event_logos';

  @override
  EventLogosRow createRow(Map<String, dynamic> data) => EventLogosRow(data);
}

class EventLogosRow extends SupabaseDataRow {
  EventLogosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventLogosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get slot => getField<String>('slot')!;
  set slot(String value) => setField<String>('slot', value);

  String get imageBase64 => getField<String>('image_base64')!;
  set imageBase64(String value) => setField<String>('image_base64', value);

  String? get contentType => getField<String>('content_type');
  set contentType(String? value) => setField<String>('content_type', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
