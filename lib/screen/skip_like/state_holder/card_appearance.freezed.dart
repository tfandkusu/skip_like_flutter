// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_appearance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardAppearance {
  double get offsetX;
  double get offsetY;
  double get angle;

  /// Create a copy of CardAppearance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardAppearanceCopyWith<CardAppearance> get copyWith =>
      _$CardAppearanceCopyWithImpl<CardAppearance>(
          this as CardAppearance, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardAppearance &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY) &&
            (identical(other.angle, angle) || other.angle == angle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offsetX, offsetY, angle);

  @override
  String toString() {
    return 'CardAppearance(offsetX: $offsetX, offsetY: $offsetY, angle: $angle)';
  }
}

/// @nodoc
abstract mixin class $CardAppearanceCopyWith<$Res> {
  factory $CardAppearanceCopyWith(
          CardAppearance value, $Res Function(CardAppearance) _then) =
      _$CardAppearanceCopyWithImpl;
  @useResult
  $Res call({double offsetX, double offsetY, double angle});
}

/// @nodoc
class _$CardAppearanceCopyWithImpl<$Res>
    implements $CardAppearanceCopyWith<$Res> {
  _$CardAppearanceCopyWithImpl(this._self, this._then);

  final CardAppearance _self;
  final $Res Function(CardAppearance) _then;

  /// Create a copy of CardAppearance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offsetX = null,
    Object? offsetY = null,
    Object? angle = null,
  }) {
    return _then(_self.copyWith(
      offsetX: null == offsetX
          ? _self.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _self.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _self.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _CardAppearance implements CardAppearance {
  const _CardAppearance(
      {required this.offsetX, required this.offsetY, required this.angle});

  @override
  final double offsetX;
  @override
  final double offsetY;
  @override
  final double angle;

  /// Create a copy of CardAppearance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CardAppearanceCopyWith<_CardAppearance> get copyWith =>
      __$CardAppearanceCopyWithImpl<_CardAppearance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardAppearance &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY) &&
            (identical(other.angle, angle) || other.angle == angle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offsetX, offsetY, angle);

  @override
  String toString() {
    return 'CardAppearance(offsetX: $offsetX, offsetY: $offsetY, angle: $angle)';
  }
}

/// @nodoc
abstract mixin class _$CardAppearanceCopyWith<$Res>
    implements $CardAppearanceCopyWith<$Res> {
  factory _$CardAppearanceCopyWith(
          _CardAppearance value, $Res Function(_CardAppearance) _then) =
      __$CardAppearanceCopyWithImpl;
  @override
  @useResult
  $Res call({double offsetX, double offsetY, double angle});
}

/// @nodoc
class __$CardAppearanceCopyWithImpl<$Res>
    implements _$CardAppearanceCopyWith<$Res> {
  __$CardAppearanceCopyWithImpl(this._self, this._then);

  final _CardAppearance _self;
  final $Res Function(_CardAppearance) _then;

  /// Create a copy of CardAppearance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? offsetX = null,
    Object? offsetY = null,
    Object? angle = null,
  }) {
    return _then(_CardAppearance(
      offsetX: null == offsetX
          ? _self.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _self.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _self.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
