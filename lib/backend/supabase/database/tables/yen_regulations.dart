import '../database.dart';

class YenRegulationsTable extends SupabaseTable<YenRegulationsRow> {
  @override
  String get tableName => 'yen_regulations';

  @override
  YenRegulationsRow createRow(Map<String, dynamic> data) =>
      YenRegulationsRow(data);
}

class YenRegulationsRow extends SupabaseDataRow {
  YenRegulationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => YenRegulationsTable();

  String? get chshipRefId => getField<String>('chship_ref_id');
  set chshipRefId(String? value) => setField<String>('chship_ref_id', value);

  String? get docuTitle => getField<String>('docu_title');
  set docuTitle(String? value) => setField<String>('docu_title', value);

  String? get decuLink => getField<String>('decu_link');
  set decuLink(String? value) => setField<String>('decu_link', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get docuOrder => getField<int>('docu_order');
  set docuOrder(int? value) => setField<int>('docu_order', value);

  String? get rowId => getField<String>('row_id');
  set rowId(String? value) => setField<String>('row_id', value);
}
