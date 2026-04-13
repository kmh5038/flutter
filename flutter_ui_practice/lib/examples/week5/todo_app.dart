import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ──────────────────────────────────────────────
// 모델
// ──────────────────────────────────────────────
class Todo {
  final String id;
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false})
      : id = DateTime.now().microsecondsSinceEpoch.toString();
}

// ──────────────────────────────────────────────
// ChangeNotifier — CRUD 로직 전부 여기
// ──────────────────────────────────────────────
class TodoProvider extends ChangeNotifier {
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

  void edit(String id, String newTitle) {
    if (newTitle.trim().isEmpty) return;
    final todo = _todos.firstWhere((t) => t.id == id);
    todo.title = newTitle.trim();
    notifyListeners();
  }

  int get doneCount => _todos.where((t) => t.isDone).length;
  int get totalCount => _todos.length;
}

// ──────────────────────────────────────────────
// 진입점
// ──────────────────────────────────────────────
class TodoAppPage extends StatelessWidget {
  const TodoAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: const _TodoScreen(),
    );
  }
}

// ──────────────────────────────────────────────
// 화면
// ──────────────────────────────────────────────
class _TodoScreen extends StatelessWidget {
  const _TodoScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 앱 (Provider)'),
        backgroundColor: theme.colorScheme.inversePrimary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Consumer<TodoProvider>(
            builder: (context, provider, _) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                child: Row(
                  children: [
                    _StatChip(
                      label: '전체 ${provider.totalCount}',
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    _StatChip(
                      label: '완료 ${provider.doneCount}',
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    _StatChip(
                      label: '남은 ${provider.totalCount - provider.doneCount}',
                      color: Colors.orange,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, _) {
          if (provider.todos.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.checklist, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    '할 일을 추가해 보세요!',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: Colors.grey[400]),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              return _TodoTile(todo: provider.todos[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('할 일 추가'),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
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
                  context.read<TodoProvider>().add(value);
                  Navigator.pop(sheetContext);
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  context.read<TodoProvider>().add(controller.text);
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
// 개별 할 일 타일
// ──────────────────────────────────────────────
class _TodoTile extends StatelessWidget {
  final Todo todo;
  const _TodoTile({required this.todo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
      onDismissed: (_) => context.read<TodoProvider>().remove(todo.id),
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (_) => context.read<TodoProvider>().toggle(todo.id),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              fontSize: 16,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              color: todo.isDone ? Colors.grey : theme.colorScheme.onSurface,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.grey[400]),
            onPressed: () => _showEditDialog(context),
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final controller = TextEditingController(text: todo.title);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('수정'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('취소'),
            ),
            FilledButton(
              onPressed: () {
                context.read<TodoProvider>().edit(todo.id, controller.text);
                Navigator.pop(dialogContext);
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );
  }
}

// ──────────────────────────────────────────────
// 통계 칩
// ──────────────────────────────────────────────
class _StatChip extends StatelessWidget {
  final String label;
  final Color color;
  const _StatChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
