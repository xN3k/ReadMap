import 'package:json_annotation/json_annotation.dart';

part 'google_model.g.dart';

@JsonSerializable()
class GoogleBook {
  final String id;
  final String title;
  final String subtitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final Map<String, String> industryIdentifiers;
  final int pageCount;
  final String language;
  final Map<String, String> imageLinks;
  final String previewLink;
  final String infoLink;
  GoogleBook({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.pageCount,
    required this.language,
    required this.imageLinks,
    required this.previewLink,
    required this.infoLink,
  });

  factory GoogleBook.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookToJson(this);
}
