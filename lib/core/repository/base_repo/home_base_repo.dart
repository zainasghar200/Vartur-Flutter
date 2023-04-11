import 'package:fpdart/fpdart.dart';
import 'package:vartur_assignment/core/models/photos_response.dart';

import '../../network/domain/api_error.dart';

abstract class IHomeRepository {
  Future<Either<ApiError, List<Photos>>> getAllPhotos();
}
