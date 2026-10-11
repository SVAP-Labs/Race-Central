import '../database.dart';

class ChampionshipTeamsTable extends SupabaseTable<ChampionshipTeamsRow> {
  @override
  String get tableName => 'championship_teams';

  @override
  ChampionshipTeamsRow createRow(Map<String, dynamic> data) =>
      ChampionshipTeamsRow(data);
}

class ChampionshipTeamsRow extends SupabaseDataRow {
  ChampionshipTeamsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChampionshipTeamsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get chshipId => getField<String>('chship_id')!;
  set chshipId(String value) => setField<String>('chship_id', value);

  String get championshipCategoryId =>
      getField<String>('championship_category_id')!;
  set championshipCategoryId(String value) =>
      setField<String>('championship_category_id', value);

  String get teamName => getField<String>('team_name')!;
  set teamName(String value) => setField<String>('team_name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get teamFmsciLicenseNumber =>
      getField<String>('team_fmsciLicenseNumber');
  set teamFmsciLicenseNumber(String? value) =>
      setField<String>('team_fmsciLicenseNumber', value);

  String? get teamManager => getField<String>('teamManager');
  set teamManager(String? value) => setField<String>('teamManager', value);

  String? get teamManagerMobile => getField<String>('teamManagerMobile');
  set teamManagerMobile(String? value) =>
      setField<String>('teamManagerMobile', value);

  String? get teamEmail => getField<String>('team_email');
  set teamEmail(String? value) => setField<String>('team_email', value);

  String? get teamId => getField<String>('team_id');
  set teamId(String? value) => setField<String>('team_id', value);
}
