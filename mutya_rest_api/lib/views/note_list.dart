import 'package:flutter/material.dart';

import '../models/note_for_listing.dart';
import 'note_delete.dart';
import 'note_modify.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key}) : super(key: key);

  final notes = [
    NoteForListing(
        noteID: "1",
        createdDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"),
    NoteForListing(
        noteID: "2",
        createdDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"),
    NoteForListing(
        noteID: "3",
        createdDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3"),
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (_, __) =>
              const Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context, builder: (_) => const NoteDelete());
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  child: Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                title: Text(
                  notes[index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                    'Last edited on ${formatDateTime(notes[index].latestEditDateTime!)}'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => NoteModify(noteID: notes[index].noteID)));
                },
              ),
            );
          },
          itemCount: notes.length),
    );
  }
}
