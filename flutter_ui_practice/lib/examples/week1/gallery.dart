import 'package:flutter/material.dart';
import 'counter_app.dart';
import 'profile_cards/simple_profile_card.dart';
import 'profile_cards/stats_profile_card.dart';
import 'profile_cards/horizontal_profile_card.dart';
import 'profile_cards/gradient_profile_card.dart';
import 'profile_cards/action_profile_card.dart';
import 'list_items/basic_list_item.dart';
import 'list_items/detailed_list_item.dart';
import 'list_items/expandable_list_item.dart';

class Week1Gallery extends StatelessWidget {
  const Week1Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 1 예제'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader(title: '카운터 앱', icon: Icons.add_circle_outline),
          const SizedBox(height: 8),
          _ExampleTile(
            title: '향상된 카운터',
            subtitle: 'StatefulWidget + setState',
            icon: Icons.touch_app,
            color: Colors.blue,
            destination: const CounterApp(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: '프로필 카드 5종', icon: Icons.person),
          const SizedBox(height: 8),
          _ExampleTile(
            title: '심플 프로필 카드',
            subtitle: 'Column + CircleAvatar + Text',
            icon: Icons.person_outline,
            color: Colors.teal,
            destination: const SimpleProfileCardPage(),
          ),
          _ExampleTile(
            title: '통계 프로필 카드',
            subtitle: 'Row + Column 조합',
            icon: Icons.bar_chart,
            color: Colors.orange,
            destination: const StatsProfileCardPage(),
          ),
          _ExampleTile(
            title: '가로형 프로필 카드',
            subtitle: 'Row 레이아웃 활용',
            icon: Icons.view_agenda,
            color: Colors.indigo,
            destination: const HorizontalProfileCardPage(),
          ),
          _ExampleTile(
            title: '그라데이션 프로필 카드',
            subtitle: 'Stack + Container + BoxDecoration',
            icon: Icons.gradient,
            color: Colors.purple,
            destination: const GradientProfileCardPage(),
          ),
          _ExampleTile(
            title: '액션 프로필 카드',
            subtitle: 'IconButton + Chip + Wrap',
            icon: Icons.touch_app_outlined,
            color: Colors.pink,
            destination: const ActionProfileCardPage(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: '리스트 아이템 3종', icon: Icons.list),
          const SizedBox(height: 8),
          _ExampleTile(
            title: '기본 리스트',
            subtitle: 'ListTile + ListView',
            icon: Icons.format_list_bulleted,
            color: Colors.green,
            destination: const BasicListItemPage(),
          ),
          _ExampleTile(
            title: '상세 리스트',
            subtitle: 'Card + Row + Column 커스텀',
            icon: Icons.view_list,
            color: Colors.amber.shade700,
            destination: const DetailedListItemPage(),
          ),
          _ExampleTile(
            title: '확장 가능 리스트',
            subtitle: 'ExpansionTile + AnimatedContainer',
            icon: Icons.expand_more,
            color: Colors.red,
            destination: const ExpandableListItemPage(),
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
        Icon(icon, size: 20, color: theme.colorScheme.primary),
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

class _ExampleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget destination;

  const _ExampleTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
      ),
    );
  }
}
