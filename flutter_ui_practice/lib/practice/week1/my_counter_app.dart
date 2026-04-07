import 'package:flutter/material.dart';

// TODO: 예제 탭의 '향상된 카운터'를 보고 직접 만들어보세요!
// 힌트: StatefulWidget, setState, Container, BoxDecoration

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 카운터 앱'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Hello, World!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
