import 'package:flutter/material.dart';

// TODO: 예제 탭의 '액션 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: Wrap, Chip 스타일, InkWell, IconButton

class MyActionProfileCardPage extends StatelessWidget {
  const MyActionProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 액션 프로필 카드')),
      body: const Center(
        child: Text(
          '여기에 액션 프로필 카드를 만들어보세요!\n\n'
          '목표:\n'
          '• 프로필 정보 + Pro 뱃지\n'
          '• 스킬 태그 (Wrap)\n'
          '• 좋아요/메시지/공유/저장 액션',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
