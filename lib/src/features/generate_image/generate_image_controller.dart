import 'package:ai_hokusai/src/features/generate_image/generate_image_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final generateImageControllerProvider =
    StateNotifierProvider<GenerateImageController, GenerateImageModel>((ref) {
  return GenerateImageController();
});
