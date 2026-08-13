import '../database.dart';

class RaceControlTable extends SupabaseTable<RaceControlRow> {
  @override
  String get tableName => 'race_control';

  @override
  RaceControlRow createRow(Map<String, dynamic> data) => RaceControlRow(data);
}

class RaceControlRow extends SupabaseDataRow {
  RaceControlRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceControlTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

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

  String get turn => getField<String>('turn')!;
  set turn(String value) => setField<String>('turn', value);

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

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
