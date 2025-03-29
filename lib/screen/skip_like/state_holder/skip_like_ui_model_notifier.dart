import 'dart:math';

import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/skip_like_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skip_like_flutter/model/member.dart';

part 'skip_like_ui_model_notifier.g.dart';

@riverpod
class SkipLikeUiModelNotifier extends _$SkipLikeUiModelNotifier {
  @override
  SkipLikeUiModel build() => SkipLikeUiModel(
    members: _createMembers(),
    isInAnimation: false,
    isIgnoreTouch: false,
    isGestureDetectionStart: false,
    animationDuration: const Duration(),
    width: 0,
    height: 0,
    startDragX: 0,
    startDragY: 0,
    cardAppearance: CardAppearance(offsetX: 0, offsetY: 0, angle: 0),
    animationBeginCardAppearance: CardAppearance(
      offsetX: 0,
      offsetY: 0,
      angle: 0,
    ),
  );

  /// ドラッグ操作開始時処理。
  void onPanStart({
    required double width,
    required double height,
    required double startDragX,
    required double startDragY,
  }) {
    state = state.copyWith(
      isInAnimation: false,
      isGestureDetectionStart: true,
      width: width,
      height: height,
      startDragX: startDragX,
      startDragY: startDragY,
    );
  }

  /// ドラッグ操作中処理。
  void onPanUpdate({required double dragX, required double dragY}) {
    state = state.copyWith(
      cardAppearance: state.cardAppearance.copyWith(
        offsetY: dragY - state.startDragY,
        angle: atan2(dragX - state.startDragX, state.height),
      ),
    );
  }

  /// ドラッグ操作終了時処理。
  void onPanEnd() {
    state = state.copyWith(
      isInAnimation: true,
      isGestureDetectionStart: false,
      cardAppearance: CardAppearance(offsetX: 0.0, offsetY: 0.0, angle: 0.0),
      animationBeginCardAppearance: state.cardAppearance,
      animationDuration: const Duration(milliseconds: 200),
    );
  }

  /// ドラッグ操作キャンセル時処理。
  void onPanCancel() {
    onPanEnd();
  }

  /// スキップ処理。
  void skip({required double width, required double height}) {
    state = state.copyWith(
      isInAnimation: true,
      isIgnoreTouch: true,
      isGestureDetectionStart: false,
      animationDuration: const Duration(milliseconds: 500),
      animationBeginCardAppearance: state.cardAppearance,
      cardAppearance: CardAppearance(
        offsetX: -width,
        offsetY: height,
        angle: state.cardAppearance.angle,
      ),
    );
  }

  /// いいね処理。
  void like({required double width, required double height}) {
    state = state.copyWith(
      isInAnimation: true,
      isIgnoreTouch: true,
      isGestureDetectionStart: false,
      animationDuration: const Duration(milliseconds: 500),
      animationBeginCardAppearance: state.cardAppearance,
      cardAppearance: CardAppearance(
        offsetX: width,
        offsetY: height,
        angle: state.cardAppearance.angle,
      ),
    );
  }

  /// アニメーション終了時処理。
  void onAnimationEnd() {
    state = state.copyWith(
      isInAnimation: false,
      isIgnoreTouch: false,
      isGestureDetectionStart: false,
      cardAppearance: CardAppearance(offsetX: 0.0, offsetY: 0.0, angle: 0.0),
      animationBeginCardAppearance: CardAppearance(
        offsetX: 0.0,
        offsetY: 0.0,
        angle: 0.0,
      ),
      members: state.members.skip(1).toList(),
    );
  }

  /// リセット処理。
  void onResetPressed() {
    state = state.copyWith(members: _createMembers());
  }

  /// メンバーを作成する。
  List<Member> _createMembers() {
    return [
      Member(
        id: 1,
        age: 33,
        prefecture: '東京',
        imagePath: 'assets/member_01.png',
      ),
      Member(
        id: 2,
        age: 28,
        prefecture: '埼玉',
        imagePath: 'assets/member_02.png',
      ),
      Member(
        id: 3,
        age: 24,
        prefecture: '東京',
        imagePath: 'assets/member_03.png',
      ),
      Member(
        id: 4,
        age: 31,
        prefecture: '千葉',
        imagePath: 'assets/member_04.png',
      ),
    ];
  }
}
