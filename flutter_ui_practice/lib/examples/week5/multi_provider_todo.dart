import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ──────────────────────────────────────────────
// 모델
// ──────────────────────────────────────────────
enum TodoFilter { all, active, done }

class Todo {
  final String id;
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false})
      : id = DateTime.now().microsecondsSinceEpoch.toString();
}

// ──────────────────────────────────────────────
// Provider 1: 할 일 목록 관리
// ──────────────────────────────────────────────
class TodoListProvider extends ChangeNotifier {
  final List<Todo> _todos = [];
  List<Todo> get todos => List.unmodifiable(_todos);

  void add(String title) {
    if (title.trim().isEmpty) return;
    _todos.insert(0, Todo(title: title.trim()));
    notifyListeners();
  }

  void toggle(String id) {
    final todo = _todos.firstWhere((t) => t.id == id);
    todo.isDone = !todo.isDone;
    notifyListeners();
  }

  void remove(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  int get doneCount => _todos.where((t) => t.isDone).length;
}

// ──────────────────────────────────────────────
// Provider 2: 필터 상태 관리
// ──────────────────────────────────────────────
class FilterProvider extends ChangeNotifier {
  TodoFilter _filter = TodoFilter.all;
  TodoFilter get filter => _filter;

  void setFilter(TodoFilter f) {
    if (_filter == f) return;
    _filter = f;
    notifyListeners();
  }
}

// ──────────────────────────────────────────────
// 진입점: MultiProvider로 두 Provider를 동시에 주입
// ──────────────────────────────────────────────
class MultiProviderTodoPage extends StatelessWidget {
  const MultiProviderTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoListProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
      ],
      child: const _MultiTodoScreen(),
    );
  }
}

class _MultiTodoScreen extends StatelessWidget {
  const _MultiTodoScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiProvider 할 일'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const _FilterBar(),
          const _ProgressBar(),
          const Expanded(child: _FilteredTodoList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddSheet(BuildContext context) {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('새 할 일',
                  style: Theme.of(sheetContext).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: '무엇을 해야 하나요?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onSubmitted: (value) {
                  context.read<TodoListProvider>().add(value);
                  Navigator.pop(sheetContext);
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  context.read<TodoListProvider>().add(controller.text);
                  Navigator.pop(sheetContext);
                },
                child: const Text('추가'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ──────────────────────────────────────────────
// 필터 바 — FilterProvider만 watch
// SegmentedButton은 고정 높이 안에서 선택 배경이 칩만 채워지는 경우가 있어,
// Row + Material 로 세그마다 전체 높이(40)를 꽉 채운다.
// ──────────────────────────────────────────────
class _FilterBar extends StatelessWidget {
  const _FilterBar();

  static const _segments = <(TodoFilter, String)>[
    (TodoFilter.all, '전체'),
    (TodoFilter.active, '진행 중'),
    (TodoFilter.done, '완료'),
  ];

  @override
  Widget build(BuildContext context) {
    final current = context.watch<FilterProvider>().filter;
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Material(
          color: scheme.surfaceContainerHighest.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              for (var i = 0; i < _segments.length; i++) ...[
                if (i > 0)
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: scheme.outlineVariant,
                    ),
                  ),
                Expanded(
                  child: _FilterSegment(
                    label: _segments[i].$2,
                    selected: current == _segments[i].$1,
                    onTap: () => context
                        .read<FilterProvider>()
                        .setFilter(_segments[i].$1),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterSegment extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterSegment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: selected ? scheme.secondaryContainer : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.0,
              color: selected ? scheme.onSecondaryContainer : scheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// 진행률 바 — TodoListProvider만 watch
// ──────────────────────────────────────────────
class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoListProvider>();
    final total = provider.todos.length;
    final done = provider.doneCount;
    final ratio = total == 0 ? 0.0 : done / total;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '진행률',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '$done / $total',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// 필터링된 목록 — 두 Provider 모두 watch
// ──────────────────────────────────────────────
class _FilteredTodoList extends StatelessWidget {
  const _FilteredTodoList();

  @override
  Widget build(BuildContext context) {
    final allTodos = context.watch<TodoListProvider>().todos;
    final filter = context.watch<FilterProvider>().filter;
    final theme = Theme.of(context);

    final filtered = switch (filter) {
      TodoFilter.all => allTodos,
      TodoFilter.active => allTodos.where((t) => !t.isDone).toList(),
      TodoFilter.done => allTodos.where((t) => t.isDone).toList(),
    };

    if (filtered.isEmpty) {
      final message = switch (filter) {
        TodoFilter.all => '할 일을 추가해 보세요!',
        TodoFilter.active => '진행 중인 항목이 없습니다',
        TodoFilter.done => '완료된 항목이 없습니다',
      };

      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 12),
            Text(message,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: Colors.grey[400])),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final todo = filtered[index];
        return Dismissible(
          key: ValueKey(todo.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) =>
              context.read<TodoListProvider>().remove(todo.id),
          child: Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) =>
                    context.read<TodoListProvider>().toggle(todo.id),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration:
                      todo.isDone ? TextDecoration.lineThrough : null,
                  color: todo.isDone ? Colors.grey : null,
                ),
              ),
              trailing: SizedBox(
                width: 24,
                height: 24,
                child: todo.isDone
                    ? Icon(Icons.check_circle,
                        size: 24, color: Colors.green[400])
                    : Icon(Icons.radio_button_unchecked,
                        size: 24, color: Colors.grey[300]),
              ),
            ),
          ),
        );
      },
    );
  }
}
