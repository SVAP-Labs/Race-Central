import '../database.dart';

class TrackLayoutsTable extends SupabaseTable<TrackLayoutsRow> {
  @override
  String get tableName => 'track_layouts';

  @override
  TrackLayoutsRow createRow(Map<String, dynamic> data) => TrackLayoutsRow(data);
}

class TrackLayoutsRow extends SupabaseDataRow {
  TrackLayoutsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrackLayoutsTable();

  String get trackId => getField<String>('track_id')!;
  set trackId(String value) => setField<String>('track_id', value);

  String get imageBase64 => getField<String>('image_base64')!;
  set imageBase64(String value) => setField<String>('image_base64', value);

  String? get contentType => getField<String>('content_type');
  set contentType(String? value) => setField<String>('content_type', value);

  int? get width => getField<int>('width');
  set width(int? value) => setField<int>('width', value);

  int? get height => getField<int>('height');
  set height(int? value) => setField<int>('height', value);

  dynamic get corners => getField<dynamic>('corners');
  set corners(dynamic value) => setField<dynamic>('corners', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedByName => getField<String>('updated_by_name');
  set updatedByName(String? value) =>
      setField<String>('updated_by_name', value);
}
