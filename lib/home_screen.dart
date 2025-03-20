import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skip or Like ?')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 16.0),
                child: Container(),
              ),
            ),
            Row(
              children: [
                Spacer(),
                _DecisionButton(
                  icon: Icons.close,
                  onPressed: () {
                    // TODO: スキップ処理を実装
                  },
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 64),
                _DecisionButton(
                  icon: Icons.favorite,
                  onPressed: () {
                    // TODO: いいね！処理を実装
                  },
                  backgroundColor: Colors.green,
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

/// 下部のボタン
class _DecisionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const _DecisionButton({
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
