import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/core/utils/converters/date_converter.dart';
import 'package:nasa_clean_arch/feature/data/datasources/space_media_data_source_implementation.dart';
import 'package:nasa_clean_arch/feature/data/repositories/space_media_repository_implementation.dart';
import 'package:nasa_clean_arch/feature/presenter/controllers/home_controller.dart';
import 'package:nasa_clean_arch/feature/presenter/pages/home_page.dart';
import 'package:http/http.dart' as http;

import 'feature/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(HomeController.new);
    i.add(SpaceMediaRepositoryImplementation.new);
    i.add(NasaDataSourceImplementation.new);
    i.add(http.Client.new);
    i.add((i) => DateToStringConverter.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => HomePage());
    r.child("/picture", child: (context) => PicturePage());
  }
}
