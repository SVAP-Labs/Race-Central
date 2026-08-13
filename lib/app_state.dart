import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _appUserId = await secureStorage.getString('ff_appUserId') ?? _appUserId;
    });
    await _safeInitAsync(() async {
      _organiserId =
          await secureStorage.getString('ff_organiserId') ?? _organiserId;
    });
    await _safeInitAsync(() async {
      _organiserRole =
          await secureStorage.getString('ff_organiserRole') ?? _organiserRole;
    });
    await _safeInitAsync(() async {
      _userChoosenEvent =
          await secureStorage.getString('ff_userChoosenEvent') ??
              _userChoosenEvent;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _appUserId = '';
  String get appUserId => _appUserId;
  set appUserId(String value) {
    _appUserId = value;
    secureStorage.setString('ff_appUserId', value);
  }

  void deleteAppUserId() {
    secureStorage.delete(key: 'ff_appUserId');
  }

  String _organiserId = '';
  String get organiserId => _organiserId;
  set organiserId(String value) {
    _organiserId = value;
    secureStorage.setString('ff_organiserId', value);
  }

  void deleteOrganiserId() {
    secureStorage.delete(key: 'ff_organiserId');
  }

  String _organiserRole = '';
  String get organiserRole => _organiserRole;
  set organiserRole(String value) {
    _organiserRole = value;
    secureStorage.setString('ff_organiserRole', value);
  }

  void deleteOrganiserRole() {
    secureStorage.delete(key: 'ff_organiserRole');
  }

  String _userChoosenEvent = '';
  String get userChoosenEvent => _userChoosenEvent;
  set userChoosenEvent(String value) {
    _userChoosenEvent = value;
    secureStorage.setString('ff_userChoosenEvent', value);
  }

  void deleteUserChoosenEvent() {
    secureStorage.delete(key: 'ff_userChoosenEvent');
  }

  List<SessionTimeTableStruct> _sessionTimeTable = [];
  List<SessionTimeTableStruct> get sessionTimeTable => _sessionTimeTable;
  set sessionTimeTable(List<SessionTimeTableStruct> value) {
    _sessionTimeTable = value;
  }

  void addToSessionTimeTable(SessionTimeTableStruct value) {
    sessionTimeTable.add(value);
  }

  void removeFromSessionTimeTable(SessionTimeTableStruct value) {
    sessionTimeTable.remove(value);
  }

  void removeAtIndexFromSessionTimeTable(int index) {
    sessionTimeTable.removeAt(index);
  }

  void updateSessionTimeTableAtIndex(
    int index,
    SessionTimeTableStruct Function(SessionTimeTableStruct) updateFn,
  ) {
    sessionTimeTable[index] = updateFn(_sessionTimeTable[index]);
  }

  void insertAtIndexInSessionTimeTable(
      int index, SessionTimeTableStruct value) {
    sessionTimeTable.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
