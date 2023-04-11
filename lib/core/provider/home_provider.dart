import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vartur_assignment/core/repository/home_repository.dart';

import '../models/photos_response.dart';
import '../network/domain/api_error.dart';

class HomeProvider extends StateNotifier<AsyncValue<List<Photos>>> {
  HomeProvider({
    required this.homeRepository,
  }) : super(const AsyncValue.loading()) {
    _onFetchPhotos();
  }

  final HomeRepository homeRepository;

  Future<void> _onFetchPhotos() async {
    final response = await homeRepository.getAllPhotos();
    state = response.fold(
      (ApiError apiError) {
        return AsyncValue.error(apiError.message ?? 'Error From Server',
            StackTrace.fromString(apiError.message ?? 'Error From Server'));
      },
      (List<Photos> photos) {
        return AsyncValue.data(photos);
      },
    );
  }
}
