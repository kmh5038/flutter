import 'package:flutter/material.dart';

// TODO: 예제 탭의 '가로형 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: Row, Stack + Positioned (온라인 뱃지), Expanded

class MyHorizontalProfileCardPage extends StatelessWidget {
  const MyHorizontalProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 가로형 프로필 카드')),
      body: const Center(
        child: Text(
          '여기에 가로형 프로필 카드를 만들어보세요!\n\n'
          '목표:\n'
          '• Row 레이아웃 (아바타 + 정보 + 버튼)\n'
          '• 온라인 상태 표시 (초록 점)\n'
          '• 여러 장의 카드 나열',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
