import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  const NoteDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Warning'),
      content: const Text('Are you sure you want to delete this note?'),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        ElevatedButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
