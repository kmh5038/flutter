import 'package:flutter/material.dart';
import 'my_counter_app.dart';
import 'my_profile_cards/my_simple_profile_card.dart';
import 'my_profile_cards/my_stats_profile_card.dart';
import 'my_profile_cards/my_horizontal_profile_card.dart';
import 'my_profile_cards/my_gradient_profile_card.dart';
import 'my_profile_cards/my_action_profile_card.dart';
import 'my_list_items/my_basic_list_item.dart';
import 'my_list_items/my_detailed_list_item.dart';
import 'my_list_items/my_expandable_list_item.dart';

class Week1PracticeGallery extends StatelessWidget {
  const Week1PracticeGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 1 내 연습'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.secondaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.tertiary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, color: theme.colorScheme.tertiary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '예제 탭에서 UI를 확인한 후,\n여기서 직접 만들어보세요!',
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionHeader(title: '카운터 앱', icon: Icons.add_circle_outline),
          const SizedBox(height: 8),
          _PracticeTile(
            title: '내 카운터 앱',
            icon: Icons.touch_app,
            color: Colors.blue,
            destination: const MyCounterApp(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: '프로필 카드 5종', icon: Icons.person),
          const SizedBox(height: 8),
          _PracticeTile(
            title: '내 심플 프로필 카드',
            icon: Icons.person_outline,
            color: Colors.teal,
            destination: const MySimpleProfileCardPage(),
          ),
          _PracticeTile(
            title: '내 통계 프로필 카드',
            icon: Icons.bar_chart,
            color: Colors.orange,
            destination: const MyStatsProfileCardPage(),
          ),
          _PracticeTile(
            title: '내 가로형 프로필 카드',
            icon: Icons.view_agenda,
            color: Colors.indigo,
            destination: const MyHorizontalProfileCardPage(),
          ),
          _PracticeTile(
            title: '내 그라데이션 프로필 카드',
            icon: Icons.gradient,
            color: Colors.purple,
            destination: const MyGradientProfileCardPage(),
          ),
          _PracticeTile(
            title: '내 액션 프로필 카드',
            icon: Icons.touch_app_outlined,
            color: Colors.pink,
            destination: const MyActionProfileCardPage(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: '리스트 아이템 3종', icon: Icons.list),
          const SizedBox(height: 8),
          _PracticeTile(
            title: '내 기본 리스트',
            icon: Icons.format_list_bulleted,
            color: Colors.green,
            destination: const MyBasicListItemPage(),
          ),
          _PracticeTile(
            title: '내 상세 리스트',
            icon: Icons.view_list,
            color: Colors.amber.shade700,
            destination: const MyDetailedListItemPage(),
          ),
          _PracticeTile(
            title: '내 확장 가능 리스트',
            icon: Icons.expand_more,
            color: Colors.red,
            destination: const MyExpandableListItemPage(),
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
        Icon(icon, size: 20, color: theme.colorScheme.secondary),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

class _PracticeTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget destination;

  const _PracticeTile({
    required this.title,
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
        subtitle: const Text(
          '직접 만들어보기',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: const Icon(Icons.edit_outlined, size: 20),
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
