import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/feature/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/feature/domain/entitie/space_media_entity.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
      description: "Fifty years ago this Sunday (February 7, 1971)",
      mediaType: "image",
      title: "Apollo 14 Heads for Home",
      mediaUrl:
          "https://apod.nasa.gov/apod/image/2102/AS14-71-9845v2wmktwtr4Jerry.jpg");

  test('Should be a subclass of SpaceMediaEntity', () async {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('Should return a valid model', () async {
    final Map<String, dynamic> jsonMap = jsonDecode(spaceMediaMock);

    final result = SpaceMediaModel.fromJson(jsonMap);

    expect(result, tSpaceMediaModel);
  });

  test('Should return a json map containing the proper data', () async {
    final expectedMap = {
      "explanation": "Fifty years ago this Sunday (February 7, 1971)",
      "mediaType": "image",
      "title": "Apollo 14 Heads for Home",
      "url":
          "https://apod.nasa.gov/apod/image/2102/AS14-71-9845v2wmktwtr4Jerry.jpg"
    };

    final result = tSpaceMediaModel.toJson();

    expect(result, expectedMap);
  });
}
