import '../database.dart';

class RaceChampionshipTable extends SupabaseTable<RaceChampionshipRow> {
  @override
  String get tableName => 'race_championship';

  @override
  RaceChampionshipRow createRow(Map<String, dynamic> data) =>
      RaceChampionshipRow(data);
}

class RaceChampionshipRow extends SupabaseDataRow {
  RaceChampionshipRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceChampionshipTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get chshipName => getField<String>('chship_name');
  set chshipName(String? value) => setField<String>('chship_name', value);

  String? get chshipYear => getField<String>('chship_year');
  set chshipYear(String? value) => setField<String>('chship_year', value);

  String? get chshipOrganiser => getField<String>('chship_organiser');
  set chshipOrganiser(String? value) =>
      setField<String>('chship_organiser', value);

  String? get chshipId => getField<String>('chship_id');
  set chshipId(String? value) => setField<String>('chship_id', value);

  dynamic get scoringConfig => getField<dynamic>('scoring_config');
  set scoringConfig(dynamic value) =>
      setField<dynamic>('scoring_config', value);

  String? get orgCode => getField<String>('org_code');
  set orgCode(String? value) => setField<String>('org_code', value);
}
