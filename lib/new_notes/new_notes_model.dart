import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'new_notes_widget.dart' show NewNotesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewNotesModel extends FlutterFlowModel<NewNotesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Title is required';
    }

    return null;
  }

  // State field(s) for notepad widget.
  FocusNode? notepadFocusNode;
  TextEditingController? notepadTextController;
  String? Function(BuildContext, String?)? notepadTextControllerValidator;
  String? _notepadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'notepad........ is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    notepadTextControllerValidator = _notepadTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    notepadFocusNode?.dispose();
    notepadTextController?.dispose();
  }
}
