import '../database.dart';

class RaceCasesTable extends SupabaseTable<RaceCasesRow> {
  @override
  String get tableName => 'race_cases';

  @override
  RaceCasesRow createRow(Map<String, dynamic> data) => RaceCasesRow(data);
}

class RaceCasesRow extends SupabaseDataRow {
  RaceCasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceCasesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get turnNo => getField<String>('turn_no');
  set turnNo(String? value) => setField<String>('turn_no', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get caseNumber => getField<String>('case_number');
  set caseNumber(String? value) => setField<String>('case_number', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get championshipId => getField<String>('championship_id');
  set championshipId(String? value) =>
      setField<String>('championship_id', value);

  int? get incidentId => getField<int>('incident_id');
  set incidentId(int? value) => setField<int>('incident_id', value);

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

  String? get driverName => getField<String>('driver_name');
  set driverName(String? value) => setField<String>('driver_name', value);

  String? get circuit => getField<String>('circuit');
  set circuit(String? value) => setField<String>('circuit', value);

  String? get docDate => getField<String>('doc_date');
  set docDate(String? value) => setField<String>('doc_date', value);

  String? get incidentTime => getField<String>('incident_time');
  set incidentTime(String? value) => setField<String>('incident_time', value);

  int? get summonsSeq => getField<int>('summons_seq');
  set summonsSeq(int? value) => setField<int>('summons_seq', value);

  int? get infringementSeq => getField<int>('infringement_seq');
  set infringementSeq(int? value) => setField<int>('infringement_seq', value);

  String? get summonsTime => getField<String>('summons_time');
  set summonsTime(String? value) => setField<String>('summons_time', value);

  String? get infringementTime => getField<String>('infringement_time');
  set infringementTime(String? value) =>
      setField<String>('infringement_time', value);

  String? get coc => getField<String>('coc');
  set coc(String? value) => setField<String>('coc', value);

  String? get chiefSteward => getField<String>('chief_steward');
  set chiefSteward(String? value) => setField<String>('chief_steward', value);

  String? get secondSteward => getField<String>('second_steward');
  set secondSteward(String? value) => setField<String>('second_steward', value);

  String? get clubSteward => getField<String>('club_steward');
  set clubSteward(String? value) => setField<String>('club_steward', value);

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

  bool? get penaltyApplied => getField<bool>('penalty_applied');
  set penaltyApplied(bool? value) => setField<bool>('penalty_applied', value);

  String? get penaltyAppliedByName =>
      getField<String>('penalty_applied_by_name');
  set penaltyAppliedByName(String? value) =>
      setField<String>('penalty_applied_by_name', value);

  DateTime? get penaltyAppliedAt => getField<DateTime>('penalty_applied_at');
  set penaltyAppliedAt(DateTime? value) =>
      setField<DateTime>('penalty_applied_at', value);
}
