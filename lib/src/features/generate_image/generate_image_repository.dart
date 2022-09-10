import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateImageRepository {}

final generateImageRepositoryProvider =
    Provider<GenerateImageRepository>((ref) {
  return GenerateImageRepository();
});
