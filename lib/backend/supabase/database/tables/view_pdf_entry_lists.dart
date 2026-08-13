import '../database.dart';

class ViewPdfEntryListsTable extends SupabaseTable<ViewPdfEntryListsRow> {
  @override
  String get tableName => 'view_pdf_entry_lists';

  @override
  ViewPdfEntryListsRow createRow(Map<String, dynamic> data) =>
      ViewPdfEntryListsRow(data);
}

class ViewPdfEntryListsRow extends SupabaseDataRow {
  ViewPdfEntryListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewPdfEntryListsTable();

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get eventName => getField<String>('event_name');
  set eventName(String? value) => setField<String>('event_name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get entryNumber => getField<int>('entry_number');
  set entryNumber(int? value) => setField<int>('entry_number', value);

  String? get teamName => getField<String>('teamName');
  set teamName(String? value) => setField<String>('teamName', value);

  String? get fmsciLicenseNumber => getField<String>('fmsci_licenseNumber');
  set fmsciLicenseNumber(String? value) =>
      setField<String>('fmsci_licenseNumber', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get driverName => getField<String>('driver_name');
  set driverName(String? value) => setField<String>('driver_name', value);

  String? get bloodGroup => getField<String>('blood_group');
  set bloodGroup(String? value) => setField<String>('blood_group', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
