import '../database.dart';

class ResultPublicationsTable extends SupabaseTable<ResultPublicationsRow> {
  @override
  String get tableName => 'result_publications';

  @override
  ResultPublicationsRow createRow(Map<String, dynamic> data) =>
      ResultPublicationsRow(data);
}

class ResultPublicationsRow extends SupabaseDataRow {
  ResultPublicationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResultPublicationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get raceId => getField<String>('race_id')!;
  set raceId(String value) => setField<String>('race_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get session => getField<String>('session');
  set session(String? value) => setField<String>('session', value);

  String get kind => getField<String>('kind')!;
  set kind(String value) => setField<String>('kind', value);

  int? get version => getField<int>('version');
  set version(int? value) => setField<int>('version', value);

  String get fileUrl => getField<String>('file_url')!;
  set fileUrl(String value) => setField<String>('file_url', value);

  String? get noticeId => getField<String>('notice_id');
  set noticeId(String? value) => setField<String>('notice_id', value);

  DateTime? get publishedAt => getField<DateTime>('published_at');
  set publishedAt(DateTime? value) => setField<DateTime>('published_at', value);

  String? get publishedBy => getField<String>('published_by');
  set publishedBy(String? value) => setField<String>('published_by', value);

  String? get publishedByName => getField<String>('published_by_name');
  set publishedByName(String? value) =>
      setField<String>('published_by_name', value);
}
