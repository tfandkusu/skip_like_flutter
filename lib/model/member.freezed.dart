// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Member {
  int get id;
  int get age;
  String get prefecture;
  String get imagePath;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberCopyWith<Member> get copyWith =>
      _$MemberCopyWithImpl<Member>(this as Member, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Member &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, age, prefecture, imagePath);

  @override
  String toString() {
    return 'Member(id: $id, age: $age, prefecture: $prefecture, imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) _then) =
      _$MemberCopyWithImpl;
  @useResult
  $Res call({int id, int age, String prefecture, String imagePath});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._self, this._then);

  final Member _self;
  final $Res Function(Member) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = null,
    Object? prefecture = null,
    Object? imagePath = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      prefecture: null == prefecture
          ? _self.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Member implements Member {
  const _Member(
      {required this.id,
      required this.age,
      required this.prefecture,
      required this.imagePath});

  @override
  final int id;
  @override
  final int age;
  @override
  final String prefecture;
  @override
  final String imagePath;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Member &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, age, prefecture, imagePath);

  @override
  String toString() {
    return 'Member(id: $id, age: $age, prefecture: $prefecture, imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) _then) =
      __$MemberCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int age, String prefecture, String imagePath});
}

/// @nodoc
class __$MemberCopyWithImpl<$Res> implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(this._self, this._then);

  final _Member _self;
  final $Res Function(_Member) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? age = null,
    Object? prefecture = null,
    Object? imagePath = null,
  }) {
    return _then(_Member(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      prefecture: null == prefecture
          ? _self.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
