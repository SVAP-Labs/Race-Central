import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start supabaseDBAPI Group Code

class SupabaseDBAPIGroup {
  static String getBaseUrl() => 'https://rapbhkvgkjmcmlbamwlz.supabase.co';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
    'Content-Type': 'application/json',
  };
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
  static GetallowedCarsinCategoryCall getallowedCarsinCategoryCall =
      GetallowedCarsinCategoryCall();
}

class CreateEmptyKartingCheckCall {
  Future<ApiCallResponse> call({
    String? pSealingId = '',
    String? pCategoryId = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_sealing_id": ${pSealingId == null ? 'null' : '"${escapeStringForJson(pSealingId)}"'},
  "p_category": ${pCategoryId == null ? 'null' : '"${escapeStringForJson(pCategoryId)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEmptyKartingCheck',
      apiUrl: '${baseUrl}/rest/v1/rpc/create_empty_ks_karting_checks_data',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEmptyAndCopyKartingChecksCall {
  Future<ApiCallResponse> call({
    String? newSealingId = '',
    String? sourceSealingId = '',
    String? category = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_new_sealing_id": ${newSealingId == null ? 'null' : '"${escapeStringForJson(newSealingId)}"'},
  "p_source_sealing_id": ${sourceSealingId == null ? 'null' : '"${escapeStringForJson(sourceSealingId)}"'},
  "p_category": ${category == null ? 'null' : '"${escapeStringForJson(category)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEmptyAndCopyKartingChecks',
      apiUrl: '${baseUrl}/rest/v1/rpc/create_karting_checks_data',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
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
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_engine_number": ${engineNumber == null ? 'null' : '"${escapeStringForJson(engineNumber)}"'},
  "p_event_name": ${eventNameCode == null ? 'null' : '"${escapeStringForJson(eventNameCode)}"'},
  "p_round": ${roundNumber == null ? 'null' : '"${escapeStringForJson(roundNumber)}"'},
  "p_year": ${year == null ? 'null' : '"${escapeStringForJson(year)}"'},
  "p_seal_type": ${sealType == null ? 'null' : '"${escapeStringForJson(sealType)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUniqueNumber',
      apiUrl: '${baseUrl}/rest/v1/rpc/generate_unique_number',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NoOfSealPerTeamCall {
  Future<ApiCallResponse> call({
    String? round = '',
    String? year = '',
    String? eventName = '',
    bool? inspectionCompleted,
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_round": ${round == null ? 'null' : '"${escapeStringForJson(round)}"'},
  "p_year": ${year == null ? 'null' : '"${escapeStringForJson(year)}"'},
  "p_eventname": ${eventName == null ? 'null' : '"${escapeStringForJson(eventName)}"'},
  "p_inspection_completed": ${inspectionCompleted == null ? 'null' : '"${inspectionCompleted}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'noOfSealPerTeam',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_sealing_entries_per_team',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IsUserAlreadyRegisteredCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    String? driverId = '',
    String? category = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_event_id": ${eventId == null ? 'null' : '"${escapeStringForJson(eventId)}"'},
  "p_driver_id": ${driverId == null ? 'null' : '"${escapeStringForJson(driverId)}"'},
  "p_category": ${category == null ? 'null' : '"${escapeStringForJson(category)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'isUserAlreadyRegistered',
      apiUrl: '${baseUrl}/rest/v1/rpc/check_event_registration',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCompEntryNumberCall {
  Future<ApiCallResponse> call({
    String? vEventId = '',
    String? vDriverId = '',
    String? vCategory = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_event_id": ${vEventId == null ? 'null' : '"${escapeStringForJson(vEventId)}"'},
  "p_current_driver_id": ${vDriverId == null ? 'null' : '"${escapeStringForJson(vDriverId)}"'},
  "p_category_name": ${vCategory == null ? 'null' : '"${escapeStringForJson(vCategory)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCompEntryNumber',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_available_numbers',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetcategorynumbersCall {
  Future<ApiCallResponse> call({
    String? vCategory = '',
    String? vEventID = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_event_id": ${vEventID == null ? 'null' : '"${escapeStringForJson(vEventID)}"'},
  "p_category_name": ${vCategory == null ? 'null' : '"${escapeStringForJson(vCategory)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getcategorynumbers',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_category_numbers',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUniqueEntryNumberCall {
  Future<ApiCallResponse> call({
    String? vEventId = '',
    String? vCategory = '',
    String? vDriverId = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_event_id": ${vEventId == null ? 'null' : '"${escapeStringForJson(vEventId)}"'},
  "p_driver_id": ${vDriverId == null ? 'null' : '"${escapeStringForJson(vDriverId)}"'},
  "p_category_name": ${vCategory == null ? 'null' : '"${escapeStringForJson(vCategory)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUniqueEntryNumber',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_available_entry_numbers_string',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetallowedCarsinCategoryCall {
  Future<ApiCallResponse> call({
    String? vRegistrationId = '',
  }) async {
    final baseUrl = SupabaseDBAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_registration_id": ${vRegistrationId == null ? 'null' : '"${escapeStringForJson(vRegistrationId)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getallowedCarsinCategory',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_allowed_cars_for_category',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
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
