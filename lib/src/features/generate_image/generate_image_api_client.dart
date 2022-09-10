import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'generate_image_api_client.g.dart';

@RestApi()
abstract class GenerateImageApiClient {
  factory GenerateImageApiClient(Dio dio, {String baseUrl}) =
      _GenerateImageApiClient;

  @POST('v2')
  Future<dynamic> generateImage(@Body() Map<String, dynamic> json);
}

final generateImageApiClientProvider = Provider<GenerateImageApiClient>((ref) {
  final dio = Dio(); // Provide a dio instance
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Cache-Control': 'no-cache'
  };
  return GenerateImageApiClient(dio,
      baseUrl: "https://api.rinna.co.jp/models/tti/");
});
