import '../database.dart';

class EventsTable extends SupabaseTable<EventsRow> {
  @override
  String get tableName => 'events';

  @override
  EventsRow createRow(Map<String, dynamic> data) => EventsRow(data);
}

class EventsRow extends SupabaseDataRow {
  EventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventsTable();

  String? get eventUid => getField<String>('event_uid');
  set eventUid(String? value) => setField<String>('event_uid', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get eventName => getField<String>('event_name');
  set eventName(String? value) => setField<String>('event_name', value);

  String? get eventType => getField<String>('eventType');
  set eventType(String? value) => setField<String>('eventType', value);

  DateTime? get eventStartDate => getField<DateTime>('eventStartDate');
  set eventStartDate(DateTime? value) =>
      setField<DateTime>('eventStartDate', value);

  DateTime? get eventEndDate => getField<DateTime>('eventEndDate');
  set eventEndDate(DateTime? value) =>
      setField<DateTime>('eventEndDate', value);

  DateTime? get eventRegStartDate => getField<DateTime>('eventRegStartDate');
  set eventRegStartDate(DateTime? value) =>
      setField<DateTime>('eventRegStartDate', value);

  DateTime? get eventRegEndDate => getField<DateTime>('eventRegEndDate');
  set eventRegEndDate(DateTime? value) =>
      setField<DateTime>('eventRegEndDate', value);

  String? get eventCountry => getField<String>('eventCountry');
  set eventCountry(String? value) => setField<String>('eventCountry', value);

  String? get raceEventLocation => getField<String>('raceEventLocation');
  set raceEventLocation(String? value) =>
      setField<String>('raceEventLocation', value);

  String? get eventLiveTimingLink => getField<String>('eventLiveTimingLink');
  set eventLiveTimingLink(String? value) =>
      setField<String>('eventLiveTimingLink', value);

  String? get streamingLink => getField<String>('streamingLink');
  set streamingLink(String? value) => setField<String>('streamingLink', value);

  String? get eventCoverImage => getField<String>('eventCoverImage');
  set eventCoverImage(String? value) =>
      setField<String>('eventCoverImage', value);

  String? get organiserId => getField<String>('organiser_id');
  set organiserId(String? value) => setField<String>('organiser_id', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  String? get eventStatus => getField<String>('event_status');
  set eventStatus(String? value) => setField<String>('event_status', value);

  String? get eventYTChannel => getField<String>('event_YT_Channel');
  set eventYTChannel(String? value) =>
      setField<String>('event_YT_Channel', value);

  String? get eventChampionship => getField<String>('event_championship');
  set eventChampionship(String? value) =>
      setField<String>('event_championship', value);

  String? get eventNoticeBoardLink =>
      getField<String>('event_notice_board_link');
  set eventNoticeBoardLink(String? value) =>
      setField<String>('event_notice_board_link', value);

  String? get raceDirectorName => getField<String>('race_director_name');
  set raceDirectorName(String? value) =>
      setField<String>('race_director_name', value);

  String? get chiefStewardName => getField<String>('chief_steward_name');
  set chiefStewardName(String? value) =>
      setField<String>('chief_steward_name', value);

  String? get medicalContact => getField<String>('medical_contact');
  set medicalContact(String? value) =>
      setField<String>('medical_contact', value);

  String? get emergencyContact => getField<String>('emergency_contact');
  set emergencyContact(String? value) =>
      setField<String>('emergency_contact', value);

  bool? get resultsPublished => getField<bool>('results_published');
  set resultsPublished(bool? value) =>
      setField<bool>('results_published', value);

  String? get eventBanner => getField<String>('eventBanner');
  set eventBanner(String? value) => setField<String>('eventBanner', value);

  String? get previousEvent => getField<String>('previousEvent');
  set previousEvent(String? value) => setField<String>('previousEvent', value);

  String? get trackDetails => getField<String>('track_details');
  set trackDetails(String? value) => setField<String>('track_details', value);

  int? get eventOrder => getField<int>('event_order');
  set eventOrder(int? value) => setField<int>('event_order', value);

  DateTime? get evenLateFeeDate => getField<DateTime>('evenLateFeeDate');
  set evenLateFeeDate(DateTime? value) =>
      setField<DateTime>('evenLateFeeDate', value);

  String? get eventPColour => getField<String>('event_pColour');
  set eventPColour(String? value) => setField<String>('event_pColour', value);

  String? get eventPText => getField<String>('event_pText');
  set eventPText(String? value) => setField<String>('event_pText', value);

  String? get additionalStewardName =>
      getField<String>('additional_steward_name');
  set additionalStewardName(String? value) =>
      setField<String>('additional_steward_name', value);

  String? get clubStewardName => getField<String>('club_steward_name');
  set clubStewardName(String? value) =>
      setField<String>('club_steward_name', value);

  int? get roundNumber => getField<int>('round_number');
  set roundNumber(int? value) => setField<int>('round_number', value);

  String? get docConvention => getField<String>('doc_convention');
  set docConvention(String? value) => setField<String>('doc_convention', value);

  String? get cocName => getField<String>('coc_name');
  set cocName(String? value) => setField<String>('coc_name', value);

  String? get dcocName => getField<String>('dcoc_name');
  set dcocName(String? value) => setField<String>('dcoc_name', value);

  String? get paymentQR => getField<String>('PaymentQR');
  set paymentQR(String? value) => setField<String>('PaymentQR', value);
}
