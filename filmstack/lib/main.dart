import 'package:flutter/material.dart';
import 'package:filmstack/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmStack',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomeScreen()
    );
  }
}

