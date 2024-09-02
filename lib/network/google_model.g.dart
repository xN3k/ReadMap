// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBook _$GoogleBookFromJson(Map<String, dynamic> json) => GoogleBook(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      publisher: json['publisher'] as String,
      publishedDate: json['publishedDate'] as String,
      description: json['description'] as String,
      industryIdentifiers:
          Map<String, String>.from(json['industryIdentifiers'] as Map),
      pageCount: (json['pageCount'] as num).toInt(),
      language: json['language'] as String,
      imageLinks: Map<String, String>.from(json['imageLinks'] as Map),
      previewLink: json['previewLink'] as String,
      infoLink: json['infoLink'] as String,
    );

Map<String, dynamic> _$GoogleBookToJson(GoogleBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'pageCount': instance.pageCount,
      'language': instance.language,
      'imageLinks': instance.imageLinks,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
    };
