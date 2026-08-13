import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MecoKartingSupportRecord extends FirestoreRecord {
  MecoKartingSupportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mecoKartingCategory" field.
  List<String>? _mecoKartingCategory;
  List<String> get mecoKartingCategory => _mecoKartingCategory ?? const [];
  bool hasMecoKartingCategory() => _mecoKartingCategory != null;

  // "mecoKartingPayment" field.
  List<String>? _mecoKartingPayment;
  List<String> get mecoKartingPayment => _mecoKartingPayment ?? const [];
  bool hasMecoKartingPayment() => _mecoKartingPayment != null;

  // "FeePaymentQRImage" field.
  String? _feePaymentQRImage;
  String get feePaymentQRImage => _feePaymentQRImage ?? '';
  bool hasFeePaymentQRImage() => _feePaymentQRImage != null;

  // "tempEventTimeTable" field.
  String? _tempEventTimeTable;
  String get tempEventTimeTable => _tempEventTimeTable ?? '';
  bool hasTempEventTimeTable() => _tempEventTimeTable != null;

  void _initializeFields() {
    _mecoKartingCategory = getDataList(snapshotData['mecoKartingCategory']);
    _mecoKartingPayment = getDataList(snapshotData['mecoKartingPayment']);
    _feePaymentQRImage = snapshotData['FeePaymentQRImage'] as String?;
    _tempEventTimeTable = snapshotData['tempEventTimeTable'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mecoKarting_Support');

  static Stream<MecoKartingSupportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MecoKartingSupportRecord.fromSnapshot(s));

  static Future<MecoKartingSupportRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MecoKartingSupportRecord.fromSnapshot(s));

  static MecoKartingSupportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MecoKartingSupportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MecoKartingSupportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MecoKartingSupportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MecoKartingSupportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MecoKartingSupportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMecoKartingSupportRecordData({
  String? feePaymentQRImage,
  String? tempEventTimeTable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FeePaymentQRImage': feePaymentQRImage,
      'tempEventTimeTable': tempEventTimeTable,
    }.withoutNulls,
  );

  return firestoreData;
}

class MecoKartingSupportRecordDocumentEquality
    implements Equality<MecoKartingSupportRecord> {
  const MecoKartingSupportRecordDocumentEquality();

  @override
  bool equals(MecoKartingSupportRecord? e1, MecoKartingSupportRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.mecoKartingCategory, e2?.mecoKartingCategory) &&
        listEquality.equals(e1?.mecoKartingPayment, e2?.mecoKartingPayment) &&
        e1?.feePaymentQRImage == e2?.feePaymentQRImage &&
        e1?.tempEventTimeTable == e2?.tempEventTimeTable;
  }

  @override
  int hash(MecoKartingSupportRecord? e) => const ListEquality().hash([
        e?.mecoKartingCategory,
        e?.mecoKartingPayment,
        e?.feePaymentQRImage,
        e?.tempEventTimeTable
      ]);

  @override
  bool isValidKey(Object? o) => o is MecoKartingSupportRecord;
}
