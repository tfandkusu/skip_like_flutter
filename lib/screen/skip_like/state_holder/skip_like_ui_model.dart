import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';
import 'package:skip_like_flutter/model/member.dart';

part 'skip_like_ui_model.freezed.dart';

@freezed
abstract class SkipLikeUiModel with _$SkipLikeUiModel {
  const factory SkipLikeUiModel({
    // メンバー一覧。
    required List<Member> members,
    // アニメーション中フラグ。true の時は TweenAnimationBuilder を設置する。
    required bool isInAnimation,
    // ジェスチャー認識開始フラグ。
    required bool isGestureDetectionStart,
    // 確定アニメーション中なので、タッチ操作を無効化する。
    required bool isIgnoreTouch,
    // アニメーションの持続時間。
    required Duration animationDuration,
    // 画面の幅。
    required double width,
    // 画面の高さ。
    required double height,
    // ドラッグ開始位置のX座標。
    required double startDragX,
    // ドラッグ開始位置のY座標。
    required double startDragY,
    // カードの現在表示位置。
    required CardAppearance cardAppearance,
    // アニメーション開始時のカードの表示位置。
    required CardAppearance animationBeginCardAppearance,
  }) = _SkipLikeUiModel;
}

extension HomeUiModelExtension on SkipLikeUiModel {
  /// 表示する最大3件のメンバー
  List<Member> get visibleMembers => members.take(3).toList();

  /// スキップ、いいねボタンが表示されているか。
  bool get isButtonsVisible => visibleMembers.isNotEmpty;
}
