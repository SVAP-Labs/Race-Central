import '../database.dart';

class KartScrutinyCheckTable extends SupabaseTable<KartScrutinyCheckRow> {
  @override
  String get tableName => 'kart_scrutiny_check';

  @override
  KartScrutinyCheckRow createRow(Map<String, dynamic> data) =>
      KartScrutinyCheckRow(data);
}

class KartScrutinyCheckRow extends SupabaseDataRow {
  KartScrutinyCheckRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KartScrutinyCheckTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get registrationId => getField<String>('registration_id')!;
  set registrationId(String value) =>
      setField<String>('registration_id', value);

  String? get chassisMake => getField<String>('chassis_make');
  set chassisMake(String? value) => setField<String>('chassis_make', value);

  String? get chassisNumber => getField<String>('chassis_number');
  set chassisNumber(String? value) => setField<String>('chassis_number', value);

  String? get mainEngineNumber => getField<String>('main_engine_number');
  set mainEngineNumber(String? value) =>
      setField<String>('main_engine_number', value);

  String? get mainEngineSealNumber =>
      getField<String>('main_engine_seal_number');
  set mainEngineSealNumber(String? value) =>
      setField<String>('main_engine_seal_number', value);

  String? get spareEngineNumber => getField<String>('spare_engine_number');
  set spareEngineNumber(String? value) =>
      setField<String>('spare_engine_number', value);

  String? get spareEngineSealNumber =>
      getField<String>('spare_engine_seal_number');
  set spareEngineSealNumber(String? value) =>
      setField<String>('spare_engine_seal_number', value);

  bool? get spareEngineShared => getField<bool>('spare_engine_shared');
  set spareEngineShared(bool? value) =>
      setField<bool>('spare_engine_shared', value);

  String? get spareEngineSharedWith =>
      getField<String>('spare_engine_shared_with');
  set spareEngineSharedWith(String? value) =>
      setField<String>('spare_engine_shared_with', value);

  bool? get ballastAvailable => getField<bool>('ballast_available');
  set ballastAvailable(bool? value) =>
      setField<bool>('ballast_available', value);

  String? get ballastWeight => getField<String>('ballast_weight');
  set ballastWeight(String? value) => setField<String>('ballast_weight', value);

  bool? get chkChassis => getField<bool>('chk_chassis');
  set chkChassis(bool? value) => setField<bool>('chk_chassis', value);

  bool? get chkAxle => getField<bool>('chk_axle');
  set chkAxle(bool? value) => setField<bool>('chk_axle', value);

  bool? get chkWheels => getField<bool>('chk_wheels');
  set chkWheels(bool? value) => setField<bool>('chk_wheels', value);

  bool? get chkSteering => getField<bool>('chk_steering');
  set chkSteering(bool? value) => setField<bool>('chk_steering', value);

  bool? get chkSeatFitment => getField<bool>('chk_seat_fitment');
  set chkSeatFitment(bool? value) => setField<bool>('chk_seat_fitment', value);

  bool? get chkBodyworks => getField<bool>('chk_bodyworks');
  set chkBodyworks(bool? value) => setField<bool>('chk_bodyworks', value);

  bool? get chkBumperFrontFairing => getField<bool>('chk_bumper_front_fairing');
  set chkBumperFrontFairing(bool? value) =>
      setField<bool>('chk_bumper_front_fairing', value);

  bool? get chkExhaust => getField<bool>('chk_exhaust');
  set chkExhaust(bool? value) => setField<bool>('chk_exhaust', value);

  bool? get chkCarburetor => getField<bool>('chk_carburetor');
  set chkCarburetor(bool? value) => setField<bool>('chk_carburetor', value);

  bool? get chkBattery => getField<bool>('chk_battery');
  set chkBattery(bool? value) => setField<bool>('chk_battery', value);

  bool? get chkKillSwitch => getField<bool>('chk_kill_switch');
  set chkKillSwitch(bool? value) => setField<bool>('chk_kill_switch', value);

  bool? get chkRacingNos => getField<bool>('chk_racing_nos');
  set chkRacingNos(bool? value) => setField<bool>('chk_racing_nos', value);

  bool? get chkFuelLines => getField<bool>('chk_fuel_lines');
  set chkFuelLines(bool? value) => setField<bool>('chk_fuel_lines', value);

  bool? get chkTransponder => getField<bool>('chk_transponder');
  set chkTransponder(bool? value) => setField<bool>('chk_transponder', value);

  bool? get chkChainGuard => getField<bool>('chk_chain_guard');
  set chkChainGuard(bool? value) => setField<bool>('chk_chain_guard', value);

  bool? get chkBallastFix => getField<bool>('chk_ballast_fix');
  set chkBallastFix(bool? value) => setField<bool>('chk_ballast_fix', value);

  bool? get chkSeatMount => getField<bool>('chk_seat_mount');
  set chkSeatMount(bool? value) => setField<bool>('chk_seat_mount', value);

  bool? get passed => getField<bool>('passed');
  set passed(bool? value) => setField<bool>('passed', value);

  String? get remarks => getField<String>('remarks');
  set remarks(String? value) => setField<String>('remarks', value);

  DateTime? get scrutinisedAt => getField<DateTime>('scrutinised_at');
  set scrutinisedAt(DateTime? value) =>
      setField<DateTime>('scrutinised_at', value);

  String? get scrutinisedBy => getField<String>('scrutinised_by');
  set scrutinisedBy(String? value) => setField<String>('scrutinised_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get scruitneerSign => getField<String>('scruitneerSign');
  set scruitneerSign(String? value) =>
      setField<String>('scruitneerSign', value);

  bool? get isSubmited => getField<bool>('isSubmited');
  set isSubmited(bool? value) => setField<bool>('isSubmited', value);

  String? get exhaustSerialNum => getField<String>('exhaust_serial_Num');
  set exhaustSerialNum(String? value) =>
      setField<String>('exhaust_serial_Num', value);

  String? get exhaustRotaxNo => getField<String>('exhaust_Rotax_No');
  set exhaustRotaxNo(String? value) =>
      setField<String>('exhaust_Rotax_No', value);

  String? get exhaustOrgSeal => getField<String>('exhaust_org_seal');
  set exhaustOrgSeal(String? value) =>
      setField<String>('exhaust_org_seal', value);

  String? get seatBeltStandard => getField<String>('seatBeltStandard');
  set seatBeltStandard(String? value) =>
      setField<String>('seatBeltStandard', value);

  bool? get chk18 => getField<bool>('chk_18');
  set chk18(bool? value) => setField<bool>('chk_18', value);

  bool? get chk19 => getField<bool>('chk_19');
  set chk19(bool? value) => setField<bool>('chk_19', value);

  bool? get chk20 => getField<bool>('chk_20');
  set chk20(bool? value) => setField<bool>('chk_20', value);

  bool? get chk21 => getField<bool>('chk_21');
  set chk21(bool? value) => setField<bool>('chk_21', value);

  bool? get chk22 => getField<bool>('chk_22');
  set chk22(bool? value) => setField<bool>('chk_22', value);

  String? get seatStandard => getField<String>('seatStandard');
  set seatStandard(String? value) => setField<String>('seatStandard', value);

  String? get seatSerialNumber => getField<String>('seatSerialNumber');
  set seatSerialNumber(String? value) =>
      setField<String>('seatSerialNumber', value);
}
