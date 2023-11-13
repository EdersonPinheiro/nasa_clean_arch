import 'package:dartz/dartz.dart';

import 'package:nasa_clean_arch/core/errors/failures.dart';

import '../../../core/usecase/usecase.dart';
import '../entitie/space_media_entity.dart';
import '../repositories/space_media_repository.dart';

class GetSpaceFromDateUseCase implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceFromDateUseCase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}