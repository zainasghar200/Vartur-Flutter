import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vartur_assignment/core/providers.dart';
import 'package:vartur_assignment/presenter/home/widget/photo_item.dart';
import 'package:vartur_assignment/presenter/image_detail.dart';
import 'package:vartur_assignment/shared/colors.dart';

import '../../core/models/photos_response.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(homeCtrlProvider).when(
            data: (photos) {
              return kIsWeb
                  ? ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: PhotoItem(photos: photos))
                  : PhotoItem(photos: photos);
            },
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
