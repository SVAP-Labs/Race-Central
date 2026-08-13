import '../database.dart';

class RaceIncidentsTable extends SupabaseTable<RaceIncidentsRow> {
  @override
  String get tableName => 'race_incidents';

  @override
  RaceIncidentsRow createRow(Map<String, dynamic> data) =>
      RaceIncidentsRow(data);
}

class RaceIncidentsRow extends SupabaseDataRow {
  RaceIncidentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceIncidentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get turnNo => getField<String>('turn_no');
  set turnNo(String? value) => setField<String>('turn_no', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get championshipId => getField<String>('championship_id');
  set championshipId(String? value) =>
      setField<String>('championship_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get session => getField<String>('session');
  set session(String? value) => setField<String>('session', value);

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

  bool? get forwarded => getField<bool>('forwarded');
  set forwarded(bool? value) => setField<bool>('forwarded', value);

  String? get caseNumber => getField<String>('case_number');
  set caseNumber(String? value) => setField<String>('case_number', value);

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

  String? get forwardDecision => getField<String>('forward_decision');
  set forwardDecision(String? value) =>
      setField<String>('forward_decision', value);
}
