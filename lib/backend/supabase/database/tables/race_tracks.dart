import '../database.dart';

class RaceTracksTable extends SupabaseTable<RaceTracksRow> {
  @override
  String get tableName => 'race_tracks';

  @override
  RaceTracksRow createRow(Map<String, dynamic> data) => RaceTracksRow(data);
}

class RaceTracksRow extends SupabaseDataRow {
  RaceTracksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceTracksTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get trackName => getField<String>('track_name');
  set trackName(String? value) => setField<String>('track_name', value);

  String? get trackLocation => getField<String>('track_location');
  set trackLocation(String? value) => setField<String>('track_location', value);

  String? get trackLength => getField<String>('track_length');
  set trackLength(String? value) => setField<String>('track_length', value);

  String? get trackImage => getField<String>('track_Image');
  set trackImage(String? value) => setField<String>('track_Image', value);

  String? get trackDescription => getField<String>('track_description');
  set trackDescription(String? value) =>
      setField<String>('track_description', value);

  int? get trackCorners => getField<int>('track_corners');
  set trackCorners(int? value) => setField<int>('track_corners', value);

  String? get cornerDescription => getField<String>('corner_description');
  set cornerDescription(String? value) =>
      setField<String>('corner_description', value);

  String? get poleDirection => getField<String>('pole_direction');
  set poleDirection(String? value) => setField<String>('pole_direction', value);
}
