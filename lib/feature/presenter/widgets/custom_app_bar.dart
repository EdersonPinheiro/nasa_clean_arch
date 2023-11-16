import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final Size preferredSize;
  final String title;
  const CustomAppBar(
      {super.key, required this.preferredSize, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      backgroundColor: Color(0xFF233C5C),
    );
  }
}
