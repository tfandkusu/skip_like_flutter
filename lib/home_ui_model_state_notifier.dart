import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_ui_model_state_notifier.g.dart';

@riverpod
class HomeUIModelStateNotifier extends _$HomeUIModelStateNotifier {
  @override
  HomeUIModel build() =>
      HomeUIModel(isInAnimation: false, offsetY: 0, angle: 0);

  void updateOffset({required double deltaY}) {
    state = state.copyWith(offsetY: state.offsetY + deltaY);
  }

  void onEndDrag() {
    state = state.copyWith(offsetY: 0, isInAnimation: true);
  }

  void onStartDrag() {
    state = state.copyWith(isInAnimation: false);
  }
}
