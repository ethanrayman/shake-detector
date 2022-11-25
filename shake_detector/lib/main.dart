import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(const ShakeApp());
}

class ShakeApp extends StatelessWidget {
  const ShakeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHAKE TO CHANGE IMAGE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SHAKE TO CHANGE IMAGE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.waitForStart(onPhoneShake: () {
      _selectedIndex = Random().nextInt(7) + 1;
    });

    detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/shake${_selectedIndex}.jpg'),
              fit: BoxFit.cover),
        ),
      )),
    );
  }
}
