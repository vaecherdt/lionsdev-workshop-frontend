import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Workshop Management API Group Code

class WorkshopManagementAPIGroup {
  static String getBaseUrl() =>
      'https://lionsdev-workshop-management.onrender.com';
  static Map<String, String> headers = {};
  static GETVehiclesCall gETVehiclesCall = GETVehiclesCall();
  static POSTVehicleCall pOSTVehicleCall = POSTVehicleCall();
}

class GETVehiclesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WorkshopManagementAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GET Vehicles',
      apiUrl: '$baseUrl/vehicles',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class POSTVehicleCall {
  Future<ApiCallResponse> call({
    String? owner = '',
    String? model = '',
    int? year,
    String? plate = '',
    List<String>? maintenancesList,
  }) async {
    final baseUrl = WorkshopManagementAPIGroup.getBaseUrl();
    final maintenances = _serializeList(maintenancesList);

    final ffApiRequestBody = '''
{
  "plate": "$plate",
  "model": "$model",
  "year": $year,
  "owner": "$owner",
  "maintenances": $maintenances
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POST Vehicle',
      apiUrl: '$baseUrl/vehicles',
      callType: ApiCallType.POST,
      headers: {},
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

/// End Workshop Management API Group Code

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
