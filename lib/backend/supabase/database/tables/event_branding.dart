import '../database.dart';

class EventBrandingTable extends SupabaseTable<EventBrandingRow> {
  @override
  String get tableName => 'event_branding';

  @override
  EventBrandingRow createRow(Map<String, dynamic> data) =>
      EventBrandingRow(data);
}

class EventBrandingRow extends SupabaseDataRow {
  EventBrandingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventBrandingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String? get headerTitle => getField<String>('header_title');
  set headerTitle(String? value) => setField<String>('header_title', value);

  String? get headerSubtitle => getField<String>('header_subtitle');
  set headerSubtitle(String? value) =>
      setField<String>('header_subtitle', value);

  String? get headerSponsors => getField<String>('header_sponsors');
  set headerSponsors(String? value) =>
      setField<String>('header_sponsors', value);

  String? get headerColor => getField<String>('header_color');
  set headerColor(String? value) => setField<String>('header_color', value);

  bool? get showLogo => getField<bool>('show_logo');
  set showLogo(bool? value) => setField<bool>('show_logo', value);

  bool? get showSponsors => getField<bool>('show_sponsors');
  set showSponsors(bool? value) => setField<bool>('show_sponsors', value);

  String? get footerText => getField<String>('footer_text');
  set footerText(String? value) => setField<String>('footer_text', value);

  String? get footerColor => getField<String>('footer_color');
  set footerColor(String? value) => setField<String>('footer_color', value);

  bool? get showSocial => getField<bool>('show_social');
  set showSocial(bool? value) => setField<bool>('show_social', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
