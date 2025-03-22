import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:skip_like_flutter/home_ui_model_state_notifier.dart';

void main() {
  group('HomeUIModelStateNotifierのテスト', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態のテスト', () {
      final state = container.read(homeUIModelStateNotifierProvider);
      expect(
        state,
        equals(
          HomeUIModel(
            isInAnimation: false,
            cardAppearance: CardAppearance(offsetY: 0, angle: 0),
            animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
          ),
        ),
      );
    });

    test('updateOffset メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );
      notifier.updateOffset(deltaY: 100);

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            cardAppearance: CardAppearance(offsetY: 100, angle: 0),
            animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
          ),
        ),
      );
    });

    test('onStartDrag メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );
      notifier.onEndDrag();
      notifier.onStartDrag();

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            cardAppearance: CardAppearance(offsetY: 0, angle: 0),
            animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
          ),
        ),
      );
    });

    test('onEndDrag メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );
      notifier.updateOffset(deltaY: 100);
      notifier.onEndDrag();

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: true,
            cardAppearance: CardAppearance(offsetY: 0, angle: 0),
            animationBeginCardAppearance: CardAppearance(
              offsetY: 100,
              angle: 0,
            ),
          ),
        ),
      );
    });
  });
}
