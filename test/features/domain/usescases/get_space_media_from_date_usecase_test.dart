import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/feature/domain/entitie/space_media_entity.dart';
import 'package:nasa_clean_arch/feature/domain/repositories/space_media_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/feature/domain/usecase/get_space_media_from_data_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceFromDateUseCase useCase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    useCase = GetSpaceFromDateUseCase(repository);
  });

  final DateTime dateTime = DateTime(2023, 06, 07);

  test(
    'Should get space media entity for a given date from the repository',
    () async {
      const tSpaceMedia = SpaceMediaEntity(
        description: 'description',
        mediaType: 'mediaType',
        title: 'title',
        mediaUrl: 'mediaUrl',
      );

      when(() => repository.getSpaceMediaFromDate(dateTime))
          .thenAnswer((_) async => const Right(tSpaceMedia));

      final result = await useCase(dateTime);

      expect(result, const Right(tSpaceMedia));

      verify(() => repository.getSpaceMediaFromDate(
          dateTime)).called(1); // Verify the correct method is called
    },
  );

  test('Should return a ServerFailure when don\'t suceed', () async {
    when(() => repository.getSpaceMediaFromDate(dateTime)).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));

    final result = await useCase(dateTime);

    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(dateTime)).called(1);
  });
}
