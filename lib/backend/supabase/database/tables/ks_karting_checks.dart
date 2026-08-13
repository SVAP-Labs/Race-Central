import '../database.dart';

class KsKartingChecksTable extends SupabaseTable<KsKartingChecksRow> {
  @override
  String get tableName => 'ks_karting_checks';

  @override
  KsKartingChecksRow createRow(Map<String, dynamic> data) =>
      KsKartingChecksRow(data);
}

class KsKartingChecksRow extends SupabaseDataRow {
  KsKartingChecksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KsKartingChecksTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get section => getField<String>('section');
  set section(String? value) => setField<String>('section', value);

  bool? get hasBoolean => getField<bool>('has_boolean');
  set hasBoolean(bool? value) => setField<bool>('has_boolean', value);

  bool? get hasNumeric => getField<bool>('has_numeric');
  set hasNumeric(bool? value) => setField<bool>('has_numeric', value);

  bool? get hasSelect => getField<bool>('has_select');
  set hasSelect(bool? value) => setField<bool>('has_select', value);

  dynamic get options => getField<dynamic>('options');
  set options(dynamic value) => setField<dynamic>('options', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  dynamic get applicableCategories =>
      getField<dynamic>('applicable_categories');
  set applicableCategories(dynamic value) =>
      setField<dynamic>('applicable_categories', value);
}
