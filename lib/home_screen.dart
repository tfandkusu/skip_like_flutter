import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/card_appearance_tween.dart';
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onPanStart: (details) {
                uiModelStateNotifier.onPanStart(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  startDragX: details.localPosition.dx,
                  startDragY: details.localPosition.dy,
                );
              },
              onPanUpdate: (details) {
                uiModelStateNotifier.onPanUpdate(
                  dragX: details.localPosition.dx,
                  dragY: details.localPosition.dy,
                );
              },
              onPanEnd: (details) {
                uiModelStateNotifier.onPanEnd();
              },
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        32.0,
                        16.0,
                        32.0,
                        16.0,
                      ),
                      child:
                          uiModel.isInAnimation
                              ? TweenAnimationBuilder<CardAppearance>(
                                tween: CardAppearanceTween(
                                  begin: uiModel.animationBeginCardAppearance,
                                  end: uiModel.cardAppearance,
                                ),
                                duration: const Duration(milliseconds: 200),
                                builder: (
                                  context,
                                  memberCardAppearance,
                                  child,
                                ) {
                                  return Transform(
                                    transform: _createTransformMatrix(
                                      uiModel.cardAppearance,
                                    ),
                                    child: child,
                                  );
                                },
                                child: _MemberCard(),
                              )
                              : Transform(
                                transform: _createTransformMatrix(
                                  uiModel.cardAppearance,
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
            );
          },
        ),
      ),
    );
  }

  Matrix4 _createTransformMatrix(CardAppearance cardAppearance) {
    return Matrix4.translationValues(0, cardAppearance.offsetY, 0);
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
