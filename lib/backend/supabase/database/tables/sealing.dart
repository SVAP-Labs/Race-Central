import '../database.dart';

class SealingTable extends SupabaseTable<SealingRow> {
  @override
  String get tableName => 'sealing';

  @override
  SealingRow createRow(Map<String, dynamic> data) => SealingRow(data);
}

class SealingRow extends SupabaseDataRow {
  SealingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SealingTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get uniqueNumber => getField<String>('unique_number')!;
  set uniqueNumber(String value) => setField<String>('unique_number', value);

  String get sealType => getField<String>('seal_type')!;
  set sealType(String value) => setField<String>('seal_type', value);

  String get year => getField<String>('year')!;
  set year(String value) => setField<String>('year', value);

  String get round => getField<String>('round')!;
  set round(String value) => setField<String>('round', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);

  String? get teamName => getField<String>('team_name');
  set teamName(String? value) => setField<String>('team_name', value);

  String get engineNumber => getField<String>('engine_number')!;
  set engineNumber(String value) => setField<String>('engine_number', value);

  bool? get inspectionCompleted => getField<bool>('inspection_completed');
  set inspectionCompleted(bool? value) =>
      setField<bool>('inspection_completed', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool get isInDraftState => getField<bool>('isInDraftState')!;
  set isInDraftState(bool value) => setField<bool>('isInDraftState', value);

  String? get sealNumber => getField<String>('sealNumber');
  set sealNumber(String? value) => setField<String>('sealNumber', value);

  DateTime? get sealDate => getField<DateTime>('sealDate');
  set sealDate(DateTime? value) => setField<DateTime>('sealDate', value);

  String? get teamRep => getField<String>('teamRep');
  set teamRep(String? value) => setField<String>('teamRep', value);

  String? get teamRepSign => getField<String>('teamRepSign');
  set teamRepSign(String? value) => setField<String>('teamRepSign', value);

  String? get scruitneerName => getField<String>('scruitneerName');
  set scruitneerName(String? value) =>
      setField<String>('scruitneerName', value);

  String? get scruitneerSign => getField<String>('scruitneerSign');
  set scruitneerSign(String? value) =>
      setField<String>('scruitneerSign', value);

  String? get sealRemarks => getField<String>('sealRemarks');
  set sealRemarks(String? value) => setField<String>('sealRemarks', value);

  String? get sealPhoto => getField<String>('sealPhoto');
  set sealPhoto(String? value) => setField<String>('sealPhoto', value);

  bool? get engineIdPresent => getField<bool>('engineIdPresent');
  set engineIdPresent(bool? value) => setField<bool>('engineIdPresent', value);

  String? get eventName => getField<String>('eventName');
  set eventName(String? value) => setField<String>('eventName', value);

  double? get numberOfSeals => getField<double>('numberOfSeals');
  set numberOfSeals(double? value) => setField<double>('numberOfSeals', value);

  bool? get check1CC => getField<bool>('check1-CC');
  set check1CC(bool? value) => setField<bool>('check1-CC', value);

  bool? get check2Bs => getField<bool>('check 2 -bs');
  set check2Bs(bool? value) => setField<bool>('check 2 -bs', value);

  bool? get check3CS => getField<bool>('check 3 - CS');
  set check3CS(bool? value) => setField<bool>('check 3 - CS', value);

  bool? get check4PC => getField<bool>('check 4 - PC');
  set check4PC(bool? value) => setField<bool>('check 4 - PC', value);

  bool? get check5CyC => getField<bool>('check 5 - cyC');
  set check5CyC(bool? value) => setField<bool>('check 5 - cyC', value);

  bool? get check6InS => getField<bool>('check 6 - InS');
  set check6InS(bool? value) => setField<bool>('check 6 - InS', value);

  bool? get check7SG => getField<bool>('check 7 - SG');
  set check7SG(bool? value) => setField<bool>('check 7 - SG', value);

  bool? get isDeleted => getField<bool>('isDeleted');
  set isDeleted(bool? value) => setField<bool>('isDeleted', value);

  String? get seal2 => getField<String>('seal_2');
  set seal2(String? value) => setField<String>('seal_2', value);

  String? get seal3 => getField<String>('seal_3');
  set seal3(String? value) => setField<String>('seal_3', value);

  String? get cylinderNo => getField<String>('cylinderNo');
  set cylinderNo(String? value) => setField<String>('cylinderNo', value);
}
