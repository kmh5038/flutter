import 'package:flutter/material.dart';

// TODO: 예제 탭의 '상세 리스트'를 보고 직접 만들어보세요!
// 힌트: ListView.builder, Card, Row + Column 커스텀 레이아웃

class MyDetailedListItemPage extends StatelessWidget {
  const MyDetailedListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const rows = <_DetailListTile>[
      _DetailListTile(
          icon: Icons.phone_android,
          color: Colors.blue,
          title: 'Flutter 기초 마스터',
          job: 'Kim Developer',
          level: '입문',
          score: '4.8 (1234명)',
          time: '12시간',
          price: '₩49000'),
      _DetailListTile(
          icon: Icons.code,
          color: Colors.green,
          title: "Dart 프로그래밍",
          job: 'Lee Coder',
          level: '초급',
          score: '4.6 (892명)',
          time: '8시간',
          price: '₩35000'),
      _DetailListTile(
          icon: Icons.account_tree,
          color: Colors.purple,
          title: '상태관리 완벽 가이드',
          job: 'Park Dev',
          level: '중급',
          score: '4.9 (567명)',
          time: '15시간',
          price: '₩69000'),
      _DetailListTile(
          icon: Icons.cloud,
          color: Colors.yellow,
          title: 'Firebase 실전 프로젝트',
          job: 'Choi Backend',
          level: '중급',
          score: '4.7 (345명)',
          time: '20시간',
          price: '₩79000'),
      _DetailListTile(
          icon: Icons.design_services,
          color: Colors.pink,
          title: 'UI/UX 디자인 패턴',
          job: 'Yoon Designer',
          level: '초급',
          score: '4.5 (723명)',
          time: '10',
          price: '₩55000')
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('내 상세 리스트'),
          backgroundColor: colorScheme.inversePrimary,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: rows.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) => rows[index],
        ));
  }
}

class _DetailListTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String job;
  final String level;
  final String score;
  final String time;
  final String price;

  const _DetailListTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.job,
    required this.level,
    required this.score,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(job, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Color.fromARGB(255, 255, 102, 0),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        score,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
