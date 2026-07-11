import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/question_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'lesson_widget.dart' show LessonWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LessonModel extends FlutterFlowModel<LessonWidget> {
  ///  Local state fields for this page.

  String? rawData;

  dynamic lessonData;

  bool? allCorrect;

  String? resultPrepareData;

  String evalutionString = 'demo';

  bool? isTest;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GenerateLessonContent)] action in lesson widget.
  ApiCallResponse? apiResult021;
  // Models for questionCard dynamic component.
  late FlutterFlowDynamicModels<QuestionCardModel> questionCardModels;

  @override
  void initState(BuildContext context) {
    questionCardModels = FlutterFlowDynamicModels(() => QuestionCardModel());
  }

  @override
  void dispose() {
    questionCardModels.dispose();
  }
}
