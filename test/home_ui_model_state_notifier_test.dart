import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/home_ui_model.dart';
import 'package:skip_like_flutter/home_ui_model_state_notifier.dart';

void main() {
  group('HomeUIModelStateNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態のテスト', () {
      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            width: 0,
            height: 0,
            startDragX: 0,
            startDragY: 0,
            cardAppearance: CardAppearance(offsetY: 0, angle: 0),
            animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
          ),
        ),
      );
    });

    test('onPanStart メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );

      notifier.onPanStart(
        width: 300,
        height: 500,
        startDragX: 150,
        startDragY: 250,
      );

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            width: 300,
            height: 500,
            startDragX: 150,
            startDragY: 250,
            cardAppearance: CardAppearance(offsetY: 0, angle: 0),
            animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
          ),
        ),
      );
    });

    test('onPanUpdate メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );

      // ドラッグ開始位置を設定
      notifier.onPanStart(
        width: 300,
        height: 500,
        startDragX: 150,
        startDragY: 250,
      );

      // ドラッグ移動
      notifier.onPanUpdate(dragX: 150, dragY: 350);

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            width: 300,
            height: 500,
            startDragX: 150,
            startDragY: 250,
            cardAppearance: CardAppearance(offsetY: 100, angle: 0), // 350 - 250
            animationBeginCardAppearance: CardAppearance(offsetY: 0, angle: 0),
          ),
        ),
      );
    });

    test('onPanEnd メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );

      // ドラッグ開始位置を設定
      notifier.onPanStart(
        width: 300,
        height: 500,
        startDragX: 150,
        startDragY: 250,
      );

      // ドラッグ移動
      notifier.onPanUpdate(dragX: 150, dragY: 350);

      // ドラッグ終了
      notifier.onPanEnd();

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: true,
            width: 300,
            height: 500,
            startDragX: 150,
            startDragY: 250,
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
