import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start supabaseDBAPI Group Code

class SupabaseDBAPIGroup {
  static CreateEmptyKartingCheckCall createEmptyKartingCheckCall =
      CreateEmptyKartingCheckCall();
  static CreateEmptyAndCopyKartingChecksCall
      createEmptyAndCopyKartingChecksCall =
      CreateEmptyAndCopyKartingChecksCall();
  static CreateUniqueNumberCall createUniqueNumberCall =
      CreateUniqueNumberCall();
  static NoOfSealPerTeamCall noOfSealPerTeamCall = NoOfSealPerTeamCall();
  static IsUserAlreadyRegisteredCall isUserAlreadyRegisteredCall =
      IsUserAlreadyRegisteredCall();
  static GetCompEntryNumberCall getCompEntryNumberCall =
      GetCompEntryNumberCall();
  static GetcategorynumbersCall getcategorynumbersCall =
      GetcategorynumbersCall();
  static GetUniqueEntryNumberCall getUniqueEntryNumberCall =
      GetUniqueEntryNumberCall();
}

class CreateEmptyKartingCheckCall {
  Future<ApiCallResponse> call({
    String? pSealingId = '',
    String? pCategoryId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateEmptyKartingCheckCall',
        'variables': {
          'pSealingId': pSealingId,
          'pCategoryId': pCategoryId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateEmptyAndCopyKartingChecksCall {
  Future<ApiCallResponse> call({
    String? newSealingId = '',
    String? sourceSealingId = '',
    String? category = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateEmptyAndCopyKartingChecksCall',
        'variables': {
          'newSealingId': newSealingId,
          'sourceSealingId': sourceSealingId,
          'category': category,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateUniqueNumberCall {
  Future<ApiCallResponse> call({
    String? engineNumber = '',
    String? roundNumber = '',
    String? year = '',
    String? sealType = '',
    String? eventNameCode = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateUniqueNumberCall',
        'variables': {
          'engineNumber': engineNumber,
          'roundNumber': roundNumber,
          'year': year,
          'sealType': sealType,
          'eventNameCode': eventNameCode,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class NoOfSealPerTeamCall {
  Future<ApiCallResponse> call({
    String? round = '',
    String? year = '',
    String? eventName = '',
    bool? inspectionCompleted,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NoOfSealPerTeamCall',
        'variables': {
          'round': round,
          'year': year,
          'eventName': eventName,
          'inspectionCompleted': inspectionCompleted,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class IsUserAlreadyRegisteredCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    String? driverId = '',
    String? category = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'IsUserAlreadyRegisteredCall',
        'variables': {
          'eventId': eventId,
          'driverId': driverId,
          'category': category,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetCompEntryNumberCall {
  Future<ApiCallResponse> call({
    String? vEventId = '',
    String? vDriverId = '',
    String? vCategory = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetCompEntryNumberCall',
        'variables': {
          'vEventId': vEventId,
          'vDriverId': vDriverId,
          'vCategory': vCategory,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetcategorynumbersCall {
  Future<ApiCallResponse> call({
    String? vCategory = '',
    String? vEventID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetcategorynumbersCall',
        'variables': {
          'vCategory': vCategory,
          'vEventID': vEventID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetUniqueEntryNumberCall {
  Future<ApiCallResponse> call({
    String? vEventId = '',
    String? vCategory = '',
    String? vDriverId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetUniqueEntryNumberCall',
        'variables': {
          'vEventId': vEventId,
          'vCategory': vCategory,
          'vDriverId': vDriverId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End supabaseDBAPI Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  final encoded = jsonEncode(input);
  return encoded.substring(1, encoded.length - 1);
}
