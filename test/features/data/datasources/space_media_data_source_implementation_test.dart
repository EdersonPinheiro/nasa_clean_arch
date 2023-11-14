import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/exceptions.dart';
import 'package:nasa_clean_arch/core/utils/converters/date_converter.dart';
import 'package:nasa_clean_arch/feature/data/datasources/space_media_data_source.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/feature/data/datasources/space_media_data_source_implementation.dart';
import 'package:nasa_clean_arch/feature/data/models/space_media_model.dart';
import '../../../mocks/space_media_mock.dart';

class HttpClientMocking extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMocking();
    datasource = NasaDataSourceImplementation(client);
  });

  final DateTime dateTime = DateTime(2023, 06, 07);
  final urlExpected =
      "https://api.nasa.gov/planetary/apod?hd=true&api_key=DEMO_KEY&date=2023-06-07";
  void sucessMock() {
    when(() => client.get(captureAny())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test('Should call the get method with correct url', () async {
    sucessMock();

    await datasource.getSpaceMediaFromDate(dateTime);

    verify(() => client.get(urlExpected)).called(1);
  });

  test('Should return a SpaceMediaModel when is sucessfull', () async {
    sucessMock();

    final tSpaceMediaModelExpected = SpaceMediaModel(
        description: "Fifty years ago this Sunday (February 7, 1971)",
        mediaType: "image",
        title: "Apollo 14 Heads for Home",
        mediaUrl:
            "https://apod.nasa.gov/apod/image/2102/AS14-71-9845v2wmktwtr4Jerry.jpg");

    final result = await datasource.getSpaceMediaFromDate(dateTime);

    expect(result, tSpaceMediaModelExpected);
  });

  test('Should throw a ServerException when the call is unccessful', () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'Something went wrong', statusCode: 400));

    final result = datasource.getSpaceMediaFromDate(dateTime);

    expect(() => result, throwsA(ServerException()));
  });
}
