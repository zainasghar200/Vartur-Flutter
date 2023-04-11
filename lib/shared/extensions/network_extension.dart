import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/network/domain/api_error.dart';

extension ErrorHandlingExtension<T> on Future<T> {
  Future<T> catchDioError() {
    return catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final response = (obj as DioError).response;
          if (response != null) {
            throw DioError(
              requestOptions: response.requestOptions,
              response: response,
              error:
                  'DioException ${response.statusCode}: ${response.statusMessage}',
            );
          }
          break;
        default:
          break;
      }
    });
  }
}

extension ApiErrorParser on DioError {
  ApiError toApiError() {
    ApiError apiError = ApiError(status: 0, message: 'Error');
    apiError = apiError.copyWith(
      status: response?.statusCode ?? 404,
      message: response?.statusMessage ?? 'Error from server',
    );
    debugPrint('Got error : ${apiError.status} -> ${apiError.message}');
    return apiError;
  }
}
