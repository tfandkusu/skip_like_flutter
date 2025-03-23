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

 List<Member> get members; bool get isInAnimation; double get width; double get height; double get startDragX; double get startDragY; CardAppearance get cardAppearance; CardAppearance get animationBeginCardAppearance;
/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUIModelCopyWith<HomeUIModel> get copyWith => _$HomeUIModelCopyWithImpl<HomeUIModel>(this as HomeUIModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUIModel&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.isInAnimation, isInAnimation) || other.isInAnimation == isInAnimation)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.startDragX, startDragX) || other.startDragX == startDragX)&&(identical(other.startDragY, startDragY) || other.startDragY == startDragY)&&(identical(other.cardAppearance, cardAppearance) || other.cardAppearance == cardAppearance)&&(identical(other.animationBeginCardAppearance, animationBeginCardAppearance) || other.animationBeginCardAppearance == animationBeginCardAppearance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(members),isInAnimation,width,height,startDragX,startDragY,cardAppearance,animationBeginCardAppearance);

@override
String toString() {
  return 'HomeUIModel(members: $members, isInAnimation: $isInAnimation, width: $width, height: $height, startDragX: $startDragX, startDragY: $startDragY, cardAppearance: $cardAppearance, animationBeginCardAppearance: $animationBeginCardAppearance)';
}


}

/// @nodoc
abstract mixin class $HomeUIModelCopyWith<$Res>  {
  factory $HomeUIModelCopyWith(HomeUIModel value, $Res Function(HomeUIModel) _then) = _$HomeUIModelCopyWithImpl;
@useResult
$Res call({
 List<Member> members, bool isInAnimation, double width, double height, double startDragX, double startDragY, CardAppearance cardAppearance, CardAppearance animationBeginCardAppearance
});


$CardAppearanceCopyWith<$Res> get cardAppearance;$CardAppearanceCopyWith<$Res> get animationBeginCardAppearance;

}
/// @nodoc
class _$HomeUIModelCopyWithImpl<$Res>
    implements $HomeUIModelCopyWith<$Res> {
  _$HomeUIModelCopyWithImpl(this._self, this._then);

  final HomeUIModel _self;
  final $Res Function(HomeUIModel) _then;

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? members = null,Object? isInAnimation = null,Object? width = null,Object? height = null,Object? startDragX = null,Object? startDragY = null,Object? cardAppearance = null,Object? animationBeginCardAppearance = null,}) {
  return _then(_self.copyWith(
members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<Member>,isInAnimation: null == isInAnimation ? _self.isInAnimation : isInAnimation // ignore: cast_nullable_to_non_nullable
as bool,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,startDragX: null == startDragX ? _self.startDragX : startDragX // ignore: cast_nullable_to_non_nullable
as double,startDragY: null == startDragY ? _self.startDragY : startDragY // ignore: cast_nullable_to_non_nullable
as double,cardAppearance: null == cardAppearance ? _self.cardAppearance : cardAppearance // ignore: cast_nullable_to_non_nullable
as CardAppearance,animationBeginCardAppearance: null == animationBeginCardAppearance ? _self.animationBeginCardAppearance : animationBeginCardAppearance // ignore: cast_nullable_to_non_nullable
as CardAppearance,
  ));
}
/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardAppearanceCopyWith<$Res> get cardAppearance {
  
  return $CardAppearanceCopyWith<$Res>(_self.cardAppearance, (value) {
    return _then(_self.copyWith(cardAppearance: value));
  });
}/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardAppearanceCopyWith<$Res> get animationBeginCardAppearance {
  
  return $CardAppearanceCopyWith<$Res>(_self.animationBeginCardAppearance, (value) {
    return _then(_self.copyWith(animationBeginCardAppearance: value));
  });
}
}


/// @nodoc


class _HomeUIModel implements HomeUIModel {
  const _HomeUIModel({required final  List<Member> members, required this.isInAnimation, required this.width, required this.height, required this.startDragX, required this.startDragY, required this.cardAppearance, required this.animationBeginCardAppearance}): _members = members;
  

 final  List<Member> _members;
@override List<Member> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override final  bool isInAnimation;
@override final  double width;
@override final  double height;
@override final  double startDragX;
@override final  double startDragY;
@override final  CardAppearance cardAppearance;
@override final  CardAppearance animationBeginCardAppearance;

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeUIModelCopyWith<_HomeUIModel> get copyWith => __$HomeUIModelCopyWithImpl<_HomeUIModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeUIModel&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.isInAnimation, isInAnimation) || other.isInAnimation == isInAnimation)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.startDragX, startDragX) || other.startDragX == startDragX)&&(identical(other.startDragY, startDragY) || other.startDragY == startDragY)&&(identical(other.cardAppearance, cardAppearance) || other.cardAppearance == cardAppearance)&&(identical(other.animationBeginCardAppearance, animationBeginCardAppearance) || other.animationBeginCardAppearance == animationBeginCardAppearance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_members),isInAnimation,width,height,startDragX,startDragY,cardAppearance,animationBeginCardAppearance);

@override
String toString() {
  return 'HomeUIModel(members: $members, isInAnimation: $isInAnimation, width: $width, height: $height, startDragX: $startDragX, startDragY: $startDragY, cardAppearance: $cardAppearance, animationBeginCardAppearance: $animationBeginCardAppearance)';
}


}

