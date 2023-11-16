import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/feature/domain/usecase/get_space_media_from_data_usecase.dart';
import 'package:nasa_clean_arch/feature/presenter/controllers/home_controller.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/space_media_entity_mock.dart';

class MockGetSpaceMediaFromDateUseCase extends Mock
    implements GetSpaceFromDateUseCase {}

void main() {
  late HomeController homeController;
  late GetSpaceFromDateUseCase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUseCase();
    homeController = HomeController(mockUsecase);
  });

  test(
      'Should return a SpaceMedia from the usecase',
      () async => {
            when(() => mockUsecase(any()))
                .thenAnswer((_) async => const Right(tSpaceMedia)),
            await homeController.getSpaceMediaFromDate(dateTime),
            homeController.observer(onState: (state) {
              expect(state, tSpaceMedia);
              verify(() => mockUsecase(dateTime)).called(1);
            })
          });

  final tFailure = ServerFailure();

  test(
      'Should return a Failure from the usecase when there is an error',
      () async => {
            when(() => mockUsecase(any()))
                .thenAnswer((_) async => Left(tFailure)),
            await homeController.getSpaceMediaFromDate(dateTime),
            homeController.observer(onError: (error) {
              expect(error, tFailure);
            }),

            verify(() => mockUsecase(dateTime)).called(1)
          });
}
