import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_ui_model_state_notifier.g.dart';

@riverpod
class HomeUIModelStateNotifier extends _$HomeUIModelStateNotifier {
  @override
  HomeUIModel build() => HomeUIModel(
    isInAnimation: false,
    cardAppearance: CardAppearance(offsetY: 0, angle: 0),
    animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
  );

  void updateOffset({required double deltaY}) {
    state = state.copyWith(
      cardAppearance: state.cardAppearance.copyWith(
        offsetY: state.cardAppearance.offsetY + deltaY,
      ),
    );
  }

  void onEndDrag() {
    state = state.copyWith(
      cardAppearance: CardAppearance(offsetY: 0, angle: 0),
      animationBeginCardAppearance: state.cardAppearance,
      isInAnimation: true,
    );
  }

  void onStartDrag() {
    state = state.copyWith(isInAnimation: false);
  }
}
