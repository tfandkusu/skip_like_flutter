import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_ui_model_state_notifier.g.dart';

@riverpod
class HomeUIModelStateNotifier extends _$HomeUIModelStateNotifier {
  @override
  HomeUIModel build() => HomeUIModel(
    isInAnimation: false,
    width: 0,
    height: 0,
    startDragX: 0,
    startDragY: 0,
    cardAppearance: CardAppearance(offsetY: 0, angle: 0),
    animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
  );

  void onPanUpdate({required double dragX, required double dragY}) {
    state = state.copyWith(
      cardAppearance: state.cardAppearance.copyWith(
        offsetY: dragY - state.startDragY,
      ),
    );
  }

  void onPanEnd() {
    state = state.copyWith(
      cardAppearance: CardAppearance(offsetY: 0, angle: 0),
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
