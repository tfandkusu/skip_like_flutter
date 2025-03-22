import 'dart:math';
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
            width: 0.0,
            height: 0.0,
            startDragX: 0.0,
            startDragY: 0.0,
            cardAppearance: CardAppearance(offsetY: 0.0, angle: 0.0),
            animationBeginCardAppearance: CardAppearance(
              offsetY: 0.0,
              angle: 0.0,
            ),
          ),
        ),
      );
    });

    test('onPanStart メソッドのテスト', () {
      final notifier = container.read(
        homeUIModelStateNotifierProvider.notifier,
      );

      notifier.onPanStart(
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            width: 300.0,
            height: 500.0,
            startDragX: 150.0,
            startDragY: 250.0,
            cardAppearance: CardAppearance(offsetY: 0.0, angle: 0.0),
            animationBeginCardAppearance: CardAppearance(
              offsetY: 0.0,
              angle: 0.0,
            ),
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
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      // ドラッグ移動
      notifier.onPanUpdate(dragX: 200.0, dragY: 300.0);

      final expectedAngle = atan2(
        200.0 - 150.0,
        500.0,
      ); // dragX - startDragX, height
      final expectedOffsetY = 300.0 - 250.0; // dragY - startDragY

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: false,
            width: 300.0,
            height: 500.0,
            startDragX: 150.0,
            startDragY: 250.0,
            cardAppearance: CardAppearance(
              offsetY: expectedOffsetY,
              angle: expectedAngle,
            ),
            animationBeginCardAppearance: CardAppearance(
              offsetY: 0.0,
              angle: 0.0,
            ),
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
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      // ドラッグ移動
      notifier.onPanUpdate(dragX: 200.0, dragY: 300.0);

      final expectedAngle = atan2(200.0 - 150.0, 500.0);
      final expectedOffsetY = 300.0 - 250.0;

      // ドラッグ終了
      notifier.onPanEnd();

      expect(
        container.read(homeUIModelStateNotifierProvider),
        equals(
          HomeUIModel(
            isInAnimation: true,
            width: 300.0,
            height: 500.0,
            startDragX: 150.0,
            startDragY: 250.0,
            cardAppearance: CardAppearance(offsetY: 0.0, angle: 0.0),
            animationBeginCardAppearance: CardAppearance(
              offsetY: expectedOffsetY,
              angle: expectedAngle,
            ),
          ),
        ),
      );
    });
  });
}
