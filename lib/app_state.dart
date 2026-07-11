import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  dynamic _lessonData;
  dynamic get lessonData => _lessonData;
  set lessonData(dynamic value) {
    _lessonData = value;
  }

  List<String> _userSelectedAnswers = [];
  List<String> get userSelectedAnswers => _userSelectedAnswers;
  set userSelectedAnswers(List<String> value) {
    _userSelectedAnswers = value;
  }

  void addToUserSelectedAnswers(String value) {
    userSelectedAnswers.add(value);
  }

  void removeFromUserSelectedAnswers(String value) {
    userSelectedAnswers.remove(value);
  }

  void removeAtIndexFromUserSelectedAnswers(int index) {
    userSelectedAnswers.removeAt(index);
  }

  void updateUserSelectedAnswersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userSelectedAnswers[index] = updateFn(_userSelectedAnswers[index]);
  }

  void insertAtIndexInUserSelectedAnswers(int index, String value) {
    userSelectedAnswers.insert(index, value);
  }

  dynamic _quizResult;
  dynamic get quizResult => _quizResult;
  set quizResult(dynamic value) {
    _quizResult = value;
  }

  int _currentTaskNumber = 0;
  int get currentTaskNumber => _currentTaskNumber;
  set currentTaskNumber(int value) {
    _currentTaskNumber = value;
  }

  int _totalAnswers = 0;
  int get totalAnswers => _totalAnswers;
  set totalAnswers(int value) {
    _totalAnswers = value;
  }

  int _completedTasks = 0;
  int get completedTasks => _completedTasks;
  set completedTasks(int value) {
    _completedTasks = value;
  }
}
