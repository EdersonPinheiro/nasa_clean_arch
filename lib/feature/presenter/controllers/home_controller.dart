import 'package:flutter_triple/flutter_triple.dart';
import 'package:nasa_clean_arch/feature/domain/usecase/get_space_media_from_data_usecase.dart';
import '../../../core/errors/failures.dart';
import '../../domain/entitie/space_media_entity.dart';

class HomeController extends Store{
  final GetSpaceFromDateUseCase usecase;
  HomeController(this.usecase)
      : super(SpaceMediaEntity(
            description: '', mediaType: '', title: '', mediaUrl: null));

  getSpaceMediaFromDate(DateTime date) async {
    setLoading(true);

    final result = await usecase(date);

    result.fold((error) => setError(error), (sucess) => update(sucess));
    setLoading(false);
  }
}
