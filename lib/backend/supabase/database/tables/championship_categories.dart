import '../database.dart';

class ChampionshipCategoriesTable
    extends SupabaseTable<ChampionshipCategoriesRow> {
  @override
  String get tableName => 'championship_categories';

  @override
  ChampionshipCategoriesRow createRow(Map<String, dynamic> data) =>
      ChampionshipCategoriesRow(data);
}

class ChampionshipCategoriesRow extends SupabaseDataRow {
  ChampionshipCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChampionshipCategoriesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get chshipId => getField<String>('chship_id')!;
  set chshipId(String value) => setField<String>('chship_id', value);

  String get categoryName => getField<String>('category_name')!;
  set categoryName(String value) => setField<String>('category_name', value);

  int? get categoryOrder => getField<int>('category_order');
  set categoryOrder(int? value) => setField<int>('category_order', value);

  String? get pointsSchemeId => getField<String>('points_scheme_id');
  set pointsSchemeId(String? value) =>
      setField<String>('points_scheme_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get minAge => getField<int>('min_age');
  set minAge(int? value) => setField<int>('min_age', value);

  int? get maxAge => getField<int>('max_age');
  set maxAge(int? value) => setField<int>('max_age', value);

  double? get minWeight => getField<double>('min_weight');
  set minWeight(double? value) => setField<double>('min_weight', value);

  double? get maxWeight => getField<double>('max_weight');
  set maxWeight(double? value) => setField<double>('max_weight', value);

  int? get startNumberMin => getField<int>('start_number_min');
  set startNumberMin(int? value) => setField<int>('start_number_min', value);

  int? get startNumberMax => getField<int>('start_number_max');
  set startNumberMax(int? value) => setField<int>('start_number_max', value);

  String? get entryFee => getField<String>('entry_fee');
  set entryFee(String? value) => setField<String>('entry_fee', value);

  String? get lateEntryFee => getField<String>('late_entry_fee');
  set lateEntryFee(String? value) => setField<String>('late_entry_fee', value);

  String? get tyreFee => getField<String>('tyre_fee');
  set tyreFee(String? value) => setField<String>('tyre_fee', value);

  bool? get hasRookieCategory => getField<bool>('has_rookie_category');
  set hasRookieCategory(bool? value) =>
      setField<bool>('has_rookie_category', value);

  bool? get lotCompNumber => getField<bool>('lot_comp_number');
  set lotCompNumber(bool? value) => setField<bool>('lot_comp_number', value);

  String? get categoryType => getField<String>('category_type');
  set categoryType(String? value) => setField<String>('category_type', value);
}
