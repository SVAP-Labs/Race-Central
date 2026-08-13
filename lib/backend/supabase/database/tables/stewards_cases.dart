import '../database.dart';

class StewardsCasesTable extends SupabaseTable<StewardsCasesRow> {
  @override
  String get tableName => 'stewards_cases';

  @override
  StewardsCasesRow createRow(Map<String, dynamic> data) =>
      StewardsCasesRow(data);
}

class StewardsCasesRow extends SupabaseDataRow {
  StewardsCasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StewardsCasesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get caseNumber => getField<String>('case_number');
  set caseNumber(String? value) => setField<String>('case_number', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get championshipId => getField<String>('championship_id');
  set championshipId(String? value) =>
      setField<String>('championship_id', value);

  String? get incidentId => getField<String>('incident_id');
  set incidentId(String? value) => setField<String>('incident_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get session => getField<String>('session');
  set session(String? value) => setField<String>('session', value);

  String? get compNo => getField<String>('comp_no');
  set compNo(String? value) => setField<String>('comp_no', value);

  String? get turn => getField<String>('turn');
  set turn(String? value) => setField<String>('turn', value);

  String? get incident => getField<String>('incident');
  set incident(String? value) => setField<String>('incident', value);

  String? get camNo => getField<String>('cam_no');
  set camNo(String? value) => setField<String>('cam_no', value);

  String? get notedTs => getField<String>('noted_ts');
  set notedTs(String? value) => setField<String>('noted_ts', value);

  String? get actualTs => getField<String>('actual_ts');
  set actualTs(String? value) => setField<String>('actual_ts', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get penalty => getField<String>('penalty');
  set penalty(String? value) => setField<String>('penalty', value);

  String? get penaltyValue => getField<String>('penalty_value');
  set penaltyValue(String? value) => setField<String>('penalty_value', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  String? get outcome => getField<String>('outcome');
  set outcome(String? value) => setField<String>('outcome', value);

  String? get decidedBy => getField<String>('decided_by');
  set decidedBy(String? value) => setField<String>('decided_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
