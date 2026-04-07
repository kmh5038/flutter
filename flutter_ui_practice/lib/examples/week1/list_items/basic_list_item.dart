import 'package:flutter/material.dart';

class BasicListItemPage extends StatelessWidget {
  const BasicListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기본 리스트'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          _buildSectionHeader(context, '설정'),
          _buildBasicTile(
            icon: Icons.person_outline,
            title: '내 프로필',
            subtitle: '이름, 사진, 상태 메시지',
            iconBg: Colors.blue,
          ),
          _buildBasicTile(
            icon: Icons.notifications_outlined,
            title: '알림 설정',
            subtitle: '푸시 알림, 소리, 진동',
            iconBg: Colors.orange,
          ),
          _buildBasicTile(
            icon: Icons.lock_outline,
            title: '개인정보 보호',
            subtitle: '차단 목록, 프로필 공개 범위',
            iconBg: Colors.green,
          ),
          _buildBasicTile(
            icon: Icons.palette_outlined,
            title: '테마',
            subtitle: '다크 모드, 채팅 배경',
            iconBg: Colors.purple,
          ),
          const Divider(indent: 16, endIndent: 16),
          _buildSectionHeader(context, '일반'),
          _buildBasicTile(
            icon: Icons.language,
            title: '언어',
            subtitle: '한국어',
            iconBg: Colors.teal,
            trailing: const Text(
              '한국어',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          _buildBasicTile(
            icon: Icons.storage_outlined,
            title: '저장공간 관리',
            subtitle: '2.4 GB 사용 중',
            iconBg: Colors.red,
          ),
          _buildBasicTile(
            icon: Icons.help_outline,
            title: '도움말',
            subtitle: 'FAQ, 문의하기',
            iconBg: Colors.amber,
          ),
          _buildBasicTile(
            icon: Icons.info_outline,
            title: '앱 정보',
            subtitle: 'v1.0.0',
            iconBg: Colors.blueGrey,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey[500],
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildBasicTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconBg,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconBg.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconBg, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    );
  }
}
