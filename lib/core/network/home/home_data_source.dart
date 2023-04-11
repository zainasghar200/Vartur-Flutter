import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vartur_assignment/core/models/photos_response.dart';

import '../api_constant.dart';

part 'home_data_source.g.dart';

@RestApi(
  baseUrl: ApiConstant.baseUrl,
)
abstract class HomeDataSource {
  factory HomeDataSource(
    Dio dioBuilder,
  ) = _HomeDataSource;

  @GET("/photos")
  Future<List<Photos>> getAllPhotos();
}
