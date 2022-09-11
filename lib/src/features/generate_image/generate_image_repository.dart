import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generate_image_api/generate_image_api_client.dart';

class GenerateImageRepository {
  GenerateImageRepository({required this.generateImageApiClient});

  final GenerateImageApiClient generateImageApiClient;

  Future<dynamic> generateImage(Map<String, dynamic> json) {
    return generateImageApiClient.generateImage(json);
  }
}

final generateImageRepositoryProvider =
    Provider<GenerateImageRepository>((ref) {
  return GenerateImageRepository(
      generateImageApiClient: ref.watch(generateImageApiClientProvider));
});
