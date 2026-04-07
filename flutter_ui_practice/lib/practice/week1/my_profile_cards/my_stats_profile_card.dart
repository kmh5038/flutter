import 'package:flutter/material.dart';

// TODO: 예제 탭의 '통계 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: Row + Column 조합, Divider, FilledButton

class MyStatsProfileCardPage extends StatelessWidget {
  const MyStatsProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 통계 프로필 카드')),
      body: const Center(
        child: Text(
          '여기에 통계 프로필 카드를 만들어보세요!\n\n'
          '목표:\n'
          '• 아바타 + 이름\n'
          '• 게시물/팔로워/팔로잉 통계 Row\n'
          '• 팔로우 버튼',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
