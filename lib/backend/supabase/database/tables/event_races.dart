import '../database.dart';

class EventRacesTable extends SupabaseTable<EventRacesRow> {
  @override
  String get tableName => 'event_races';

  @override
  EventRacesRow createRow(Map<String, dynamic> data) => EventRacesRow(data);
}

class EventRacesRow extends SupabaseDataRow {
  EventRacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventRacesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get categoryId => getField<String>('category_id')!;
  set categoryId(String value) => setField<String>('category_id', value);

  String get raceName => getField<String>('race_name')!;
  set raceName(String value) => setField<String>('race_name', value);

  String get raceType => getField<String>('race_type')!;
  set raceType(String value) => setField<String>('race_type', value);

  int? get raceOrder => getField<int>('race_order');
  set raceOrder(int? value) => setField<int>('race_order', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get scheduledAt => getField<DateTime>('scheduled_at');
  set scheduledAt(DateTime? value) => setField<DateTime>('scheduled_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get pointsSchemeId => getField<String>('points_scheme_id');
  set pointsSchemeId(String? value) =>
      setField<String>('points_scheme_id', value);
}
