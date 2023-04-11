import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vartur_assignment/presenter/myaccount/my_account.dart';
import 'package:vartur_assignment/presenter/search/search.dart';
import '../../presenter/home/home.dart';

class NavigationProvider extends StateNotifier<int> {
  NavigationProvider() : super(0);
  updateIndex(int index) {
    state = index;
  }

  List<String> titles = [
    "Vartur",
    "Search",
    "My Account",
  ];

  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    MyAccountScreen(),
  ];
}
