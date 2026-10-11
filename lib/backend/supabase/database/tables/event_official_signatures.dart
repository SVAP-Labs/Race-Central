import '../database.dart';

class EventOfficialSignaturesTable
    extends SupabaseTable<EventOfficialSignaturesRow> {
  @override
  String get tableName => 'event_official_signatures';

  @override
  EventOfficialSignaturesRow createRow(Map<String, dynamic> data) =>
      EventOfficialSignaturesRow(data);
}

class EventOfficialSignaturesRow extends SupabaseDataRow {
  EventOfficialSignaturesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventOfficialSignaturesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  String get imageBase64 => getField<String>('image_base64')!;
  set imageBase64(String value) => setField<String>('image_base64', value);

  String? get contentType => getField<String>('content_type');
  set contentType(String? value) => setField<String>('content_type', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
