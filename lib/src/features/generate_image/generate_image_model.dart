import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_image_model.freezed.dart';

@freezed
class GenerateImageModel with _$GenerateImageModel {
  const factory GenerateImageModel({
    required bool isLoading,
    required String image,
  }) = _GenerateImageModel;

  // factory GenerateImageModel.fromJson(Map<String, Object?> json) =>
  //     _$GenerateImageModelFromJson(json);
}
