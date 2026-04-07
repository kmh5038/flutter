import 'package:flutter/material.dart';

class DetailedListItemPage extends StatelessWidget {
  const DetailedListItemPage({super.key});

  static const _items = [
    _CourseData(
      title: 'Flutter 기초 마스터',
      instructor: 'Kim Developer',
      rating: 4.8,
      students: 1234,
      duration: '12시간',
      price: '₩49,000',
      level: '입문',
      levelColor: Colors.green,
      iconBg: Color(0xFF0175C2),
      icon: Icons.phone_android,
    ),
    _CourseData(
      title: 'Dart 프로그래밍',
      instructor: 'Lee Coder',
      rating: 4.6,
      students: 892,
      duration: '8시간',
      price: '₩35,000',
      level: '초급',
      levelColor: Colors.blue,
      iconBg: Color(0xFF00B4AB),
      icon: Icons.code,
    ),
    _CourseData(
      title: '상태관리 완벽 가이드',
      instructor: 'Park Dev',
      rating: 4.9,
      students: 567,
      duration: '15시간',
      price: '₩69,000',
      level: '중급',
      levelColor: Colors.orange,
      iconBg: Color(0xFF6750A4),
      icon: Icons.account_tree,
    ),
    _CourseData(
      title: 'Firebase 실전 프로젝트',
      instructor: 'Choi Backend',
      rating: 4.7,
      students: 345,
      duration: '20시간',
      price: '₩79,000',
      level: '중급',
      levelColor: Colors.orange,
      iconBg: Color(0xFFFFC107),
      icon: Icons.cloud,
    ),
    _CourseData(
      title: 'UI/UX 디자인 패턴',
      instructor: 'Yoon Designer',
      rating: 4.5,
      students: 723,
      duration: '10시간',
      price: '₩55,000',
      level: '초급',
      levelColor: Colors.blue,
      iconBg: Color(0xFFE91E63),
      icon: Icons.design_services,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 리스트'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CourseCard(data: _items[index]);
        },
      ),
    );
  }
}

class _CourseData {
  final String title;
  final String instructor;
  final double rating;
  final int students;
  final String duration;
  final String price;
  final String level;
  final Color levelColor;
  final Color iconBg;
  final IconData icon;

  const _CourseData({
    required this.title,
    required this.instructor,
    required this.rating,
    required this.students,
    required this.duration,
    required this.price,
    required this.level,
    required this.levelColor,
    required this.iconBg,
    required this.icon,
  });
}

class _CourseCard extends StatelessWidget {
  final _CourseData data;

  const _CourseCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: data.iconBg.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(data.icon, color: data.iconBg, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: data.levelColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          data.level,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: data.levelColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.instructor,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber[700]),
                      const SizedBox(width: 4),
                      Text(
                        '${data.rating}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${data.students}명)',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      const Spacer(),
                      Icon(Icons.access_time, size: 14, color: Colors.grey[400]),
                      const SizedBox(width: 4),
                      Text(
                        data.duration,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        data.price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6750A4),
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
