import '../database.dart';

class RaceScheduleTable extends SupabaseTable<RaceScheduleRow> {
  @override
  String get tableName => 'race_schedule';

  @override
  RaceScheduleRow createRow(Map<String, dynamic> data) => RaceScheduleRow(data);
}

class RaceScheduleRow extends SupabaseDataRow {
  RaceScheduleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceScheduleTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get eventUid => getField<String>('event_uid')!;
  set eventUid(String value) => setField<String>('event_uid', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String get sessionName => getField<String>('session_name')!;
  set sessionName(String value) => setField<String>('session_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get raceDate => getField<DateTime>('race_date')!;
  set raceDate(DateTime value) => setField<DateTime>('race_date', value);

  PostgresTime get scheduledStart => getField<PostgresTime>('scheduled_start')!;
  set scheduledStart(PostgresTime value) =>
      setField<PostgresTime>('scheduled_start', value);

  PostgresTime? get scheduledEnd => getField<PostgresTime>('scheduled_end');
  set scheduledEnd(PostgresTime? value) =>
      setField<PostgresTime>('scheduled_end', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get categoryName => getField<String>('categoryName');
  set categoryName(String? value) => setField<String>('categoryName', value);

  String? get raceId => getField<String>('race_id');
  set raceId(String? value) => setField<String>('race_id', value);

  String? get kind => getField<String>('kind');
  set kind(String? value) => setField<String>('kind', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);
}
