class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime? createdDateTime;
  DateTime? latestEditDateTime;

  NoteForListing(
      {this.noteID = '',
      this.noteTitle = '',
      this.createdDateTime,
      this.latestEditDateTime});
}
