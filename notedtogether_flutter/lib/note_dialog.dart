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

class NoteDialog extends StatefulWidget
{
  const NoteDialog({
    required this.onSaved,
    super.key,
  });

  final ValueChanged<String> onSaved;

  @override
  NoteDialogState createState() => NoteDialogState();
}

class NoteDialogState extends State<NoteDialog>
{
  final TextEditingController controller = TextEditingController();
}