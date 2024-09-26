import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  static bool agreement = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: agreement,
        title: const Text("Я согласен что вчерашний видос был смешной"),
        onChanged: (bool? value) => setState(() => agreement = !agreement));
  }
}
