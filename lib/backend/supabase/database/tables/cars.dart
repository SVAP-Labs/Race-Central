import '../database.dart';

class CarsTable extends SupabaseTable<CarsRow> {
  @override
  String get tableName => 'cars';

  @override
  CarsRow createRow(Map<String, dynamic> data) => CarsRow(data);
}

class CarsRow extends SupabaseDataRow {
  CarsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get carName => getField<String>('car_name')!;
  set carName(String value) => setField<String>('car_name', value);

  String get homologationNameno => getField<String>('homologation_nameno')!;
  set homologationNameno(String value) =>
      setField<String>('homologation_nameno', value);

  int? get cc => getField<int>('cc');
  set cc(int? value) => setField<int>('cc', value);

  double? get minWeight => getField<double>('min_weight');
  set minWeight(double? value) => setField<double>('min_weight', value);

  double? get minWeightFactor => getField<double>('min_weight_factor');
  set minWeightFactor(double? value) =>
      setField<double>('min_weight_factor', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get homologationNumber => getField<String>('homologationNumber');
  set homologationNumber(String? value) =>
      setField<String>('homologationNumber', value);
}
