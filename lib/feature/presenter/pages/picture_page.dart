import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:nasa_clean_arch/feature/domain/entitie/space_media_entity.dart';
import 'package:nasa_clean_arch/feature/presenter/controllers/home_controller.dart';
import 'package:nasa_clean_arch/feature/presenter/widgets/custom_shimmer.dart';
import 'package:nasa_clean_arch/feature/presenter/widgets/description_bottom_sheet.dart';
import 'package:nasa_clean_arch/feature/presenter/widgets/image_network_with_loader.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  final HomeController store = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: store,
      onLoading: (context) => Center(child: CircularProgressIndicator()),
      onError: (context, error) => Center(
        child: Text(
          "An error ocurred, try again later.",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      onState: (context, SpaceMediaEntity spaceMedia) => GestureDetector(
        onVerticalDragUpdate: (update) {
          if (update.delta.dy < 0) {
            showDescriptionBottomSheet(
                context: context,
                title: spaceMedia.title,
                description: spaceMedia.description);
          }
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: spaceMedia.mediaType == 'video'
                  ? Center(child: Text('can\'t play the video'))
                  : spaceMedia.mediaUrl != null
                      ? ImageNetworkWithLoader(url: spaceMedia.mediaUrl!)
                      : Container(),
            ),
            Positioned(
                child: Container(
              color: Colors.black.withOpacity(0.2),
              child: CustomShimmer(
                  child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_up,
                    size: 35,
                  ),
                  Text(
                    'Slide up to see description',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              )),
            ))
          ],
        ),
      ),
    );
  }
}
