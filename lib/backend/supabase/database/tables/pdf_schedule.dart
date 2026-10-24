import '../database.dart';

class PdfScheduleTable extends SupabaseTable<PdfScheduleRow> {
  @override
  String get tableName => 'pdf_schedule';

  @override
  PdfScheduleRow createRow(Map<String, dynamic> data) => PdfScheduleRow(data);
}

class PdfScheduleRow extends SupabaseDataRow {
  PdfScheduleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PdfScheduleTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get eventID => getField<String>('eventID');
  set eventID(String? value) => setField<String>('eventID', value);

  DateTime? get eventDate => getField<DateTime>('eventDate');
  set eventDate(DateTime? value) => setField<DateTime>('eventDate', value);

  String? get scheduleLink => getField<String>('schedule_link');
  set scheduleLink(String? value) => setField<String>('schedule_link', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);

  bool? get isPublished => getField<bool>('isPublished');
  set isPublished(bool? value) => setField<bool>('isPublished', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get kind => getField<String>('kind');
  set kind(String? value) => setField<String>('kind', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
