import 'package:flutter/animation.dart';
import 'package:skip_like_flutter/home_ui_model.dart';

class CardAppearanceTween extends Tween<CardAppearance> {
  CardAppearanceTween({required super.begin, required super.end});

  @override
  CardAppearance lerp(double t) {
    return CardAppearance(
      offsetY: begin!.offsetY + (end!.offsetY - begin!.offsetY) * t,
      angle: begin!.angle + (end!.angle - begin!.angle) * t,
    );
  }
}
