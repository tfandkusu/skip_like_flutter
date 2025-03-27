// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skip_like_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SkipLikeUiModel {
  List<Member> get members;
  bool get isInAnimation;
  Duration get animationDuration;
  double get width;
  double get height;
  double get startDragX;
  double get startDragY;
  CardAppearance get cardAppearance;
  CardAppearance get animationBeginCardAppearance;

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SkipLikeUiModelCopyWith<SkipLikeUiModel> get copyWith =>
      _$SkipLikeUiModelCopyWithImpl<SkipLikeUiModel>(
          this as SkipLikeUiModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SkipLikeUiModel &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.isInAnimation, isInAnimation) ||
                other.isInAnimation == isInAnimation) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.startDragX, startDragX) ||
                other.startDragX == startDragX) &&
            (identical(other.startDragY, startDragY) ||
                other.startDragY == startDragY) &&
            (identical(other.cardAppearance, cardAppearance) ||
                other.cardAppearance == cardAppearance) &&
            (identical(other.animationBeginCardAppearance,
                    animationBeginCardAppearance) ||
                other.animationBeginCardAppearance ==
                    animationBeginCardAppearance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(members),
      isInAnimation,
      animationDuration,
      width,
      height,
      startDragX,
      startDragY,
      cardAppearance,
      animationBeginCardAppearance);

  @override
  String toString() {
    return 'SkipLikeUiModel(members: $members, isInAnimation: $isInAnimation, animationDuration: $animationDuration, width: $width, height: $height, startDragX: $startDragX, startDragY: $startDragY, cardAppearance: $cardAppearance, animationBeginCardAppearance: $animationBeginCardAppearance)';
  }
}

/// @nodoc
abstract mixin class $SkipLikeUiModelCopyWith<$Res> {
  factory $SkipLikeUiModelCopyWith(
          SkipLikeUiModel value, $Res Function(SkipLikeUiModel) _then) =
      _$SkipLikeUiModelCopyWithImpl;
  @useResult
  $Res call(
      {List<Member> members,
      bool isInAnimation,
      Duration animationDuration,
      double width,
      double height,
      double startDragX,
      double startDragY,
      CardAppearance cardAppearance,
      CardAppearance animationBeginCardAppearance});

  $CardAppearanceCopyWith<$Res> get cardAppearance;
  $CardAppearanceCopyWith<$Res> get animationBeginCardAppearance;
}

/// @nodoc
class _$SkipLikeUiModelCopyWithImpl<$Res>
    implements $SkipLikeUiModelCopyWith<$Res> {
  _$SkipLikeUiModelCopyWithImpl(this._self, this._then);

  final SkipLikeUiModel _self;
  final $Res Function(SkipLikeUiModel) _then;

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
    Object? isInAnimation = null,
    Object? animationDuration = null,
    Object? width = null,
    Object? height = null,
    Object? startDragX = null,
    Object? startDragY = null,
    Object? cardAppearance = null,
    Object? animationBeginCardAppearance = null,
  }) {
    return _then(_self.copyWith(
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      isInAnimation: null == isInAnimation
          ? _self.isInAnimation
          : isInAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      animationDuration: null == animationDuration
          ? _self.animationDuration
          : animationDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      startDragX: null == startDragX
          ? _self.startDragX
          : startDragX // ignore: cast_nullable_to_non_nullable
              as double,
      startDragY: null == startDragY
          ? _self.startDragY
          : startDragY // ignore: cast_nullable_to_non_nullable
              as double,
      cardAppearance: null == cardAppearance
          ? _self.cardAppearance
          : cardAppearance // ignore: cast_nullable_to_non_nullable
              as CardAppearance,
      animationBeginCardAppearance: null == animationBeginCardAppearance
          ? _self.animationBeginCardAppearance
          : animationBeginCardAppearance // ignore: cast_nullable_to_non_nullable
              as CardAppearance,
    ));
  }

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAppearanceCopyWith<$Res> get cardAppearance {
    return $CardAppearanceCopyWith<$Res>(_self.cardAppearance, (value) {
      return _then(_self.copyWith(cardAppearance: value));
    });
  }

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAppearanceCopyWith<$Res> get animationBeginCardAppearance {
    return $CardAppearanceCopyWith<$Res>(_self.animationBeginCardAppearance,
        (value) {
      return _then(_self.copyWith(animationBeginCardAppearance: value));
    });
  }
}

/// @nodoc

class _SkipLikeUiModel implements SkipLikeUiModel {
  const _SkipLikeUiModel(
      {required final List<Member> members,
      required this.isInAnimation,
      required this.animationDuration,
      required this.width,
      required this.height,
      required this.startDragX,
      required this.startDragY,
      required this.cardAppearance,
      required this.animationBeginCardAppearance})
      : _members = members;

