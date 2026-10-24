import '../database.dart';

class ChampionshipCategoryCarsTable
    extends SupabaseTable<ChampionshipCategoryCarsRow> {
  @override
  String get tableName => 'championship_category_cars';

  @override
  ChampionshipCategoryCarsRow createRow(Map<String, dynamic> data) =>
      ChampionshipCategoryCarsRow(data);
}

class ChampionshipCategoryCarsRow extends SupabaseDataRow {
  ChampionshipCategoryCarsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChampionshipCategoryCarsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get categoryId => getField<String>('category_id')!;
  set categoryId(String value) => setField<String>('category_id', value);

  String get carId => getField<String>('car_id')!;
  set carId(String value) => setField<String>('car_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
