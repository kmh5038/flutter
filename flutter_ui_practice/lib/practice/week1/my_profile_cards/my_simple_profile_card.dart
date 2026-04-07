import 'package:flutter/material.dart';

// TODO: 예제 탭의 '심플 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: Column, CircleAvatar, Card, BorderRadius

class MySimpleProfileCardPage extends StatelessWidget {
  const MySimpleProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 심플 프로필 카드')),
      body: const Center(
        child: Text(
          '여기에 심플 프로필 카드를 만들어보세요!\n\n'
          '목표:\n'
          '• 원형 아바타 (이니셜)\n'
          '• 이름 + 직업\n'
          '• 위치 뱃지',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
