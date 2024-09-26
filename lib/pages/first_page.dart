import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/components/check_box.dart';
import 'package:flutter_application/components/input.dart';
import 'package:flutter_application/pages/error_page.dart';
import 'package:flutter_application/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool agreement = false;
  double calculation = 0;

  double calculate(double mass, double radius) {
    double g = 6.674 * pow(10, -11); // Гравитационная постоянная
    return sqrt((g * mass) / radius);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController massController = TextEditingController();
    final TextEditingController radiusController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Жвакин Егор Андреевич 421-2"),
          centerTitle: true,
          // title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: [
            Form(
                child: Column(
              children: [
                CustomTextField(
                  label: "Масса небесного тела",
                  controller: massController,
                ),
                CustomTextField(
                  label: "Радиус небесного тела",
                  controller: radiusController,
                ),
                const CustomCheckBox()
              ],
            )),
            ElevatedButton(
                onPressed: () => {
                      if (CustomCheckBoxState.agreement == false)
                        {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ErrorPage()))}
                      else
                        {
                          calculation = calculate(
                              double.parse(massController.text),
                              double.parse(radiusController.text)),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecondPage(calculation: calculation)))
                        }
                    },
                child: const Text("Вычеслить космическую скорость")),
          ],
        )));
  }
}
