import '../database.dart';

class TyreLotTyresTable extends SupabaseTable<TyreLotTyresRow> {
  @override
  String get tableName => 'tyre_lot_tyres';

  @override
  TyreLotTyresRow createRow(Map<String, dynamic> data) => TyreLotTyresRow(data);
}

class TyreLotTyresRow extends SupabaseDataRow {
  TyreLotTyresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TyreLotTyresTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get lotId => getField<String>('lot_id')!;
  set lotId(String value) => setField<String>('lot_id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get barcode => getField<String>('barcode')!;
  set barcode(String value) => setField<String>('barcode', value);

  int? get position => getField<int>('position');
  set position(int? value) => setField<int>('position', value);

  int? get batchNo => getField<int>('batch_no');
  set batchNo(int? value) => setField<int>('batch_no', value);

  String? get allocation => getField<String>('allocation');
  set allocation(String? value) => setField<String>('allocation', value);
}
