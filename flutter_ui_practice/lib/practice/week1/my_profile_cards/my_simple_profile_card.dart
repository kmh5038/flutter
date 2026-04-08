import 'package:flutter/material.dart';

// TODO: 예제 탭의 '심플 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: Column, CircleAvatar, Card, BorderRadius

class MySimpleProfileCardPage extends StatelessWidget {
  const MySimpleProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final String name = 'Liam';
    final String job = 'Flutter developer';
    final String country = 'soeul, south korea';
    return Scaffold(
        appBar: AppBar(
          title: const Text('내 심플 프로필 카드'),
          backgroundColor: colorScheme.inversePrimary,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.indigoAccent, shape: BoxShape.rectangle),
            child: Column(
              children: [
                Spacer(flex: 1),
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        shape: BoxShape.circle)),
                SizedBox(height: 30),
                Text(name),
                Spacer(flex: 1)
              ],
            ),
          ),
        ));
  }
}
