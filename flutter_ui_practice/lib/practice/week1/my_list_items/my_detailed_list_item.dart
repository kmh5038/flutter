import 'package:flutter/material.dart';

// TODO: 예제 탭의 '상세 리스트'를 보고 직접 만들어보세요!
// 힌트: ListView.builder, Card, Row + Column 커스텀 레이아웃

class MyDetailedListItemPage extends StatelessWidget {
  const MyDetailedListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 상세 리스트')),
      body: const Center(
        child: Text(
          '여기에 상세 리스트를 만들어보세요!\n\n'
          '목표:\n'
          '• 강좌 카드 형태의 리스트\n'
          '• 아이콘 + 제목 + 평점 + 가격\n'
          '• ListView.builder 사용',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
