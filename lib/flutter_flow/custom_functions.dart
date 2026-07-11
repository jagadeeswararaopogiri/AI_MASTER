import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic parseGeminiJson(String? text) {
  if (text == null || text.isEmpty) {
    return null;
  }

  try {
    String cleaned =
        text.replaceAll('```json', '').replaceAll('```', '').trim();

    return jsonDecode(cleaned);
  } catch (e) {
    return null;
  }
}

bool? validateLessonData(dynamic lessonData) {
  try {
    /// ---------- NULL CHECK ----------
    if (lessonData == null) return false;

    /// ---------- ROOT KEYS ----------
    if (lessonData["lesson_title"] == null ||
        lessonData["introduction"] == null ||
        lessonData["topics"] == null ||
        lessonData["mcq_quiz"] == null) {
      return false;
    }

    /// ---------- TYPE CHECK ----------
    if (lessonData["topics"] is! List || lessonData["mcq_quiz"] is! List) {
      return false;
    }

    List topics = lessonData["topics"];
    List quiz = lessonData["mcq_quiz"];

    /// ---------- EMPTY CHECK ----------
    if (topics.isEmpty || quiz.isEmpty) {
      return false;
    }

    /// ---------- TOPICS VALIDATION ----------
    for (var topic in topics) {
      if (topic["topic_name"] == null ||
          topic["explanation"] == null ||
          topic["real_life_examples"] == null ||
          topic["summary"] == null) {
        return false;
      }

      /// real life examples must be list
      if (topic["real_life_examples"] is! List) {
        return false;
      }

      if ((topic["real_life_examples"] as List).isEmpty) {
        return false;
      }
    }

    /// ---------- MCQ VALIDATION ----------
    if (quiz.length != 5) {
      return false;
    }

    for (var q in quiz) {
      if (q["question"] == null ||
          q["options"] == null ||
          q["correct_answer"] == null) {
        return false;
      }

      /// options must be list
      if (q["options"] is! List) {
        return false;
      }

      /// must contain 4 options
      if ((q["options"] as List).length != 4) {
        return false;
      }
    }

    /// ---------- SUCCESS ----------
    return true;
  } catch (e) {
    print("Lesson Validation Error: $e");
    return false;
  }
}

String? prepareQuizEvaluationData(
  dynamic mcqList,
  List<String>? userAnswers,
) {
  //
  {
    try {
      if (mcqList == null || mcqList is! List || userAnswers == null) {
        return "{}";
      }

      List<Map<String, dynamic>> preparedList = [];

      for (int i = 0; i < mcqList.length; i++) {
        var question = mcqList[i];

        preparedList.add({
          "question": question["question"],
          "options": question["options"],
          "correct_answer": question["correct_answer"],
          "user_answer": i < userAnswers.length ? userAnswers[i] : null
        });
      }

      return jsonEncode({"questions": preparedList});
    } catch (e) {
      print("Prepare Quiz Data Error: $e");
      return "{}";
    }
  }
}

String? evalutionPayloadString(String evalutionPayload) {
  return """
You are a strict JSON API.

Return ONLY valid JSON.
Do not return markdown.
Do not return explanation text.

Evaluate this quiz data:

$evalutionPayload

Return strictly:

{
  "score": number,
  "correctAnswers": ["string"],
  "improvements": ["string"],
  "recommendations": ["string"]
}

Score must equal total correct answers count.
""";
}

bool? validateEvalutionResult(dynamic resultData) {
  try {
    // 1️⃣ Null check
    if (resultData == null) return false;

    // 2️⃣ Must be Map
    if (resultData is! Map<String, dynamic>) return false;

    // 3️⃣ Required Keys
    if (!resultData.containsKey("score")) return false;
    if (!resultData.containsKey("correctAnswers")) return false;
    if (!resultData.containsKey("improvements")) return false;
    if (!resultData.containsKey("recommendations")) return false;

    // 4️⃣ Type Checks
    if (resultData["score"] is! int && resultData["score"] is! double) {
      return false;
    }

    if (resultData["correctAnswers"] is! List) return false;
    if (resultData["improvements"] is! List) return false;
    if (resultData["recommendations"] is! List) return false;

    // 5️⃣ List Content Type Check
    for (var item in resultData["correctAnswers"]) {
      if (item is! String) return false;
    }

    for (var item in resultData["improvements"]) {
      if (item is! String) return false;
    }

    for (var item in resultData["recommendations"]) {
      if (item is! String) return false;
    }

    // 6️⃣ Optional: Score Must Be Non-negative
    if (resultData["score"] < 0) return false;

    return true;
  } catch (e) {
    return false;
  }
}

bool? has20HoursPassed(DateTime? lastCompletionTime) {
  try {
    // If never completed before → allow
    if (lastCompletionTime == null) {
      return true;
    }

    final now = DateTime.now();

    // Calculate difference
    final difference = now.difference(lastCompletionTime);

    // Check if 20 hours passed
    return difference.inHours >= 15;
  } catch (e) {
    return false;
  }
}

String? convertToBullets(List<String>? topics) {
  if (topics == null || topics.isEmpty) {
    return "";
  }

  // Remove empty or null values
  final cleaned = topics.where((t) => t.trim().isNotEmpty).toList();

  if (cleaned.isEmpty) {
    return "";
  }

  // Convert to bullet format
  return cleaned.map((t) => "- $t").join("\n");
}

int? retrurnPrevious(int? value) {
  return (value ?? 0) - 1;
}
