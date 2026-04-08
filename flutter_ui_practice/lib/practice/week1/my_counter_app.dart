import 'package:flutter/material.dart';

// TODO: 예제 탭의 '향상된 카운터'를 보고 직접 만들어보세요!
// 힌트: StatefulWidget, setState, Container, BoxDecoration

class MyCounterApp extends StatefulWidget {
  const MyCounterApp({super.key});

  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

class _MyCounterAppState extends State<MyCounterApp> {
  int _number = 0;

  void _increment() {
    setState(() {
      _number += 1;
    });
  }

  void _decrement() {
    setState(() {
      if (_number > 0) {
        _number -= 1;
      }
    });
  }

  void _reset() {
    setState(() {
      _number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 카운터 앱'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: [
        Spacer(flex: 3),
        Text(
          '현재 카운트',
          style: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: colorScheme.inversePrimary,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text('$_number',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              icon: Icons.remove,
              text: '감소',
              onPressed: _decrement,
            ),
            SizedBox(width: 40),
            CircleButton(
              icon: Icons.refresh,
              text: '초기화',
              onPressed: _reset,
            ),
            SizedBox(width: 40),
            CircleButton(
              icon: Icons.add,
              text: '증가',
              onPressed: _increment,
            )
          ],
        ),
        Spacer(flex: 4)
      ]),
    );
  }
}

class CircleButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const CircleButton(
      {super.key, required this.icon, required this.text, this.onPressed});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onPressed!();
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(), // 원형 모양 설정
            padding: EdgeInsets.all(20), // 크기 조절
          ),
          child: Icon(widget.icon),
        ),
        SizedBox(height: 20),
        Text(widget.text)
      ],
    );
  }
}
