class Note {
  String id;
  String title;
  List<String>? imageUrls;
  String post_name;
  int good_number;
  DateTime? createdTime;
  String field;

  Note(
      {this.id = '',
      this.title = '',
      this.imageUrls,
      this.post_name = '',
      this.good_number = 0,
      this.field = '',
      this.createdTime});
}
