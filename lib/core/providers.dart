import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vartur_assignment/core/provider/home_provider.dart';
import 'package:vartur_assignment/core/provider/navigation_provider.dart';

import 'network/home/home_data_source.dart';
import 'network/network_provider.dart';
import 'repository/home_repository.dart';

final navigationCtrl = StateNotifierProvider<NavigationProvider, int>(
    (ref) => NavigationProvider());

final homeCtrlProvider = StateNotifierProvider<HomeProvider, AsyncValue>(
    (ref) => HomeProvider(homeRepository: initHomeRepository()));
HomeRepository initHomeRepository() {
  return HomeRepository(
      homeDataSource: HomeDataSource(
    NetworkProvider.instance(),
  ));
}
