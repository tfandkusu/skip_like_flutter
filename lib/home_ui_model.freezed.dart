// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeUIModel {

 bool get isInAnimation; double get offsetY; double get angle;
/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUIModelCopyWith<HomeUIModel> get copyWith => _$HomeUIModelCopyWithImpl<HomeUIModel>(this as HomeUIModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUIModel&&(identical(other.isInAnimation, isInAnimation) || other.isInAnimation == isInAnimation)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.angle, angle) || other.angle == angle));
}


@override
int get hashCode => Object.hash(runtimeType,isInAnimation,offsetY,angle);

@override
String toString() {
  return 'HomeUIModel(isInAnimation: $isInAnimation, offsetY: $offsetY, angle: $angle)';
}


}

/// @nodoc
abstract mixin class $HomeUIModelCopyWith<$Res>  {
  factory $HomeUIModelCopyWith(HomeUIModel value, $Res Function(HomeUIModel) _then) = _$HomeUIModelCopyWithImpl;
@useResult
$Res call({
 bool isInAnimation, double offsetY, double angle
});




}
/// @nodoc
class _$HomeUIModelCopyWithImpl<$Res>
    implements $HomeUIModelCopyWith<$Res> {
  _$HomeUIModelCopyWithImpl(this._self, this._then);

  final HomeUIModel _self;
  final $Res Function(HomeUIModel) _then;

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isInAnimation = null,Object? offsetY = null,Object? angle = null,}) {
  return _then(_self.copyWith(
isInAnimation: null == isInAnimation ? _self.isInAnimation : isInAnimation // ignore: cast_nullable_to_non_nullable
as bool,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,angle: null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _HomeUIModel implements HomeUIModel {
  const _HomeUIModel({required this.isInAnimation, required this.offsetY, required this.angle});
  

@override final  bool isInAnimation;
@override final  double offsetY;
@override final  double angle;

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeUIModelCopyWith<_HomeUIModel> get copyWith => __$HomeUIModelCopyWithImpl<_HomeUIModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeUIModel&&(identical(other.isInAnimation, isInAnimation) || other.isInAnimation == isInAnimation)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.angle, angle) || other.angle == angle));
}


@override
int get hashCode => Object.hash(runtimeType,isInAnimation,offsetY,angle);

@override
String toString() {
  return 'HomeUIModel(isInAnimation: $isInAnimation, offsetY: $offsetY, angle: $angle)';
}


}

/// @nodoc
abstract mixin class _$HomeUIModelCopyWith<$Res> implements $HomeUIModelCopyWith<$Res> {
  factory _$HomeUIModelCopyWith(_HomeUIModel value, $Res Function(_HomeUIModel) _then) = __$HomeUIModelCopyWithImpl;
@override @useResult
$Res call({
 bool isInAnimation, double offsetY, double angle
});




}
/// @nodoc
class __$HomeUIModelCopyWithImpl<$Res>
    implements _$HomeUIModelCopyWith<$Res> {
  __$HomeUIModelCopyWithImpl(this._self, this._then);

  final _HomeUIModel _self;
  final $Res Function(_HomeUIModel) _then;

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isInAnimation = null,Object? offsetY = null,Object? angle = null,}) {
  return _then(_HomeUIModel(
isInAnimation: null == isInAnimation ? _self.isInAnimation : isInAnimation // ignore: cast_nullable_to_non_nullable
as bool,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,angle: null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
