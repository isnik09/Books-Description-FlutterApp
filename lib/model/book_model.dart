// FROM JSON TO DART WEBSITE...
// HERE WE CREATED MODEL FOR BOOKS FROM JSON PROVIDED BY LINK...
class BookModel {
  String? title;
  String? isbn;
  int? pageCount;
  String? thumbnailUrl;
  String? shortDescription;
  String? longDescription;
  String? status;
  List<String>? authors;
  List<String>? categories;

  PublishedDate? publishedDate;

  BookModel(
      {this.title,
      this.isbn,
      this.pageCount,
      this.publishedDate,
      this.thumbnailUrl,
      this.shortDescription,
      this.longDescription,
      this.status,
      this.authors,
      this.categories});

  BookModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isbn = json['isbn'];
    pageCount = json['pageCount'];
    publishedDate = json['publishedDate'] != null
        ? PublishedDate.fromJson(json['publishedDate'])
        : PublishedDate.fromJson({"\$date": "0000-00-00T00:00:00.000-0000"});
    thumbnailUrl = json['thumbnailUrl'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    status = json['status'];
    authors = json['authors'].cast<String>();
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isbn'] = isbn;
    data['pageCount'] = pageCount;
    if (publishedDate != null) {
      data['publishedDate'] = publishedDate!.toJson();
    }
    data['thumbnailUrl'] = thumbnailUrl;
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    data['status'] = status;
    data['authors'] = authors;
    data['categories'] = categories;
    return data;
  }
}

class PublishedDate {
  late String date;

  PublishedDate({required this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['\$date'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['\$date'] = date;

    return data;
  }
}
