import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/feature/domain/entitie/space_media_entity.dart';
import 'package:nasa_clean_arch/feature/domain/repositories/space_media_repository.dart';

import '../../../core/errors/exceptions.dart';
import '../datasources/space_media_data_source.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final client = Modular.get<SpaceMediaRepositoryImplementation>();
  final ISpaceMediaDatasource dataSource;

  SpaceMediaRepositoryImplementation({required this.dataSource});

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      final result = await dataSource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
