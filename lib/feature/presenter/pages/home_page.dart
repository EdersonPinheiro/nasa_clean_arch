import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:nasa_clean_arch/feature/presenter/controllers/home_controller.dart';
import 'package:nasa_clean_arch/feature/presenter/widgets/round_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController store =
      Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
            children: [
              Text(
                "Welcome to Astronomy Picture Every Day!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(height: 150),
              RoundButton(
                  label: "Select datetime",
                  onTap: () async {
                    var dataPicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1995, 06, 16),
                        lastDate: DateTime.now());
                    await store.getSpaceMediaFromDate(dataPicked!);
                  })
            ],
          )),
        ),
      ),
    );
  }
}
