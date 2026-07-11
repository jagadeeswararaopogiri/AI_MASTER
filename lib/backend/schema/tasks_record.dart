import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "taskNumber" field.
  int? _taskNumber;
  int get taskNumber => _taskNumber ?? 0;
  bool hasTaskNumber() => _taskNumber != null;

  // "topics" field.
  List<String>? _topics;
  List<String> get topics => _topics ?? const [];
  bool hasTopics() => _topics != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "isUnlocked" field.
  bool? _isUnlocked;
  bool get isUnlocked => _isUnlocked ?? false;
  bool hasIsUnlocked() => _isUnlocked != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _taskNumber = castToType<int>(snapshotData['taskNumber']);
    _topics = getDataList(snapshotData['topics']);
    _summary = snapshotData['summary'] as String?;
    _status = snapshotData['status'] as String?;
    _isUnlocked = snapshotData['isUnlocked'] as bool?;
    _score = castToType<int>(snapshotData['score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DocumentReference? userRef,
  int? taskNumber,
  String? summary,
  String? status,
  bool? isUnlocked,
  int? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'taskNumber': taskNumber,
      'summary': summary,
      'status': status,
      'isUnlocked': isUnlocked,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.taskNumber == e2?.taskNumber &&
        listEquality.equals(e1?.topics, e2?.topics) &&
        e1?.summary == e2?.summary &&
        e1?.status == e2?.status &&
        e1?.isUnlocked == e2?.isUnlocked &&
        e1?.score == e2?.score;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.taskNumber,
        e?.topics,
        e?.summary,
        e?.status,
        e?.isUnlocked,
        e?.score
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
