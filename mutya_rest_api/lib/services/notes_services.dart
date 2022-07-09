import '../models/note_for_listing.dart';

class NotesService {
  List<NoteForListing> getNotesList() {
    return [
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
  }
}
