import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:nasa_clean_arch/core/errors/failures.dart';

import '../../../core/usecase/usecase.dart';
import '../entitie/space_media_entity.dart';
import '../repositories/space_media_repository.dart';

class GetSpaceFromDateUseCase implements Usecase<SpaceMediaEntity, DateTime> {
  final client = Modular.get<GetSpaceFromDateUseCase>();
  final ISpaceMediaRepository repository;

  GetSpaceFromDateUseCase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    return date != null
        ? await repository.getSpaceMediaFromDate(date)
        : left(NullParamsFailure());
  }
}
