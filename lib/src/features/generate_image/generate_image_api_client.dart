import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'generate_image_api_client.g.dart';

@RestApi()
abstract class GenerateImageApiClient {
  factory GenerateImageApiClient(Dio dio, {String baseUrl}) =
      _GenerateImageApiClient;

  @POST('users')
  Future<dynamic> generateImage(@Body() Map<String, dynamic> json);
}

final userApiClientProvider = Provider<GenerateImageApiClient>((ref) {
  return GenerateImageApiClient(Dio(),
      baseUrl: "https://api.rinna.co.jp/models/tti/v2");
});
