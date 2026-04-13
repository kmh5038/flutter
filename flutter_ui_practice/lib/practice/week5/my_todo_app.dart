import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

// TODO: 예제 탭의 'TODO 앱'을 보고 직접 만들어보세요!
// 힌트:
//  1. Todo 모델 클래스: id, title, isDone
//  2. TodoProvider (ChangeNotifier): _todos 리스트
//     - add(title): 새 할 일 추가
//     - toggle(id): 완료 토글
//     - remove(id): 삭제
//     - edit(id, newTitle): 수정
//  3. ChangeNotifierProvider로 트리에 주입
//  4. Consumer<TodoProvider>로 목록 표시
//  5. context.read<TodoProvider>()로 CRUD 호출
//  6. Dismissible로 스와이프 삭제

// ── 여기에 Todo 모델 + TodoProvider를 작성하세요 ──

class MyTodoAppPage extends StatelessWidget {
  const MyTodoAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: ChangeNotifierProvider로 감싸기
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 할 일 앱'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('여기에 TODO 앱을 구현하세요'),
      ),
    );
  }
}
