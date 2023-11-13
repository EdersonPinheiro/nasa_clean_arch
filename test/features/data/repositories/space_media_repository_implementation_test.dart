import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/exceptions.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/feature/data/datasources/space_media_data_source.dart';
import 'package:nasa_clean_arch/feature/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/feature/data/repositories/space_media_repository_implementation.dart';

class MockSpacMediaDataSource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource dataSource;

  setUp(() {
    dataSource = MockSpacMediaDataSource();
    repository = SpaceMediaRepositoryImplementation(dataSource: dataSource);
  });

  final DateTime dateTime = DateTime(2023, 06, 07);

  final tSpaceMediaModel = SpaceMediaModel(
      description: 'description',
      mediaType: ' mediaType',
      title: 'title',
      mediaUrl: 'mediaUrl');

  test('Should return space media model when calls the datasource', () async {
    when(() => dataSource.getSpaceMediaFromDate(dateTime))
        .thenAnswer((_) async => tSpaceMediaModel);

    final result = await repository.getSpaceMediaFromDate(dateTime);
    expect(result, Right(tSpaceMediaModel));

    verify(() => dataSource.getSpaceMediaFromDate(dateTime)).called(1);
  });

  test(
      'Should return a server failure when the call to the datasource is unsuccessful',
      () async {
    when(() => dataSource.getSpaceMediaFromDate(dateTime))
        .thenThrow(ServerException());

    final result = await repository.getSpaceMediaFromDate(dateTime);

    // Corrected the expectation to instantiate ServerFailure
    expect(result, Left(ServerFailure()));

    verify(() => dataSource.getSpaceMediaFromDate(dateTime)).called(1);
  });
}
