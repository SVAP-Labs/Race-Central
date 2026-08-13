import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppVersionRecord extends FirestoreRecord {
  AppVersionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "min_required_version" field.
  String? _minRequiredVersion;
  String get minRequiredVersion => _minRequiredVersion ?? '';
  bool hasMinRequiredVersion() => _minRequiredVersion != null;

  // "latest_version" field.
  String? _latestVersion;
  String get latestVersion => _latestVersion ?? '';
  bool hasLatestVersion() => _latestVersion != null;

  // "android_store_url" field.
  String? _androidStoreUrl;
  String get androidStoreUrl => _androidStoreUrl ?? '';
  bool hasAndroidStoreUrl() => _androidStoreUrl != null;

  // "ios_store_url" field.
  String? _iosStoreUrl;
  String get iosStoreUrl => _iosStoreUrl ?? '';
  bool hasIosStoreUrl() => _iosStoreUrl != null;

  // "update_message" field.
  String? _updateMessage;
  String get updateMessage => _updateMessage ?? '';
  bool hasUpdateMessage() => _updateMessage != null;

  void _initializeFields() {
    _minRequiredVersion = snapshotData['min_required_version'] as String?;
    _latestVersion = snapshotData['latest_version'] as String?;
    _androidStoreUrl = snapshotData['android_store_url'] as String?;
    _iosStoreUrl = snapshotData['ios_store_url'] as String?;
    _updateMessage = snapshotData['update_message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_version');

  static Stream<AppVersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppVersionRecord.fromSnapshot(s));

  static Future<AppVersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppVersionRecord.fromSnapshot(s));

  static AppVersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppVersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppVersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppVersionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppVersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppVersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppVersionRecordData({
  String? minRequiredVersion,
  String? latestVersion,
  String? androidStoreUrl,
  String? iosStoreUrl,
  String? updateMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'min_required_version': minRequiredVersion,
      'latest_version': latestVersion,
      'android_store_url': androidStoreUrl,
      'ios_store_url': iosStoreUrl,
      'update_message': updateMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppVersionRecordDocumentEquality implements Equality<AppVersionRecord> {
  const AppVersionRecordDocumentEquality();

  @override
  bool equals(AppVersionRecord? e1, AppVersionRecord? e2) {
    return e1?.minRequiredVersion == e2?.minRequiredVersion &&
        e1?.latestVersion == e2?.latestVersion &&
        e1?.androidStoreUrl == e2?.androidStoreUrl &&
        e1?.iosStoreUrl == e2?.iosStoreUrl &&
        e1?.updateMessage == e2?.updateMessage;
  }

  @override
  int hash(AppVersionRecord? e) => const ListEquality().hash([
        e?.minRequiredVersion,
        e?.latestVersion,
        e?.androidStoreUrl,
        e?.iosStoreUrl,
        e?.updateMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is AppVersionRecord;
}
