import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Eu Amo Séries 🎬'),
        ),
          body: const Center(child: Text('Hello World with Dart-Flutter'),
        ),
      ), // Scaffold is misspelled here, it should be Scaffold
    );
  }
}