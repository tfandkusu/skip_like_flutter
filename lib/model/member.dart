import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

@freezed
abstract class Member with _$Member {
  const factory Member({
    required int id,
    required int age,
    required String prefecture,
    required String imagePath,
  }) = _Member;
}
