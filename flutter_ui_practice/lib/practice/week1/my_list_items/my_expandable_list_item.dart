import 'package:flutter/material.dart';

// TODO: 예제 탭의 '확장 가능 리스트'를 보고 직접 만들어보세요!
// 힌트: StatefulWidget, AnimatedCrossFade, AnimatedRotation

class MyExpandableListItemPage extends StatelessWidget {
  const MyExpandableListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 확장 가능 리스트')),
      body: const Center(
        child: Text(
          '여기에 확장 가능 리스트를 만들어보세요!\n\n'
          '목표:\n'
          '• 탭하면 펼쳐지는 FAQ 카드\n'
          '• 화살표 회전 애니메이션\n'
          '• 부드러운 열기/닫기 전환',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
        ),
      ),
    );
  }
}
