import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

// TODO: 예제 탭의 'Provider 카운터'를 보고 직접 만들어보세요!
// 힌트:
//  1. ChangeNotifier를 상속하는 CounterModel 클래스 만들기
//  2. _count 필드 + increment / decrement / reset 메서드
//  3. notifyListeners()로 UI에 변경 알리기
//  4. ChangeNotifierProvider로 위젯 트리에 모델 주입
//  5. Consumer<CounterModel>로 숫자 부분만 리빌드
//  6. context.read<CounterModel>()로 버튼 이벤트 처리

// ── 여기에 ChangeNotifier 클래스를 작성하세요 ──

class MyCounterWithProviderPage extends StatelessWidget {
  const MyCounterWithProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: ChangeNotifierProvider로 감싸기
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 Provider 카운터'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('여기에 Provider 카운터를 구현하세요'),
      ),
    );
  }
}
