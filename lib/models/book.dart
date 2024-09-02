class Book {
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
  Book({
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

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: ['id'] as String,
      title: ['title'] as String,
      subtitle: ['subtitle'] as String,
      authors: ['authors'],
      publisher: ['publisher'] as String,
      publishedDate: ['publishedDate'] as String,
      description: ['description'] as String,
      industryIdentifiers: ['industryIdentifiers'] as Map<String, String>,
      pageCount: ['pageCount'] as int,
      language: ['language'] as String,
      imageLinks: ['imageLinks'] as Map<String, String>,
      previewLink: ['previewLink'] as String,
      infoLink: ['infoLink'] as String,
    );
  }
}
