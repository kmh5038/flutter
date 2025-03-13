import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sqlflite_example/views/home.dart';
import 'package:sqlflite_example/views/register_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'TODO',
      theme: ThemeData(
        primaryColor: const Color(0xff64b5f6),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff64b5f6)),
      ),
    );
  }
}

final GoRouter _router = GoRouter(initialLocation: '/home', routes: [
  GoRoute(path: '/home', builder: (context, state) => Home()),
  GoRoute(path: '/RegisterTodo', builder: (context, state) => RegisterTodo())
]);
