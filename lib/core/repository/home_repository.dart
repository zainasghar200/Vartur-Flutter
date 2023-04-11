// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:vartur_assignment/core/network/domain/api_error.dart';
import 'package:vartur_assignment/core/models/photos_response.dart';
import 'package:vartur_assignment/shared/extensions/network_extension.dart';

import '../network/home/home_data_source.dart';
import 'base_repo/home_base_repo.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({
    required this.homeDataSource,
  });

  final HomeDataSource homeDataSource;

  @override
  Future<Either<ApiError, List<Photos>>> getAllPhotos() async {
    try {
      // int timestamp = DateTime.now().toTimeStamp();
      final response = await homeDataSource.getAllPhotos().catchDioError();
      return right(
        response ?? [],
      );
    } on DioError catch (e) {
      return left(
        e.toApiError(),
      );
    }
  }
}
