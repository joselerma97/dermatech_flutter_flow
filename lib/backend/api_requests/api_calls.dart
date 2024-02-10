import 'dart:convert';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RegisterUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    int? age,
    String? nickname = '',
    String? gender = '',
    String? password = '',
    String? deviceName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "age": $age,
  "nickname": "$nickname",
  "gender": "$gender",
  "password": "$password",
  "deviceName": "$deviceName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerUser',
      apiUrl: 'https://dermatechserver.cloud/dermatech/user',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static String? deviceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.deviceId''',
      ));
}

class AuthenticationCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? deviceName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "deviceName": "$deviceName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'authentication',
      apiUrl: 'https://dermatechserver.cloud/dermatech/authentication',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static String? deviceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.deviceId''',
      ));
}

class RecommendationGemeniCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'recommendationGemeni',
      apiUrl: 'https://dermatechserver.cloud/products/recommendation/$prompt',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<ProductInfoStruct>? productsInfo(dynamic response) =>
      (getJsonField(
        response,
        r'''$.info''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ProductInfoStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class AddAlarmCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? name = '',
    String? unit = '',
    int? amount,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "name": "$name",
  "unit": "$unit",
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addAlarm',
      apiUrl: 'https://dermatechserver.cloud/dermatech/alarms/add',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class DeleteAlarmCall {
  static Future<ApiCallResponse> call({
    String? idAlarm = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAlarm',
      apiUrl:
          'https://dermatechserver.cloud/dermatech/alarms/remove/$idAlarm',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetAlarmsInfoCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAlarmsInfo',
      apiUrl: 'https://dermatechserver.cloud/dermatech/alarms/user/$userId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<AlarmsInfoStruct>? alarmsInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => AlarmsInfoStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class FullPredictionCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? uploadedFile,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'fullPrediction',
      apiUrl: 'https://dermatechserver.cloud/skin/type/full_prediction',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uploaded_file': uploadedFile,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imageName(dynamic response) => getJsonField(
        response,
        r'''$.img_name''',
      );
  static dynamic predResult(dynamic response) => getJsonField(
        response,
        r'''$.pred_result''',
      );
}

class GetDoctorsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDoctors',
      apiUrl: 'https://dermatechserver.cloud/doctors/recommendation',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<DoctorsInfoStruct>? doctorsInfo(dynamic response) =>
      (getJsonField(
        response,
        r'''$.info''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => DoctorsInfoStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetProductRecommendationByScanCall {
  static Future<ApiCallResponse> call({
    List<String>? issuesList,
  }) async {
    final issues = _serializeList(issuesList);

    final ffApiRequestBody = issues;
    return ApiManager.instance.makeApiCall(
      callName: 'getProductRecommendationByScan',
      apiUrl: 'https://dermatechserver.cloud/products/img/scan',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<ProductInfoStruct>? products(dynamic response) => (getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ProductInfoStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetTipsCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTips',
      apiUrl: 'https://dermatechserver.cloud/products/tips/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'prompt': prompt,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? tips(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tips''',
      ));
}

class RememberPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'rememberPassword',
      apiUrl:
          'https://dermatechserver.cloud/dermatech/remember/password/$email',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class LogOutCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'logOut',
      apiUrl:
          'https://dermatechserver.cloud/dermatech/device/remove/$deviceId',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetDevicesCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDevices',
      apiUrl: 'https://dermatechserver.cloud/dermatech/devices/user/$userId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<DeviceInfoStruct>? devices(dynamic response) => (getJsonField(
        response,
        r'''$.devices''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => DeviceInfoStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
