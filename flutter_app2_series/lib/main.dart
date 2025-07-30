import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class HomePage extend StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eu Amo Séries 🎬')),
      body: ListView(children: const [
        ListTile(
          leading: Icon(Icons.tv),
          title: Text('Breaking Bad'),
          subtitle: Text('5 temporadas'),
        ),
        ListTile(
          leading: Icon(Icons.tv),
          title: Text('Stranger Things'),
          subtitle: Text('4 temporadas'),
        ),
        ListTile(
          leading: Icon(Icons.tv),
          title: Text('Game of Thrones'),
          subtitle: Text('8 temporadas'),
        ),
      ]
    );
  } // ListView is misspelled here, it should be ListView
} // HomePage is misspelled here, it should be HomePage