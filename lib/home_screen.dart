import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/decision_button.dart';

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
                DecisionButton(
                  icon: Icons.close,
                  onPressed: () {
                    // TODO: スキップ処理を実装
                  },
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 64),
                DecisionButton(
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
