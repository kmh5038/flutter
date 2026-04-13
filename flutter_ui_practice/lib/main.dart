import 'package:flutter/material.dart';
import 'examples/week1/gallery.dart';
import 'practice/week1/gallery.dart';
import 'examples/week5/gallery.dart';
import 'practice/week5/gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class _WeekConfig {
  final String label;
  final Widget exampleGallery;
  final Widget practiceGallery;

  const _WeekConfig({
    required this.label,
    required this.exampleGallery,
    required this.practiceGallery,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0; // 0: 예제, 1: 연습
  int _weekIndex = 0;

  static const _weeks = [
    _WeekConfig(
      label: 'Week 1 — UI 기초',
      exampleGallery: Week1Gallery(),
      practiceGallery: Week1PracticeGallery(),
    ),
    _WeekConfig(
      label: 'Week 5 — Provider',
      exampleGallery: Week5Gallery(),
      practiceGallery: Week5PracticeGallery(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final week = _weeks[_weekIndex];
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: theme.colorScheme.inversePrimary.withValues(alpha: 0.3),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
              child: DropdownButton<int>(
                value: _weekIndex,
                underline: const SizedBox.shrink(),
                icon: const Icon(Icons.keyboard_arrow_down),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
                items: [
                  for (var i = 0; i < _weeks.length; i++)
                    DropdownMenuItem(value: i, child: Text(_weeks[i].label)),
                ],
                onChanged: (v) {
                  if (v != null) setState(() => _weekIndex = v);
                },
              ),
            ),
          ),
          Expanded(
            child: _tabIndex == 0
                ? week.exampleGallery
                : week.practiceGallery,
          ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (index) {
          setState(() => _tabIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.visibility_outlined),
            selectedIcon: Icon(Icons.visibility),
            label: '예제 보기',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_outlined),
            selectedIcon: Icon(Icons.edit),
            label: '내 연습',
          ),
        ],
      ),
    );
  }
}
