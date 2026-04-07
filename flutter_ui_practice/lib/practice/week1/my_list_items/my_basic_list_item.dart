import 'package:flutter/material.dart';

// TODO: 예제 탭의 '기본 리스트'를 보고 직접 만들어보세요!
// 힌트: ListView, ListTile, 섹션 헤더 패턴

class MyBasicListItemPage extends StatelessWidget {
  const MyBasicListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 기본 리스트')),
      body: const Center(
        child: Text(
          '여기에 기본 리스트를 만들어보세요!\n\n'
          '목표:\n'
          '• 설정 앱 스타일의 ListTile\n'
          '• 섹션 구분 헤더\n'
          '• 아이콘 + 제목 + 부제목 + 화살표',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
