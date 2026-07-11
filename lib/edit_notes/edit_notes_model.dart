import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_notes_widget.dart' show EditNotesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditNotesModel extends FlutterFlowModel<EditNotesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for notepadnew widget.
  FocusNode? notepadnewFocusNode;
  TextEditingController? notepadnewTextController;
  String? Function(BuildContext, String?)? notepadnewTextControllerValidator;
  String? _notepadnewTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'notepad........ is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    notepadnewTextControllerValidator = _notepadnewTextControllerValidator;
  }

  @override
  void dispose() {
    notepadnewFocusNode?.dispose();
    notepadnewTextController?.dispose();
  }
}
