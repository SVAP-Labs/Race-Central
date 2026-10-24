import '../database.dart';

class EventCategoriesTable extends SupabaseTable<EventCategoriesRow> {
  @override
  String get tableName => 'event_categories';

  @override
  EventCategoriesRow createRow(Map<String, dynamic> data) =>
      EventCategoriesRow(data);
}

class EventCategoriesRow extends SupabaseDataRow {
  EventCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventCategoriesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String get categoryName => getField<String>('category_name')!;
  set categoryName(String value) => setField<String>('category_name', value);

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

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get isEventCompleted => getField<bool>('isEventCompleted');
  set isEventCompleted(bool? value) =>
      setField<bool>('isEventCompleted', value);

  int? get categoryOrder => getField<int>('category_order');
  set categoryOrder(int? value) => setField<int>('category_order', value);

  String? get entryFee => getField<String>('entry_fee');
  set entryFee(String? value) => setField<String>('entry_fee', value);

  String? get lateEntryFee => getField<String>('late_entry_fee');
  set lateEntryFee(String? value) => setField<String>('late_entry_fee', value);

  String? get tyreFee => getField<String>('tyre_fee');
  set tyreFee(String? value) => setField<String>('tyre_fee', value);

  String? get pointsSchemeId => getField<String>('points_scheme_id');
  set pointsSchemeId(String? value) =>
      setField<String>('points_scheme_id', value);

  String? get championshipCategoryId =>
      getField<String>('championship_category_id');
  set championshipCategoryId(String? value) =>
      setField<String>('championship_category_id', value);

  bool? get hasRookieCategory => getField<bool>('hasRookieCategory');
  set hasRookieCategory(bool? value) =>
      setField<bool>('hasRookieCategory', value);

  bool? get lotCompNumber => getField<bool>('lot_CompNumber');
  set lotCompNumber(bool? value) => setField<bool>('lot_CompNumber', value);

  bool? get noTeamName => getField<bool>('noTeamName');
  set noTeamName(bool? value) => setField<bool>('noTeamName', value);

  String? get categoryType => getField<String>('category_type');
  set categoryType(String? value) => setField<String>('category_type', value);

  bool? get isTurboAllowed => getField<bool>('isTurboAllowed');
  set isTurboAllowed(bool? value) => setField<bool>('isTurboAllowed', value);
}
