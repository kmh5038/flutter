import 'package:flutter/material.dart';

// TODO: 예제 탭의 '그라데이션 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: LinearGradient, BoxShadow, Container, 다크 배경

class MyGradientProfileCardPage extends StatelessWidget {
  const MyGradientProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 그라데이션 프로필 카드')),
      body: const Center(
        child: Text(
          '여기에 그라데이션 프로필 카드를 만들어보세요!\n\n'
          '목표:\n'
          '• 그라데이션 배경 카드\n'
          '• 흰색 텍스트 + 반투명 통계 박스\n'
          '• Message / Follow 버튼',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
