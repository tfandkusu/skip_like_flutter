import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/card_appearance.dart';
import 'package:skip_like_flutter/card_appearance_tween.dart';
import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:skip_like_flutter/home_ui_model_state_notifier.dart';
import 'package:skip_like_flutter/model/member.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiModel = ref.watch(homeUIModelStateNotifierProvider);
    final uiModelStateNotifier = ref.read(
      homeUIModelStateNotifierProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Skip or Like ?')),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
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
                _handlePanEnd(
                  details: details,
                  uiModel: uiModel,
                  uiModelStateNotifier: uiModelStateNotifier,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        32.0,
                        32.0,
                        32.0,
                        16.0,
                      ),
                      child: Stack(
                        children: _createCardWidgets(
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
                  Row(
                    children: [
                      Spacer(),
                      _DecisionButton(
                        isInAnimation: uiModel.isInAnimation,
                        icon: Icons.close,
                        scale: uiModel.cardAppearance.skipButtonScale,
                        onPressed: () {
                          _onTapSkip(
                            uiModelStateNotifier: uiModelStateNotifier,
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
                          _onTapLike(
                            uiModelStateNotifier: uiModelStateNotifier,
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
      if (i >= 1) {
        cardWidgets.add(
          Transform.translate(
            offset: Offset(0, -16.0 * i),
            child: _MemberCard(member: visibleMembers[i], alpha: 1.0),
          ),
        );
      } else {
        cardWidgets.add(
          Transform.translate(
            offset: Offset(0, -16.0 * i),
            child: _AnimatedMemberCard(
              isInAnimation: isInAnimation,
              animationDuration: animationDuration,
              width: width,
              height: height,
              cardAppearance: cardAppearance,
              animationBeginCardAppearance: animationBeginCardAppearance,
              member: visibleMembers[i],
            ),
          ),
        );
      }
    }
    return cardWidgets;
  }

  void _handlePanEnd({
    required DragEndDetails details,
    required HomeUIModel uiModel,
    required HomeUIModelStateNotifier uiModelStateNotifier,
    required double width,
    required double height,
  }) {
    final speed = details.velocity.pixelsPerSecond.dx;
    if (speed < 0 && uiModel.cardAppearance.angle < 0) {
      // 左 Fling 操作
      _onTapSkip(
        uiModelStateNotifier: uiModelStateNotifier,
        width: width,
        height: height,
      );
    } else if (speed > 0 && uiModel.cardAppearance.angle > 0) {
      // 右 Fling 操作
      _onTapLike(
        uiModelStateNotifier: uiModelStateNotifier,
        width: width,
        height: height,
      );
    } else if (uiModel.cardAppearance.angle < -skipLikeThreshold) {
      // 左に7.5度以上ドラッグした
      _onTapSkip(
        uiModelStateNotifier: uiModelStateNotifier,
        width: width,
        height: height,
      );
    } else if (uiModel.cardAppearance.angle > skipLikeThreshold) {
      // 右に7.5度以上ドラッグした
      _onTapLike(
        uiModelStateNotifier: uiModelStateNotifier,
        width: width,
        height: height,
      );
    } else {
      uiModelStateNotifier.onPanEnd();
    }
  }

  void _onTapSkip({
    required HomeUIModelStateNotifier uiModelStateNotifier,
    required double width,
    required double height,
  }) async {
    uiModelStateNotifier.onTapSkip(width: width, height: height);
    await Future.delayed(const Duration(milliseconds: 500));
    uiModelStateNotifier.onAnimationEnd();
  }

  void _onTapLike({
    required HomeUIModelStateNotifier uiModelStateNotifier,
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
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        child: Opacity(
          opacity: alpha,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(member.imagePath, fit: BoxFit.contain),
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
