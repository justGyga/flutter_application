import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final double calculation;

  const SecondPage({super.key, required this.calculation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Жвакин Егор Андреевич 421-2"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Первая космическая скорость равна: $calculation",
        ),
      ),
    );
  }
}
