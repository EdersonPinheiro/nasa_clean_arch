import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showDescriptionBottomSheet(
    {required BuildContext context,
    required String title,
    required String description}) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                     textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        );
      });
}
