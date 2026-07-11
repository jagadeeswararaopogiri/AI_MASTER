import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiChatRecord extends FirestoreRecord {
  AiChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "userText" field.
  String? _userText;
  String get userText => _userText ?? '';
  bool hasUserText() => _userText != null;

  // "aiText" field.
  String? _aiText;
  String get aiText => _aiText ?? '';
  bool hasAiText() => _aiText != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _userText = snapshotData['userText'] as String?;
    _aiText = snapshotData['aiText'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aiChat');

  static Stream<AiChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiChatRecord.fromSnapshot(s));

  static Future<AiChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiChatRecord.fromSnapshot(s));

  static AiChatRecord fromSnapshot(DocumentSnapshot snapshot) => AiChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiChatRecordData({
  DocumentReference? userRef,
  String? userText,
  String? aiText,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'userText': userText,
      'aiText': aiText,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiChatRecordDocumentEquality implements Equality<AiChatRecord> {
  const AiChatRecordDocumentEquality();

  @override
  bool equals(AiChatRecord? e1, AiChatRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.userText == e2?.userText &&
        e1?.aiText == e2?.aiText &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(AiChatRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.userText, e?.aiText, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is AiChatRecord;
}
