import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

// TODO: 예제 탭의 'MultiProvider TODO'를 보고 직접 만들어보세요!
// 힌트:
//  1. TodoListProvider (ChangeNotifier): 목록 CRUD
//  2. FilterProvider (ChangeNotifier): TodoFilter enum (all, active, done)
//  3. MultiProvider로 두 Provider 동시에 주입
//  4. SegmentedButton으로 필터 전환
//  5. context.watch<FilterProvider>()로 현재 필터 읽기
//  6. context.watch<TodoListProvider>()로 목록 읽기
//  7. 두 Provider를 조합해 필터링된 목록 표시

// ── 여기에 TodoListProvider + FilterProvider를 작성하세요 ──

class MyMultiProviderTodoPage extends StatelessWidget {
  const MyMultiProviderTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: MultiProvider로 감싸기
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 MultiProvider 할 일'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('여기에 MultiProvider TODO를 구현하세요'),
      ),
    );
  }
}