/// @nodoc
abstract mixin class _$HomeUIModelCopyWith<$Res> implements $HomeUIModelCopyWith<$Res> {
  factory _$HomeUIModelCopyWith(_HomeUIModel value, $Res Function(_HomeUIModel) _then) = __$HomeUIModelCopyWithImpl;
@override @useResult
$Res call({
 List<Member> members, bool isInAnimation, double width, double height, double startDragX, double startDragY, CardAppearance cardAppearance, CardAppearance animationBeginCardAppearance
});


@override $CardAppearanceCopyWith<$Res> get cardAppearance;@override $CardAppearanceCopyWith<$Res> get animationBeginCardAppearance;

}
/// @nodoc
class __$HomeUIModelCopyWithImpl<$Res>
    implements _$HomeUIModelCopyWith<$Res> {
  __$HomeUIModelCopyWithImpl(this._self, this._then);

  final _HomeUIModel _self;
  final $Res Function(_HomeUIModel) _then;

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? members = null,Object? isInAnimation = null,Object? width = null,Object? height = null,Object? startDragX = null,Object? startDragY = null,Object? cardAppearance = null,Object? animationBeginCardAppearance = null,}) {
  return _then(_HomeUIModel(
members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<Member>,isInAnimation: null == isInAnimation ? _self.isInAnimation : isInAnimation // ignore: cast_nullable_to_non_nullable
as bool,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,startDragX: null == startDragX ? _self.startDragX : startDragX // ignore: cast_nullable_to_non_nullable
as double,startDragY: null == startDragY ? _self.startDragY : startDragY // ignore: cast_nullable_to_non_nullable
as double,cardAppearance: null == cardAppearance ? _self.cardAppearance : cardAppearance // ignore: cast_nullable_to_non_nullable
as CardAppearance,animationBeginCardAppearance: null == animationBeginCardAppearance ? _self.animationBeginCardAppearance : animationBeginCardAppearance // ignore: cast_nullable_to_non_nullable
as CardAppearance,
  ));
}

/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardAppearanceCopyWith<$Res> get cardAppearance {
  
  return $CardAppearanceCopyWith<$Res>(_self.cardAppearance, (value) {
    return _then(_self.copyWith(cardAppearance: value));
  });
}/// Create a copy of HomeUIModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardAppearanceCopyWith<$Res> get animationBeginCardAppearance {
  
  return $CardAppearanceCopyWith<$Res>(_self.animationBeginCardAppearance, (value) {
    return _then(_self.copyWith(animationBeginCardAppearance: value));
  });
}
}

/// @nodoc
mixin _$CardAppearance {

 double get offsetY; double get angle;
/// Create a copy of CardAppearance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardAppearanceCopyWith<CardAppearance> get copyWith => _$CardAppearanceCopyWithImpl<CardAppearance>(this as CardAppearance, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardAppearance&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.angle, angle) || other.angle == angle));
}


@override
int get hashCode => Object.hash(runtimeType,offsetY,angle);

@override
String toString() {
  return 'CardAppearance(offsetY: $offsetY, angle: $angle)';
}


}

/// @nodoc
abstract mixin class $CardAppearanceCopyWith<$Res>  {
  factory $CardAppearanceCopyWith(CardAppearance value, $Res Function(CardAppearance) _then) = _$CardAppearanceCopyWithImpl;
@useResult
$Res call({
 double offsetY, double angle
});




}
/// @nodoc
class _$CardAppearanceCopyWithImpl<$Res>
    implements $CardAppearanceCopyWith<$Res> {
  _$CardAppearanceCopyWithImpl(this._self, this._then);

  final CardAppearance _self;
  final $Res Function(CardAppearance) _then;

/// Create a copy of CardAppearance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offsetY = null,Object? angle = null,}) {
  return _then(_self.copyWith(
offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,angle: null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _CardAppearance implements CardAppearance {
  const _CardAppearance({required this.offsetY, required this.angle});
  

@override final  double offsetY;
@override final  double angle;

/// Create a copy of CardAppearance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardAppearanceCopyWith<_CardAppearance> get copyWith => __$CardAppearanceCopyWithImpl<_CardAppearance>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardAppearance&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.angle, angle) || other.angle == angle));
}


@override
int get hashCode => Object.hash(runtimeType,offsetY,angle);

@override
String toString() {
  return 'CardAppearance(offsetY: $offsetY, angle: $angle)';
}


}

/// @nodoc
abstract mixin class _$CardAppearanceCopyWith<$Res> implements $CardAppearanceCopyWith<$Res> {
  factory _$CardAppearanceCopyWith(_CardAppearance value, $Res Function(_CardAppearance) _then) = __$CardAppearanceCopyWithImpl;
@override @useResult
$Res call({
 double offsetY, double angle
});




}
/// @nodoc
class __$CardAppearanceCopyWithImpl<$Res>
    implements _$CardAppearanceCopyWith<$Res> {
  __$CardAppearanceCopyWithImpl(this._self, this._then);

  final _CardAppearance _self;
  final $Res Function(_CardAppearance) _then;

/// Create a copy of CardAppearance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offsetY = null,Object? angle = null,}) {
  return _then(_CardAppearance(
offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,angle: null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
