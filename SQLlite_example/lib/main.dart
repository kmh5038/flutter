import 'package:flutter/material.dart';
import 'package:sqlflite_example/my_router.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: myRouter,
      title: 'TODO'
    );
  }
}
