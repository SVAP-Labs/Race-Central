import '../database.dart';

class RaceLogsTable extends SupabaseTable<RaceLogsRow> {
  @override
  String get tableName => 'race_logs';

  @override
  RaceLogsRow createRow(Map<String, dynamic> data) => RaceLogsRow(data);
}

class RaceLogsRow extends SupabaseDataRow {
  RaceLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceLogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String? get championshipId => getField<String>('championship_id');
  set championshipId(String? value) =>
      setField<String>('championship_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get session => getField<String>('session');
  set session(String? value) => setField<String>('session', value);

  String get place => getField<String>('place')!;
  set place(String value) => setField<String>('place', value);

  String? get compNo => getField<String>('comp_no');
  set compNo(String? value) => setField<String>('comp_no', value);

  String? get incident => getField<String>('incident');
  set incident(String? value) => setField<String>('incident', value);

  String? get camNo => getField<String>('cam_no');
  set camNo(String? value) => setField<String>('cam_no', value);

  String? get notedTs => getField<String>('noted_ts');
  set notedTs(String? value) => setField<String>('noted_ts', value);

  String? get actualTs => getField<String>('actual_ts');
  set actualTs(String? value) => setField<String>('actual_ts', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get createdByName => getField<String>('created_by_name');
  set createdByName(String? value) =>
      setField<String>('created_by_name', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  String? get updatedByName => getField<String>('updated_by_name');
  set updatedByName(String? value) =>
      setField<String>('updated_by_name', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get sentIncidentId => getField<int>('sent_incident_id');
  set sentIncidentId(int? value) => setField<int>('sent_incident_id', value);

  dynamic get occurrences => getField<dynamic>('occurrences');
  set occurrences(dynamic value) => setField<dynamic>('occurrences', value);
}
