import '../database.dart';

class KsKartingChecksDataTable extends SupabaseTable<KsKartingChecksDataRow> {
  @override
  String get tableName => 'ks_karting_checks_data';

  @override
  KsKartingChecksDataRow createRow(Map<String, dynamic> data) =>
      KsKartingChecksDataRow(data);
}

class KsKartingChecksDataRow extends SupabaseDataRow {
  KsKartingChecksDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KsKartingChecksDataTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get sealingId => getField<String>('sealing_id');
  set sealingId(String? value) => setField<String>('sealing_id', value);

  bool? get booleanValue => getField<bool>('boolean_value');
  set booleanValue(bool? value) => setField<bool>('boolean_value', value);

  double? get numericValue => getField<double>('numeric_value');
  set numericValue(double? value) => setField<double>('numeric_value', value);

  String? get selectedOptions => getField<String>('selected_options');
  set selectedOptions(String? value) =>
      setField<String>('selected_options', value);

  String? get remarks => getField<String>('remarks');
  set remarks(String? value) => setField<String>('remarks', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get itemCode => getField<String>('item_code')!;
  set itemCode(String value) => setField<String>('item_code', value);
}
