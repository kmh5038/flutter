import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ──────────────────────────────────────────────
// ChangeNotifier: 상태를 보관하고, 변경 시 리스너에게 알림
// ──────────────────────────────────────────────
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// ──────────────────────────────────────────────
// 진입점: ChangeNotifierProvider로 모델을 트리에 주입
// ──────────────────────────────────────────────
class CounterWithProviderPage extends StatelessWidget {
  const CounterWithProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: const _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 카운터'),
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CounterModel>().reset(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 카운트',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            // Consumer: 이 위젯만 count 변경 시 다시 빌드
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: () => context.read<CounterModel>().decrement(),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: () => context.read<CounterModel>().increment(),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb_outline,
                            color: Colors.amber[700], size: 20),
                        const SizedBox(width: 8),
                        Text('포인트',
                            style: theme.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('• ChangeNotifier → 상태 보관 + notifyListeners()'),
                    const Text('• ChangeNotifierProvider → 트리에 모델 주입'),
                    const Text('• Consumer → 변경된 부분만 리빌드'),
                    const Text('• context.read → 이벤트 핸들러에서 호출'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
