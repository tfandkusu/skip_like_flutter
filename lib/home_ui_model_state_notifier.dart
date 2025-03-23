import 'dart:math';

import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skip_like_flutter/model/member.dart';

part 'home_ui_model_state_notifier.g.dart';

@riverpod
class HomeUIModelStateNotifier extends _$HomeUIModelStateNotifier {
  @override
  HomeUIModel build() => HomeUIModel(
    members: [
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
    ],
    isInAnimation: false,
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

  void onPanUpdate({required double dragX, required double dragY}) {
    state = state.copyWith(
      cardAppearance: state.cardAppearance.copyWith(
        offsetY: dragY - state.startDragY,
        angle: atan2(dragX - state.startDragX, state.height),
      ),
    );
  }

  void onPanEnd() {
    state = state.copyWith(
      cardAppearance: CardAppearance(offsetX: 0, offsetY: 0, angle: 0),
      animationBeginCardAppearance: state.cardAppearance,
      isInAnimation: true,
    );
  }

  void onPanStart({
    required double width,
    required double height,
    required double startDragX,
    required double startDragY,
  }) {
    state = state.copyWith(
      isInAnimation: false,
      width: width,
      height: height,
      startDragX: startDragX,
      startDragY: startDragY,
    );
  }
}
