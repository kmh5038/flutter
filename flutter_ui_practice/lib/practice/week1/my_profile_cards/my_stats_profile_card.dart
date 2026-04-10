import 'package:flutter/material.dart';

// TODO: 예제 탭의 '통계 프로필 카드'를 보고 직접 만들어보세요!
// 힌트: Row + Column 조합, Divider, FilledButton

class MyStatsProfileCardPage extends StatelessWidget {
  const MyStatsProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final h = MediaQuery.sizeOf(context).height;
    final String name = 'Sarah Kim';
    final String job = 'UI/UX Designer';

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 통계 프로필 카드'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
            width: w * 0.8,
            height: h * 0.5,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 218, 240),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(children: [
              Spacer(flex: 1),
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 80,
                  ),
                  radius: 60, // 원하는 크기
                  backgroundColor: Color(0xFF00897B),
                ),
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              Text(
                job,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 30),
              Divider(indent: 20, endIndent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: _ProfileStat(label: '게시물', value: '248'),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: _ProfileStat(label: '팔로워', value: '12.5K'),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: _ProfileStat(label: '팔로잉', value: '386'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: w * 0.7,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xFF00897B),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  '팔로우',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ),
              Spacer(flex: 1)
            ])),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }
}
