import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generate_image_model/generate_image_model.dart';

class GenerateImageController extends StateNotifier<GenerateImageModel> {
  GenerateImageController()
      : super(const GenerateImageModel(image: '', isLoading: false));

  void switchLoadingState() {
    state = state.copyWith(isLoading: !state.isLoading);
  }

  void setImage(String image) {
    state = state.copyWith(image: image);
  }
}

final generateImageControllerProvider = StateNotifierProvider.autoDispose<
    GenerateImageController, GenerateImageModel>((ref) {
  return GenerateImageController();
});
