import '../database.dart';

class EventNoticeboardTable extends SupabaseTable<EventNoticeboardRow> {
  @override
  String get tableName => 'event_noticeboard';

  @override
  EventNoticeboardRow createRow(Map<String, dynamic> data) =>
      EventNoticeboardRow(data);
}

class EventNoticeboardRow extends SupabaseDataRow {
  EventNoticeboardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventNoticeboardTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get noticeTitle => getField<String>('notice_title');
  set noticeTitle(String? value) => setField<String>('notice_title', value);

  String? get noticeDescription => getField<String>('notice_description');
  set noticeDescription(String? value) =>
      setField<String>('notice_description', value);

  bool? get noticeSeverity => getField<bool>('notice_severity');
  set noticeSeverity(bool? value) => setField<bool>('notice_severity', value);

  DateTime? get publishedAt => getField<DateTime>('published_at');
  set publishedAt(DateTime? value) => setField<DateTime>('published_at', value);

  String? get fileType => getField<String>('file_type');
  set fileType(String? value) => setField<String>('file_type', value);

  String? get fileUrl => getField<String>('file_url');
  set fileUrl(String? value) => setField<String>('file_url', value);

  int? get noticeOrder => getField<int>('notice_order');
  set noticeOrder(int? value) => setField<int>('notice_order', value);
}
