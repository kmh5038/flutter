import 'package:flutter/material.dart';

// TODO: 예제 탭의 '기본 리스트'를 보고 직접 만들어보세요!
// 힌트: ListView, ListTile, 섹션 헤더 패턴

class MyBasicListItemPage extends StatelessWidget {
  const MyBasicListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const rows = <(IconData, String, String, Color, Widget?)>[
      (Icons.person_outline, '내 프로필', '이름, 사진, 상태메시지', Colors.blue, null),
      (
        Icons.notifications_outlined,
        '알림 설정',
        '푸시 알림, 소리, 진동',
        Colors.orange,
        null
      ),
      (Icons.lock_outline, '개인정보 보호', '차단 목록, 프로필 공개 범위', Colors.green, null),
      (Icons.palette_outlined, '테마', '다크 모드, 채팅 배경', Colors.purple, null),
    ];

    const rows2 = <(IconData, String, String, Color, Widget?)>[
      (
        Icons.language,
        '언어',
        '한국어',
        Colors.teal,
        Text('한국어', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ),
      (
        Icons.storage_outlined,
        '저장공간 관리',
        '2.4 GB 사용 중',
        Colors.red,
        null,
      ),
      (Icons.help_outline, '도움말', 'FAQ, 문의하기', Colors.amber, null),
      (Icons.info_outline, '앱 정보', 'v1.0.0', Colors.blueGrey, null),
    ];

    List<Widget> gapSeparatedRows(
      List<(IconData, String, String, Color, Widget?)> items,
    ) {
      return [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: 30),
          _ListRow(
            iconImage: items[i].$1,
            title: items[i].$2,
            subTitle: items[i].$3,
            color: items[i].$4,
            trailing: items[i].$5,
          ),
        ],
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 기본 리스트'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 12),
            child: Text(
              '설정',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey[500],
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...gapSeparatedRows(rows),
          SizedBox(height: 20),
          const Divider(indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Text(
              '일반',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey[500],
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...gapSeparatedRows(rows2),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  final IconData iconImage;
  final String title;
  final String subTitle;
  final Color color;
  final Widget? trailing;

  const _ListRow({
    required this.iconImage,
    required this.title,
    required this.subTitle,
    required this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(iconImage, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15)),
                Text(subTitle, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
