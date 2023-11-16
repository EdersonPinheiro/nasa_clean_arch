import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageNetworkWithLoader extends StatelessWidget {
  final String url;
  const ImageNetworkWithLoader({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        minScale: 0.1,
        maxScale: 4,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null),
            );
          },
        ));
  }
}
