import '../database.dart';

class RegulationDocsTable extends SupabaseTable<RegulationDocsRow> {
  @override
  String get tableName => 'regulation_docs';

  @override
  RegulationDocsRow createRow(Map<String, dynamic> data) =>
      RegulationDocsRow(data);
}

class RegulationDocsRow extends SupabaseDataRow {
  RegulationDocsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RegulationDocsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get championshipId => getField<String>('championship_id')!;
  set championshipId(String value) =>
      setField<String>('championship_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get docType => getField<String>('doc_type');
  set docType(String? value) => setField<String>('doc_type', value);

  String get storagePath => getField<String>('storage_path')!;
  set storagePath(String value) => setField<String>('storage_path', value);

  String? get publicUrl => getField<String>('public_url');
  set publicUrl(String? value) => setField<String>('public_url', value);

  int? get pageCount => getField<int>('page_count');
  set pageCount(int? value) => setField<int>('page_count', value);
}
