import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_model.freezed.dart';

@freezed
abstract class HomeUIModel with _$HomeUIModel {
  const factory HomeUIModel({
    required bool isInAnimation,
    required MemberCardAppearance memberCardAppearance,
    required MemberCardAppearance animationBeginMemberCardAppearance,
  }) = _HomeUIModel;
}

@freezed
abstract class MemberCardAppearance with _$MemberCardAppearance {
  const factory MemberCardAppearance({
    required double offsetY,
    required double angle,
  }) = _MemberCardAppearance;
}

extension MemberCardAppearanceExtension on MemberCardAppearance {
  MemberCardAppearance operator +(MemberCardAppearance other) {
    return MemberCardAppearance(
      offsetY: offsetY + other.offsetY,
      angle: angle + other.angle,
    );
  }

  MemberCardAppearance operator -(MemberCardAppearance other) {
    return MemberCardAppearance(
      offsetY: offsetY - other.offsetY,
      angle: angle - other.angle,
    );
  }

  MemberCardAppearance operator *(double operand) {
    return MemberCardAppearance(
      offsetY: offsetY * operand,
      angle: angle * operand,
    );
  }
}
