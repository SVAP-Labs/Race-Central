import '../database.dart';

class RegulationPagesTable extends SupabaseTable<RegulationPagesRow> {
  @override
  String get tableName => 'regulation_pages';

  @override
  RegulationPagesRow createRow(Map<String, dynamic> data) =>
      RegulationPagesRow(data);
}

class RegulationPagesRow extends SupabaseDataRow {
  RegulationPagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RegulationPagesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get docId => getField<String>('doc_id')!;
  set docId(String value) => setField<String>('doc_id', value);

  String get championshipId => getField<String>('championship_id')!;
  set championshipId(String value) =>
      setField<String>('championship_id', value);

  int get pageNo => getField<int>('page_no')!;
  set pageNo(int value) => setField<int>('page_no', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  String? get tsv => getField<String>('tsv');
  set tsv(String? value) => setField<String>('tsv', value);
}
