import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/check_box.dart';
import 'package:flutter_application/components/input.dart';
import 'package:flutter_application/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool agreement = false;
  double calculation = 0;
  final ValueNotifier<bool> checkBoxNotifier = ValueNotifier<bool>(false);

  double calculate(double mass, double radius) {
    double g = 6.674 * pow(10, -11);
    return sqrt((g * mass) / radius);
  }

  void updateCheckbox(bool arg) {
    checkBoxNotifier.value = !arg;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController massController = TextEditingController();
    final TextEditingController radiusController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Жвакин Егор Андреевич 421-2"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    label: "Масса небесного тела",
                    errorMessage: "Поле должно быть заполнено!",
                    controller: massController,
                  ),
                  CustomTextField(
                    label: "Радиус небесного тела",
                    errorMessage: "Поле должно быть заполнено!",
                    controller: radiusController,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: checkBoxNotifier,
                    builder: (context, prikol, child) {
                      return const CustomCheckBox();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (CustomCheckBoxState.agreement == false) {
                        formKey.currentState!.validate();
                        updateCheckbox(CustomCheckBoxState.agreement);
                      } else if (formKey.currentState!.validate()) {
                        calculation = calculate(
                          double.parse(massController.text),
                          double.parse(radiusController.text),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecondPage(calculation: calculation),
                          ),
                        );
                      }
                    },
                    child: const Text("Вычислить космическую скорость"),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: checkBoxNotifier,
              builder: (context, prikol, child) {
                return prikol == false
                    ? const SizedBox(height: 20)
                    : const Text(
                        "Не будет тогда никакой космической скорости",
                        style: TextStyle(color: Colors.red),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
