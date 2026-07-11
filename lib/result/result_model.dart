import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'result_widget.dart' show ResultWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultModel extends FlutterFlowModel<ResultWidget> {
  ///  Local state fields for this page.

  String? resultEvalutionStart = 'Sample';

  String resultEvalutionEnding = 'Sample';

  String rawData = 'bncvb';

  dynamic resultData;

  bool? allCorrect;

  int? score;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GeminiResultEvaluation)] action in result widget.
  ApiCallResponse? apiResultsgx;
  // Stores action output result for [Firestore Query - Query a collection] action in result widget.
  TasksRecord? taskNext;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
