import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_model.freezed.dart';

@freezed
abstract class HomeUIModel with _$HomeUIModel {
  const factory HomeUIModel({
    required bool isInAnimation,
    required double offsetY,
    required double angle,
  }) = _HomeUIModel;
}
