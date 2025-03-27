import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_appearance.freezed.dart';

@freezed
abstract class CardAppearance with _$CardAppearance {
  const factory CardAppearance({
    required double offsetX,
    required double offsetY,
    required double angle,
  }) = _CardAppearance;
}

const double skipLikeThreshold = pi / 24;

extension CardAppearanceExtension on CardAppearance {
  /// カードコンテンツの不透明度を取得します。
  double get alpha => 1.0 - min(0.3, angle.abs() / skipLikeThreshold);

  /// スキップボタンの大きさを取得します。
  double get skipButtonScale =>
      1.0 + min(0.3, 0.3 * max(0, -angle) / skipLikeThreshold);

  /// いいねボタンの大きさを取得します。
  double get likeButtonScale =>
      1.0 + min(0.3, 0.3 * max(0, angle) / skipLikeThreshold);
}
