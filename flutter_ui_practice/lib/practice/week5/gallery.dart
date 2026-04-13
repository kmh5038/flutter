import 'package:flutter/material.dart';
import 'my_counter_with_provider.dart';
import 'my_todo_app.dart';
import 'my_multi_provider_todo.dart';

class Week5PracticeGallery extends StatelessWidget {
  const Week5PracticeGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 5 연습'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader(title: 'Provider 기초', icon: Icons.data_object),
          const SizedBox(height: 8),
          _PracticeTile(
            title: '내 Provider 카운터',
            subtitle: 'ChangeNotifier + Consumer 직접 구현',
            icon: Icons.add_circle_outline,
            color: Colors.blue,
            destination: const MyCounterWithProviderPage(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: '할 일 앱 (CRUD)', icon: Icons.checklist),
          const SizedBox(height: 8),
          _PracticeTile(
            title: '내 TODO 앱',
            subtitle: 'ChangeNotifierProvider + CRUD',
            icon: Icons.task_alt,
            color: Colors.green,
            destination: const MyTodoAppPage(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(
              title: 'MultiProvider', icon: Icons.account_tree_outlined),
          const SizedBox(height: 8),
          _PracticeTile(
            title: '내 MultiProvider TODO',
            subtitle: 'MultiProvider + 필터 + 진행률',
            icon: Icons.filter_list,
            color: Colors.deepPurple,
            destination: const MyMultiProviderTodoPage(),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 22, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _PracticeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget destination;

  const _PracticeTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        subtitle: Text(subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        ),
      ),
    );
  }
}
