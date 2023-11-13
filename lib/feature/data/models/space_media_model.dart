import 'package:nasa_clean_arch/feature/domain/entitie/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  SpaceMediaModel(
      {required super.description,
      required super.mediaType,
      required super.title,
      required super.mediaUrl});

  //Ao chamar o metodo factory retorna uma nova instancia da classe passa um parametro e recebe um objeto
  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) =>
      SpaceMediaModel(
          description: json['explanation'],
          mediaType: json['media_type'],
          title: json['title'],
          mediaUrl: json['url']);

  Map<String, dynamic> toJson() => {
        'explanation': description,
        'mediaType': mediaType,
        'title': title,
        'url': mediaUrl
      };
}
