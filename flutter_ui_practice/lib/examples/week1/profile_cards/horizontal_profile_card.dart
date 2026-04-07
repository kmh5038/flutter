import 'package:flutter/material.dart';

class HorizontalProfileCardPage extends StatelessWidget {
  const HorizontalProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가로형 프로필 카드'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _HorizontalCard(
              name: 'Alex Park',
              role: 'Backend Developer',
              initials: 'AP',
              bgColor: const Color(0xFF3949AB),
              isOnline: true,
            ),
            const SizedBox(height: 16),
            _HorizontalCard(
              name: 'Mina Lee',
              role: 'Product Manager',
              initials: 'ML',
              bgColor: const Color(0xFFE53935),
              isOnline: true,
            ),
            const SizedBox(height: 16),
            _HorizontalCard(
              name: 'Chris Yoon',
              role: 'Data Scientist',
              initials: 'CY',
              bgColor: const Color(0xFF00897B),
              isOnline: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  final String name;
  final String role;
  final String initials;
  final Color bgColor;
  final bool isOnline;

  const _HorizontalCard({
    required this.name,
    required this.role,
    required this.initials,
    required this.bgColor,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: bgColor,
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isOnline ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message_outlined, color: bgColor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
