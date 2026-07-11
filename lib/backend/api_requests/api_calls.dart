import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GenerateStydyPlannerCall {
  static Future<ApiCallResponse> call({
    String? subject = '',
    String? level = '',
    String? hours = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Create 30 day study plan for {${escapeStringForJson(subject)}} {${escapeStringForJson(level)}} level {${escapeStringForJson(hours)}} hours daily. Return JSON only format: {days:[{day,topics,summary}]}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateStydyPlanner',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyBB5up41oRyo33gahH6P75OKgqbW7Qny-8',
      callType: ApiCallType.POST,
      headers: {
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

class GeminiResultEvaluationCall {
  static Future<ApiCallResponse> call({
    String? payload = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "{${escapeStringForJson(payload)}}"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.2,
    "response_mime_type": "application/json"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GeminiResultEvaluation',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyBB5up41oRyo33gahH6P75OKgqbW7Qny-8',
      callType: ApiCallType.POST,
      headers: {
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

class GenerateLessonContentCall {
  static Future<ApiCallResponse> call({
    List<String>? topicsTextList,
  }) async {
    final topicsText = _serializeList(topicsTextList);

    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "You are a JSON generator. Return ONLY valid JSON. No markdown. No explanation. No extra text. Strictly follow this structure: { \\"lesson_title\\": \\"string\\", \\"introduction\\": \\"string\\", \\"topics\\": [ { \\"topic_name\\": \\"string\\", \\"explanation\\": \\"string\\", \\"real_life_examples\\": [\\"string\\",\\"string\\"], \\"summary\\": \\"string\\" } ], \\"mcq_quiz\\": [ { \\"question\\": \\"string\\", \\"options\\": [\\"string\\",\\"string\\",\\"string\\",\\"string\\"], \\"correct_answer\\": \\"string\\" } ] } Generate exactly 5 MCQ questions. Topics: {${topicsText}}"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.2
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateLessonContent',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyBB5up41oRyo33gahH6P75OKgqbW7Qny-8',
      callType: ApiCallType.POST,
      headers: {
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

class GenerateLessonContentCopyCall {
  static Future<ApiCallResponse> call({
    String? topicsText = 'introduction',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "You are a STRICT JSON generator.\\n\\nReturn ONLY valid JSON.\\nNo markdown. No explanation.\\n\\nUse ONLY the following topics:\\n{${escapeStringForJson(topicsText)}}\\n\\nSTRICT STRUCTURE:\\n{\\n  \\"lesson_title\\": \\"string\\",\\n  \\"introduction\\": \\"string\\",\\n  \\"topics\\": [\\n    {\\n      \\"topic_name\\": \\"string\\",\\n      \\"explanation\\": \\"string\\",\\n      \\"real_life_examples\\": [\\"string\\", \\"string\\"],\\n      \\"summary\\": \\"string\\"\\n    }\\n  ],\\n  \\"mcq_quiz\\": [\\n    {\\n      \\"question\\": \\"string\\",\\n      \\"options\\": [\\"string\\", \\"string\\", \\"string\\", \\"string\\"],\\n      \\"correct_answer\\": \\"string\\"\\n    }\\n  ]\\n}\\n\\nRULES:\\n- Generate exactly 5 MCQs\\n- Stay only within given topics"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.0
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateLessonContent Copy',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyBB5up41oRyo33gahH6P75OKgqbW7Qny-8',
      callType: ApiCallType.POST,
      headers: {
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

class GeminiChatCall {
  static Future<ApiCallResponse> call({
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "${escapeStringForJson(message)}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GeminiChat',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyBB5up41oRyo33gahH6P75OKgqbW7Qny-8',
      callType: ApiCallType.POST,
      headers: {
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

  static String? aiMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
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
