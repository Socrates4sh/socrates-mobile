import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class VideoUploadCall {
  static Future<ApiCallResponse> call({
    String? googlesheetURL = '',
    String? folderPath = '',
  }) async {
    final ffApiRequestBody = '''
{
  "filePathInBucket": "${escapeStringForJson(folderPath)}",
  "spreadsheetUrl": "${escapeStringForJson(googlesheetURL)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VideoUpload',
      apiUrl:
          'https://us-central1-socrates-2c93f.cloudfunctions.net/videoUpload2',
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

class MailchimpSubscriptionCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    bool? subscription,
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${escapeStringForJson(uid)}",
  "email": "${escapeStringForJson(email)}",
  "isSubscribe": ${subscription}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mailchimpSubscription',
      apiUrl:
          'https://us-central1-socrates-2c93f.cloudfunctions.net/subscriebEmail2',
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

class CreateSubscriptionIDCall {
  static Future<ApiCallResponse> call({
    String? planId = '',
    int? totalCount,
    String? description = '',
    String? uID = '',
    String? customerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "plan_id": "${escapeStringForJson(planId)}",
  "customer_id": "${escapeStringForJson(customerId)}",
  "total_count": ${totalCount},
  "quantity": 1,
  "customer_notify": 0,
  "notes": {
    "method": "upi_only",
    "userId": "${escapeStringForJson(uID)}",
    "description": "${escapeStringForJson(description)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createSubscriptionID',
      apiUrl: 'https://api.razorpay.com/v1/subscriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic cnpwX3Rlc3RfdVR6eTl4QlZoaU5yU086Rm9qUnRlSVZIWDBCQTBaWDQ0MWoxajdU',
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

  static String? subscriptionId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CreateCustomerIDCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "contact": "${escapeStringForJson(phone)}",
  "fail_existing": "0"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateCustomerID',
      apiUrl: 'https://api.razorpay.com/v1/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic cnpwX3Rlc3RfdVR6eTl4QlZoaU5yU086Rm9qUnRlSVZIWDBCQTBaWDQ0MWoxajdU',
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

  static String? customerId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

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
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
