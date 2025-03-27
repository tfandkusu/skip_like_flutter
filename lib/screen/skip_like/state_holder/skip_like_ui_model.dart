import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';
import 'package:skip_like_flutter/model/member.dart';

part 'skip_like_ui_model.freezed.dart';

@freezed
abstract class SkipLikeUiModel with _$SkipLikeUiModel {
  const factory SkipLikeUiModel({
    required List<Member> members,
    required bool isInAnimation,
    required Duration animationDuration,
    required double width,
    required double height,
    required double startDragX,
    required double startDragY,
    required CardAppearance cardAppearance,
    required CardAppearance animationBeginCardAppearance,
  }) = _SkipLikeUiModel;
}

extension HomeUiModelExtension on SkipLikeUiModel {
  /// 表示可能な最大3件のメンバーを取得します
  List<Member> get visibleMembers => members.take(3).toList();
}
