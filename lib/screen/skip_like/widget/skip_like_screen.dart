import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance_tween.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/skip_like_ui_model.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/skip_like_ui_model_notifier.dart';
import 'package:skip_like_flutter/model/member.dart';

class SkipLikeScreen extends HookConsumerWidget {
  const SkipLikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiModel = ref.watch(skipLikeUiModelNotifierProvider);
    final stateNotifier = ref.watch(skipLikeUiModelNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Skip or Like ?')),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (details) {
                if (uiModel.isIgnoreTouch) return;
                stateNotifier.onPanStart(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  startDragX: details.localPosition.dx,
                  startDragY: details.localPosition.dy,
                );
              },
              onPanUpdate: (details) {
                if (uiModel.isIgnoreTouch) return;
                stateNotifier.onPanUpdate(
                  dragX: details.localPosition.dx,
                  dragY: details.localPosition.dy,
                );
              },
              onPanEnd: (details) {
                if (uiModel.isIgnoreTouch) return;
                _handlePanEnd(
                  details: details,
                  uiModel: uiModel,
                  stateNotifier: stateNotifier,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                );
              },
              child: Column(
                children: [
                  // カード表示部
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        32.0,
                        16.0,
                        32.0,
                        16.0,
                      ),
                      child: Stack(
                        children:
                            [_createBackWidget(stateNotifier.onResetPressed)] +
                            _createCardWidgets(
                              isInAnimation: uiModel.isInAnimation,
                              animationDuration: uiModel.animationDuration,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              cardAppearance: uiModel.cardAppearance,
                              animationBeginCardAppearance:
                                  uiModel.animationBeginCardAppearance,
                              visibleMembers: uiModel.visibleMembers,
                            ),
                      ),
                    ),
                  ),
                  // スキップ、いいねボタン表示部
                  Row(
                    children: [
                      Spacer(),
                      _DecisionButton(
                        isInAnimation: uiModel.isInAnimation,
                        icon: Icons.close,
                        scale: uiModel.cardAppearance.skipButtonScale,
                        onPressed: () {
                          if (uiModel.isIgnoreTouch) return;
                          _onTapSkip(
                            uiModelStateNotifier: stateNotifier,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          );
                        },
                        backgroundColor: Colors.red,
                      ),
                      const SizedBox(width: 64),
                      _DecisionButton(
                        isInAnimation: uiModel.isInAnimation,
                        icon: Icons.favorite,
                        scale: uiModel.cardAppearance.likeButtonScale,
                        onPressed: () {
                          if (uiModel.isIgnoreTouch) return;
                          _onTapLike(
                            uiModelStateNotifier: stateNotifier,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          );
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

  /// カードの裏にある Widget を作成する。
  ///
  /// リセットボタンがあり、押すと初期状態に戻る。
  Widget _createBackWidget(VoidCallback onResetPressed) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(onPressed: onResetPressed, child: Text("Reset")),
    );
  }

  List<Widget> _createCardWidgets({
    required bool isInAnimation,
    required Duration animationDuration,
    required double width,
    required double height,
    required CardAppearance cardAppearance,
    required CardAppearance animationBeginCardAppearance,
    required List<Member> visibleMembers,
  }) {
    List<Widget> cardWidgets = [];
    for (var i = visibleMembers.length - 1; i >= 0; i--) {
      final member = visibleMembers[i];
      if (i >= 1) {
        cardWidgets.add(
          AnimatedPadding(
            key: Key('card_${member.id}'),
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.only(top: 8.0 * (2 - i), bottom: 8.0 * i),
            child: _MemberCard(member: member, alpha: 1.0),
          ),
        );
      } else {
        cardWidgets.add(
          AnimatedPadding(
            key: Key('card_${member.id}'),
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.only(top: 8.0 * (2 - i), bottom: 8.0 * i),
            child: _AnimatedMemberCard(
              isInAnimation: isInAnimation,
              animationDuration: animationDuration,
              width: width,
              height: height,
              cardAppearance: cardAppearance,
              animationBeginCardAppearance: animationBeginCardAppearance,
              member: member,
            ),
          ),
        );
      }
    }
    return cardWidgets;
  }

  void _handlePanEnd({
    required DragEndDetails details,
    required SkipLikeUiModel uiModel,
    required SkipLikeUiModelNotifier stateNotifier,
    required double width,
    required double height,
  }) {
    final speed = details.velocity.pixelsPerSecond.dx;
    if (speed < 0 && uiModel.cardAppearance.angle < 0) {
      // 左 Fling 操作
      _onTapSkip(
        uiModelStateNotifier: stateNotifier,
        width: width,
        height: height,
      );
    } else if (speed > 0 && uiModel.cardAppearance.angle > 0) {
      // 右 Fling 操作
      _onTapLike(
        uiModelStateNotifier: stateNotifier,
        width: width,
        height: height,
      );
    } else if (uiModel.cardAppearance.angle < -skipLikeThreshold) {
      // 左に7.5度以上ドラッグした
      _onTapSkip(
        uiModelStateNotifier: stateNotifier,
        width: width,
        height: height,
      );
    } else if (uiModel.cardAppearance.angle > skipLikeThreshold) {
      // 右に7.5度以上ドラッグした
      _onTapLike(
        uiModelStateNotifier: stateNotifier,
        width: width,
        height: height,
      );
    } else {
      stateNotifier.onPanEnd();
    }
  }

  void _onTapSkip({
    required SkipLikeUiModelNotifier uiModelStateNotifier,
    required double width,
    required double height,
  }) async {
    uiModelStateNotifier.onTapSkip(width: width, height: height);
    await Future.delayed(const Duration(milliseconds: 500));
    uiModelStateNotifier.onAnimationEnd();
  }

  void _onTapLike({
    required SkipLikeUiModelNotifier uiModelStateNotifier,
    required double width,
    required double height,
  }) async {
    uiModelStateNotifier.onTapLike(width: width, height: height);
    await Future.delayed(const Duration(milliseconds: 500));
    uiModelStateNotifier.onAnimationEnd();
  }
}

/// アニメーション付きメンバーカード
class _AnimatedMemberCard extends StatelessWidget {
  final bool isInAnimation;
  final double width;
  final double height;
  final CardAppearance cardAppearance;
  final CardAppearance animationBeginCardAppearance;
  final Member member;
  final Duration animationDuration;

  const _AnimatedMemberCard({
    required this.isInAnimation,
    required this.width,
    required this.height,
    required this.cardAppearance,
    required this.animationBeginCardAppearance,
    required this.member,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return isInAnimation
        ? TweenAnimationBuilder<CardAppearance>(
          tween: CardAppearanceTween(
            begin: animationBeginCardAppearance,
            end: cardAppearance,
          ),
          duration: animationDuration,
          builder:
              (context, cardAppearance, child) => _createTransform(
                width: width,
                height: height,
                cardAppearance: cardAppearance,
                child: child!,
              ),
          child: _MemberCard(member: member, alpha: cardAppearance.alpha),
        )
        : _createTransform(
          width: width,
          height: height,
          cardAppearance: cardAppearance,
          child: _MemberCard(member: member, alpha: cardAppearance.alpha),
        );
  }

  Transform _createTransform({
    required double width,
    required double height,
    required CardAppearance cardAppearance,
    required Widget child,
  }) {
    final matrix =
        Matrix4.translationValues(
          cardAppearance.offsetX,
          cardAppearance.offsetY,
          0,
        ) *
        Matrix4.rotationZ(cardAppearance.angle);
    return Transform(
      origin: Offset(width / 2, height),
      transform: matrix,
      child: child,
    );
  }
}

/// メンバーカード
class _MemberCard extends StatelessWidget {
  final Member member;
  final double alpha;

  const _MemberCard({required this.member, required this.alpha});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      child: Opacity(
        opacity: alpha,
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  member.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) => const SizedBox.expand(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      "${member.age}歳 ${member.prefecture}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 下部のボタン
class _DecisionButton extends StatelessWidget {
  final bool isInAnimation;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double scale;

  const _DecisionButton({
    required this.isInAnimation,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: AnimatedScale(
        scale: isInAnimation ? 1.0 : scale,
        duration: Duration(milliseconds: isInAnimation ? 200 : 0),
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          shape: const CircleBorder(),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
