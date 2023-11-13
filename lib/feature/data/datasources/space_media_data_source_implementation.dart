import 'dart:convert';

import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/utils/converters/date_converter.dart';
import 'package:nasa_clean_arch/core/utils/keys/nasa_api_keys.dart';
import 'package:nasa_clean_arch/feature/data/datasources/endpoints/nada_endpoints.dart';

import '../models/space_media_model.dart';
import 'space_media_data_source.dart';

class SpaceMediaDataSourceImplementation implements ISpaceMediaDatasource {
  @override
  final HttpClient client;
  SpaceMediaDataSourceImplementation(this.client);

  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndpoints.apod(
        NasaApiKeys.apiKey, DateToStringConverter.convert(date)));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.toString()));
    } else {
      return SpaceMediaModel(
          description: 'description',
          mediaType: 'mediaType',
          title: 'title',
          mediaUrl: ' mediaUrl');
    }
  }
}
