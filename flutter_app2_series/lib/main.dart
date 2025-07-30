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
      title: 'Eu Amo Séries 🎬',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Text('Hello World with Dart-Flutter'),
        ),
      ), // Scaffold is misspelled here, it should be Scaffold
    );
  }
}