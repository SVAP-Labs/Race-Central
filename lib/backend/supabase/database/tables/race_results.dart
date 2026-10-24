import '../database.dart';

class RaceResultsTable extends SupabaseTable<RaceResultsRow> {
  @override
  String get tableName => 'race_results';

  @override
  RaceResultsRow createRow(Map<String, dynamic> data) => RaceResultsRow(data);
}

class RaceResultsRow extends SupabaseDataRow {
  RaceResultsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RaceResultsTable();

  String? get resultId => getField<String>('result_id');
  set resultId(String? value) => setField<String>('result_id', value);

  String get raceId => getField<String>('race_id')!;
  set raceId(String value) => setField<String>('race_id', value);

  String? get registrationId => getField<String>('registration_id');
  set registrationId(String? value) =>
      setField<String>('registration_id', value);

  int? get entryNumber => getField<int>('entry_number');
  set entryNumber(int? value) => setField<int>('entry_number', value);

  int? get startPosition => getField<int>('start_position');
  set startPosition(int? value) => setField<int>('start_position', value);

  int? get finishPosition => getField<int>('finish_position');
  set finishPosition(int? value) => setField<int>('finish_position', value);

  double? get points => getField<double>('points');
  set points(double? value) => setField<double>('points', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get bestLap => getField<String>('best_lap');
  set bestLap(String? value) => setField<String>('best_lap', value);

  String? get totalTime => getField<String>('total_time');
  set totalTime(String? value) => setField<String>('total_time', value);

  int? get lapsCompleted => getField<int>('laps_completed');
  set lapsCompleted(int? value) => setField<int>('laps_completed', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get driverName => getField<String>('driver_name');
  set driverName(String? value) => setField<String>('driver_name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get race => getField<String>('race');
  set race(String? value) => setField<String>('race', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  double? get measuredWeight => getField<double>('measuredWeight');
  set measuredWeight(double? value) =>
      setField<double>('measuredWeight', value);

  double? get minimumWeight => getField<double>('minimumWeight');
  set minimumWeight(double? value) => setField<double>('minimumWeight', value);
}
