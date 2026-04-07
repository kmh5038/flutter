import 'package:flutter/material.dart';

class ExpandableListItemPage extends StatelessWidget {
  const ExpandableListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('확장 가능 리스트'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _FaqItem(
            question: 'Flutter란 무엇인가요?',
            answer:
                'Flutter는 Google이 만든 오픈소스 UI 프레임워크입니다. '
                '하나의 코드베이스로 iOS, Android, Web, Desktop 앱을 만들 수 있습니다. '
                'Dart 언어를 사용하며, 높은 성능의 네이티브 컴파일을 지원합니다.',
            icon: Icons.info_outline,
            color: Colors.blue,
          ),
          _FaqItem(
            question: 'Widget이란 무엇인가요?',
            answer:
                'Widget은 Flutter UI의 기본 구성 요소입니다. '
                '모든 것이 Widget으로 이루어져 있으며, Text, Button, Padding, Row, Column 등이 모두 Widget입니다. '
                'Widget은 불변(immutable)이며, 상태가 변경되면 새로운 Widget이 생성됩니다.',
            icon: Icons.widgets_outlined,
            color: Colors.green,
          ),
          _FaqItem(
            question: 'StatelessWidget vs StatefulWidget?',
            answer:
                'StatelessWidget은 상태가 없는 Widget입니다. 한 번 빌드되면 변하지 않습니다.\n\n'
                'StatefulWidget은 내부 상태를 가질 수 있습니다. setState()를 호출하면 UI가 다시 빌드됩니다.\n\n'
                '예: 카운터 앱에서 숫자가 변하는 부분은 StatefulWidget이 필요합니다.',
            icon: Icons.compare_arrows,
            color: Colors.orange,
          ),
          _FaqItem(
            question: 'Hot Reload와 Hot Restart의 차이?',
            answer:
                'Hot Reload: 코드 변경 사항을 즉시 반영하되, 앱의 상태(state)를 유지합니다. '
                '개발 중 UI 변경할 때 유용합니다.\n\n'
                'Hot Restart: 앱을 처음부터 다시 시작합니다. 상태가 초기화됩니다. '
                '상태 관련 코드를 변경했을 때 사용합니다.',
            icon: Icons.bolt,
            color: Colors.red,
          ),
          _FaqItem(
            question: 'BuildContext는 무엇인가요?',
            answer:
                'BuildContext는 Widget Tree에서 Widget의 위치를 나타내는 핸들입니다.\n\n'
                'Theme, MediaQuery, Navigator 등에 접근할 때 사용합니다.\n\n'
                '예: Theme.of(context)로 현재 테마에 접근하거나, '
                'Navigator.of(context)로 화면을 전환할 수 있습니다.',
            icon: Icons.account_tree_outlined,
            color: Colors.purple,
          ),
          _FaqItem(
            question: 'pub.dev란 무엇인가요?',
            answer:
                'pub.dev는 Dart와 Flutter 패키지의 공식 저장소입니다.\n\n'
                'pubspec.yaml에 패키지를 추가하고 flutter pub get 명령으로 설치할 수 있습니다.\n\n'
                'http, provider, go_router 등 수천 개의 패키지가 있습니다.',
            icon: Icons.inventory_2_outlined,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final IconData icon;
  final Color color;

  const _FaqItem({
    required this.question,
    required this.answer,
    required this.icon,
    required this.color,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: _isExpanded
            ? BorderSide(color: widget.color.withValues(alpha: 0.3), width: 1.5)
            : BorderSide.none,
      ),
      elevation: _isExpanded ? 3 : 1,
      child: InkWell(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: widget.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(widget.icon, color: widget.color, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.question,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: _isExpanded ? widget.color : Colors.black87,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.expand_more,
                      color: _isExpanded ? widget.color : Colors.grey,
                    ),
                  ),
                ],
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 52),
                  child: Text(
                    widget.answer,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
