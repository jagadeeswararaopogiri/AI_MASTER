import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "matter" field.
  String? _matter;
  String get matter => _matter ?? '';
  bool hasMatter() => _matter != null;

  // "lastTime" field.
  DateTime? _lastTime;
  DateTime? get lastTime => _lastTime;
  bool hasLastTime() => _lastTime != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _matter = snapshotData['matter'] as String?;
    _lastTime = snapshotData['lastTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  DocumentReference? userRef,
  String? title,
  String? matter,
  DateTime? lastTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'title': title,
      'matter': matter,
      'lastTime': lastTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.title == e2?.title &&
        e1?.matter == e2?.matter &&
        e1?.lastTime == e2?.lastTime;
  }

  @override
  int hash(NotesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.title, e?.matter, e?.lastTime]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
