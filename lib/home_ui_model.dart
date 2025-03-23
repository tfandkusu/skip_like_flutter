import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skip_like_flutter/model/member.dart';

part 'home_ui_model.freezed.dart';

@freezed
abstract class HomeUIModel with _$HomeUIModel {
  const factory HomeUIModel({
    required List<Member> members,
    required bool isInAnimation,
    required double width,
    required double height,
    required double startDragX,
    required double startDragY,
    required CardAppearance cardAppearance,
    required CardAppearance animationBeginCardAppearance,
  }) = _HomeUIModel;
}

@freezed
abstract class CardAppearance with _$CardAppearance {
  const factory CardAppearance({
    required double offsetX,
    required double offsetY,
    required double angle,
  }) = _CardAppearance;
}

extension HomeUiModelExtension on HomeUIModel {
  /// 表示可能な最大3件のメンバーを取得します
  List<Member> get visibleMembers => members.take(3).toList();
}
