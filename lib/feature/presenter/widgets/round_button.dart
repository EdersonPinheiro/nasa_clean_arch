import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Function onTap;
  const RoundButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).colorScheme.background),
        child: Text(label,
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
      onTap: onTap as Function(),
    );
  }
}
