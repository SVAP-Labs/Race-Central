import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RacingControlAppSupportRecord extends FirestoreRecord {
  RacingControlAppSupportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "kartingEvents" field.
  List<String>? _kartingEvents;
  List<String> get kartingEvents => _kartingEvents ?? const [];
  bool hasKartingEvents() => _kartingEvents != null;

  // "kartingTeams" field.
  List<String>? _kartingTeams;
  List<String> get kartingTeams => _kartingTeams ?? const [];
  bool hasKartingTeams() => _kartingTeams != null;

  // "kartingRounds" field.
  List<String>? _kartingRounds;
  List<String> get kartingRounds => _kartingRounds ?? const [];
  bool hasKartingRounds() => _kartingRounds != null;

  // "kartingYear" field.
  List<String>? _kartingYear;
  List<String> get kartingYear => _kartingYear ?? const [];
  bool hasKartingYear() => _kartingYear != null;

  // "app_minimumVersion" field.
  String? _appMinimumVersion;
  String get appMinimumVersion => _appMinimumVersion ?? '';
  bool hasAppMinimumVersion() => _appMinimumVersion != null;

  // "kartingScruitneers" field.
  List<String>? _kartingScruitneers;
  List<String> get kartingScruitneers => _kartingScruitneers ?? const [];
  bool hasKartingScruitneers() => _kartingScruitneers != null;

  // "kartingEventsCode" field.
  List<String>? _kartingEventsCode;
  List<String> get kartingEventsCode => _kartingEventsCode ?? const [];
  bool hasKartingEventsCode() => _kartingEventsCode != null;

  // "kartTeamRepresentative" field.
  List<String>? _kartTeamRepresentative;
  List<String> get kartTeamRepresentative =>
      _kartTeamRepresentative ?? const [];
  bool hasKartTeamRepresentative() => _kartTeamRepresentative != null;

  // "termsAndConditions" field.
  String? _termsAndConditions;
  String get termsAndConditions => _termsAndConditions ?? '';
  bool hasTermsAndConditions() => _termsAndConditions != null;

  // "iameKartingTeams" field.
  List<String>? _iameKartingTeams;
  List<String> get iameKartingTeams => _iameKartingTeams ?? const [];
  bool hasIameKartingTeams() => _iameKartingTeams != null;

  void _initializeFields() {
    _kartingEvents = getDataList(snapshotData['kartingEvents']);
    _kartingTeams = getDataList(snapshotData['kartingTeams']);
    _kartingRounds = getDataList(snapshotData['kartingRounds']);
    _kartingYear = getDataList(snapshotData['kartingYear']);
    _appMinimumVersion = snapshotData['app_minimumVersion'] as String?;
    _kartingScruitneers = getDataList(snapshotData['kartingScruitneers']);
    _kartingEventsCode = getDataList(snapshotData['kartingEventsCode']);
    _kartTeamRepresentative =
        getDataList(snapshotData['kartTeamRepresentative']);
    _termsAndConditions = snapshotData['termsAndConditions'] as String?;
    _iameKartingTeams = getDataList(snapshotData['iameKartingTeams']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('racingControl_appSupport');

  static Stream<RacingControlAppSupportRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => RacingControlAppSupportRecord.fromSnapshot(s));

  static Future<RacingControlAppSupportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RacingControlAppSupportRecord.fromSnapshot(s));

  static RacingControlAppSupportRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      RacingControlAppSupportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RacingControlAppSupportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RacingControlAppSupportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RacingControlAppSupportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RacingControlAppSupportRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createRacingControlAppSupportRecordData({
  String? appMinimumVersion,
  String? termsAndConditions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'app_minimumVersion': appMinimumVersion,
      'termsAndConditions': termsAndConditions,
    }.withoutNulls,
  );

  return firestoreData;
}

class RacingControlAppSupportRecordDocumentEquality
    implements Equality<RacingControlAppSupportRecord> {
  const RacingControlAppSupportRecordDocumentEquality();

  @override
  bool equals(
      RacingControlAppSupportRecord? e1, RacingControlAppSupportRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.kartingEvents, e2?.kartingEvents) &&
        listEquality.equals(e1?.kartingTeams, e2?.kartingTeams) &&
        listEquality.equals(e1?.kartingRounds, e2?.kartingRounds) &&
        listEquality.equals(e1?.kartingYear, e2?.kartingYear) &&
        e1?.appMinimumVersion == e2?.appMinimumVersion &&
        listEquality.equals(e1?.kartingScruitneers, e2?.kartingScruitneers) &&
        listEquality.equals(e1?.kartingEventsCode, e2?.kartingEventsCode) &&
        listEquality.equals(
            e1?.kartTeamRepresentative, e2?.kartTeamRepresentative) &&
        e1?.termsAndConditions == e2?.termsAndConditions &&
        listEquality.equals(e1?.iameKartingTeams, e2?.iameKartingTeams);
  }

  @override
  int hash(RacingControlAppSupportRecord? e) => const ListEquality().hash([
        const ListEquality().hash(e?.kartingEvents),
        const ListEquality().hash(e?.kartingTeams),
        const ListEquality().hash(e?.kartingRounds),
        const ListEquality().hash(e?.kartingYear),
        e?.appMinimumVersion,
        const ListEquality().hash(e?.kartingScruitneers),
        const ListEquality().hash(e?.kartingEventsCode),
        const ListEquality().hash(e?.kartTeamRepresentative),
        e?.termsAndConditions,
        const ListEquality().hash(e?.iameKartingTeams)
      ]);

  @override
  bool isValidKey(Object? o) => o is RacingControlAppSupportRecord;
}
