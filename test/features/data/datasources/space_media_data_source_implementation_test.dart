/*import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/feature/data/datasources/space_media_data_source.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/feature/data/datasources/space_media_data_source_implementation.dart';
import '../../../mocks/space_media_mock.dart';

class HttpClientMocking extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMocking();
    datasource = SpaceMediaDataSourceImplementation(client);
  });

  final DateTime dateTime = DateTime(2023, 06, 07);
  final urlExpected =
      "https://api.nasa.gov/planetary/apod?hd=true&api_key=DEMO_KEY&date=2021-02-05";
      

  test('Should call the get method with correct url', () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpReponse(data: spaceMediaMock, statusCode: 200);
    await datasource.getSpaceMediaFromDate(dateTime);

    verify(() => client.get(urlExpected)).called(1);
  });
}*/
