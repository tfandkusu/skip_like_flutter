import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:skip_like_flutter/home_ui_model_state_notifier.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiModel = ref.watch(homeUIModelStateNotifierProvider);
    final uiModelStateNotifier = ref.watch(
      homeUIModelStateNotifierProvider.notifier,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Skip or Like ?')),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: GestureDetector(
          onPanStart: (details) {
            uiModelStateNotifier.onStartDrag();
          },
          onPanUpdate: (details) {
            uiModelStateNotifier.updateOffset(deltaY: details.delta.dy);
          },
          onPanEnd: (details) {
            uiModelStateNotifier.onEndDrag();
          },
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                  child:
                      uiModel.isInAnimation
                          ? TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                              begin:
                                  uiModel
                                      .animationBeginMemberCardAppearance
                                      .offsetY,
                              end: uiModel.memberCardAppearance.offsetY,
                            ),
                            duration: const Duration(milliseconds: 200),
                            builder: (context, offsetY, child) {
                              return Transform.translate(
                                offset: Offset(0, offsetY),
                                child: child,
                              );
                            },
                            child: _MemberCard(),
                          )
                          : Transform.translate(
                            offset: Offset(
                              0,
                              uiModel.memberCardAppearance.offsetY,
                            ),
                            child: _MemberCard(),
                          ),
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
      ),
    );
  }
}

/// メンバーカード
class _MemberCard extends StatelessWidget {
  const _MemberCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset('assets/member.png', fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [Text("24歳 東京", style: theme.textTheme.bodyLarge)],
              ),
            ),
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
