import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Жвакин Егор Андреевич 421-2"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Не будет тогда ни какой космической скорости",
        ),
      ),
    );
  }
}