  final List<Member> _members;
  @override
  List<Member> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final bool isInAnimation;
  @override
  final Duration animationDuration;
  @override
  final double width;
  @override
  final double height;
  @override
  final double startDragX;
  @override
  final double startDragY;
  @override
  final CardAppearance cardAppearance;
  @override
  final CardAppearance animationBeginCardAppearance;

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SkipLikeUiModelCopyWith<_SkipLikeUiModel> get copyWith =>
      __$SkipLikeUiModelCopyWithImpl<_SkipLikeUiModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SkipLikeUiModel &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.isInAnimation, isInAnimation) ||
                other.isInAnimation == isInAnimation) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.startDragX, startDragX) ||
                other.startDragX == startDragX) &&
            (identical(other.startDragY, startDragY) ||
                other.startDragY == startDragY) &&
            (identical(other.cardAppearance, cardAppearance) ||
                other.cardAppearance == cardAppearance) &&
            (identical(other.animationBeginCardAppearance,
                    animationBeginCardAppearance) ||
                other.animationBeginCardAppearance ==
                    animationBeginCardAppearance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_members),
      isInAnimation,
      animationDuration,
      width,
      height,
      startDragX,
      startDragY,
      cardAppearance,
      animationBeginCardAppearance);

  @override
  String toString() {
    return 'SkipLikeUiModel(members: $members, isInAnimation: $isInAnimation, animationDuration: $animationDuration, width: $width, height: $height, startDragX: $startDragX, startDragY: $startDragY, cardAppearance: $cardAppearance, animationBeginCardAppearance: $animationBeginCardAppearance)';
  }
}

/// @nodoc
abstract mixin class _$SkipLikeUiModelCopyWith<$Res>
    implements $SkipLikeUiModelCopyWith<$Res> {
  factory _$SkipLikeUiModelCopyWith(
          _SkipLikeUiModel value, $Res Function(_SkipLikeUiModel) _then) =
      __$SkipLikeUiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Member> members,
      bool isInAnimation,
      Duration animationDuration,
      double width,
      double height,
      double startDragX,
      double startDragY,
      CardAppearance cardAppearance,
      CardAppearance animationBeginCardAppearance});

  @override
  $CardAppearanceCopyWith<$Res> get cardAppearance;
  @override
  $CardAppearanceCopyWith<$Res> get animationBeginCardAppearance;
}

/// @nodoc
class __$SkipLikeUiModelCopyWithImpl<$Res>
    implements _$SkipLikeUiModelCopyWith<$Res> {
  __$SkipLikeUiModelCopyWithImpl(this._self, this._then);

  final _SkipLikeUiModel _self;
  final $Res Function(_SkipLikeUiModel) _then;

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? members = null,
    Object? isInAnimation = null,
    Object? animationDuration = null,
    Object? width = null,
    Object? height = null,
    Object? startDragX = null,
    Object? startDragY = null,
    Object? cardAppearance = null,
    Object? animationBeginCardAppearance = null,
  }) {
    return _then(_SkipLikeUiModel(
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      isInAnimation: null == isInAnimation
          ? _self.isInAnimation
          : isInAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      animationDuration: null == animationDuration
          ? _self.animationDuration
          : animationDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      startDragX: null == startDragX
          ? _self.startDragX
          : startDragX // ignore: cast_nullable_to_non_nullable
              as double,
      startDragY: null == startDragY
          ? _self.startDragY
          : startDragY // ignore: cast_nullable_to_non_nullable
              as double,
      cardAppearance: null == cardAppearance
          ? _self.cardAppearance
          : cardAppearance // ignore: cast_nullable_to_non_nullable
              as CardAppearance,
      animationBeginCardAppearance: null == animationBeginCardAppearance
          ? _self.animationBeginCardAppearance
          : animationBeginCardAppearance // ignore: cast_nullable_to_non_nullable
              as CardAppearance,
    ));
  }

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAppearanceCopyWith<$Res> get cardAppearance {
    return $CardAppearanceCopyWith<$Res>(_self.cardAppearance, (value) {
      return _then(_self.copyWith(cardAppearance: value));
    });
  }

  /// Create a copy of SkipLikeUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAppearanceCopyWith<$Res> get animationBeginCardAppearance {
    return $CardAppearanceCopyWith<$Res>(_self.animationBeginCardAppearance,
        (value) {
      return _then(_self.copyWith(animationBeginCardAppearance: value));
    });
  }
}

// dart format on
