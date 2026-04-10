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
            width: 220,
            height: 300,
            decoration: BoxDecoration(
                color: colorScheme.inversePrimary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Spacer(flex: 1),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'LM',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF6750A4), shape: BoxShape.circle)),
                SizedBox(height: 15),
                Text(
                  name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(job,
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w500)),
                SizedBox(height: 15),
                Container(
                  width: 150,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFF6750A4).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    country,
                    style: TextStyle(
                        color: Color(0xFF6750A4), fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(flex: 1)
              ],
            ),
          ),
        ));
  }
}
