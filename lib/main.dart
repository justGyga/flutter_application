import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Icon(Icons.ac_unit),
        centerTitle: true,
        // title: Text(widget.title),
      ),
      body: Center(
          child: Wrap(
        spacing: 15,
        children: [
          Container(
            width: 150,
            height: 150,
            color: Colors.red,
            child: const Center(child: Text("Жвакин Егор Андреевич")),
          ),
          Container(
            width: 150,
            height: 150,
            color: const Color.fromARGB(255, 230, 92, 82),
            child: const Center(child: Text("421-2")),
          ),
          Container(
            width: 150,
            height: 150,
            color: const Color.fromARGB(255, 233, 137, 131),
            child: const Center(child: Text("Вернит 421-4")),
          ),
          Container(
            width: 150,
            height: 150,
            color: const Color.fromARGB(255, 240, 185, 181),
            child: const Center(child: Text("Позязя")),
          ),
        ],
      )),
    );
  }
}
