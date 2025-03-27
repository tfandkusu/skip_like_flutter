import 'package:flutter_test/flutter_test.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';

void main() {
  group('CardAppearanceExtension', () {
    test('angleが0の時、alphaは1.0、ボタンの大きさは1.0', () {
      final appearance = CardAppearance(offsetX: 0.0, offsetY: 0.0, angle: 0.0);
      expect(appearance.alpha, 1.0);
      expect(appearance.skipButtonScale, 1.0);
      expect(appearance.likeButtonScale, 1.0);
    });

    test('angleがskipLikeThresholdの時、alphaは0.7、スキップボタンの大きさは1.3', () {
      final appearance = CardAppearance(
        offsetX: 0.0,
        offsetY: 0.0,
        angle: skipLikeThreshold,
      );
      expect(appearance.alpha, 0.7);
      expect(appearance.skipButtonScale, 1.0);
      expect(appearance.likeButtonScale, 1.3);
    });

    test('angleが-skipLikeThresholdの時、alphaは0.7、いいねボタンの大きさは1.3', () {
      final appearance = CardAppearance(
        offsetX: 0.0,
        offsetY: 0.0,
        angle: -skipLikeThreshold,
      );
      expect(appearance.alpha, 0.7);
      expect(appearance.skipButtonScale, 1.3);
      expect(appearance.likeButtonScale, 1.0);
    });

    test(
      'angleがskipLikeThresholdの2倍の時、alphaは0.7（最大値）、スキップボタンの大きさは1.3、いいねボタンの大きさは1.0',
      () {
        final appearance = CardAppearance(
          offsetX: 0.0,
          offsetY: 0.0,
          angle: skipLikeThreshold * 2,
        );
        expect(appearance.alpha, 0.7);
        expect(appearance.skipButtonScale, 1.0);
        expect(appearance.likeButtonScale, 1.3);
      },
    );

    test(
      'angleが-skipLikeThresholdの2倍の時、alphaは0.7（最大値）、スキップボタンの大きさは1.0、いいねボタンの大きさは1.3',
      () {
        final appearance = CardAppearance(
          offsetX: 0.0,
          offsetY: 0.0,
          angle: -skipLikeThreshold * 2,
        );
        expect(appearance.alpha, 0.7);
        expect(appearance.skipButtonScale, 1.3);
        expect(appearance.likeButtonScale, 1.0);
      },
    );
  });
}
