import "package:flutter/material.dart";

void showNoteDialog(
  {
    required BuildContext context,
    required ValueChanged<String> onSaved,
  }
){
  showDialog(
    context: context,
    builder: (context) => NoteDialog(
      onSaved: onSaved,
    ),
  );
}