import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vartur_assignment/core/providers.dart';
import 'package:vartur_assignment/shared/colors.dart';

import '../core/network/home/home_data_source.dart';
import '../core/network/network_provider.dart';
import '../core/repository/base_repo/home_base_repo.dart';
import '../core/repository/home_repository.dart';

class VarturApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(navigationCtrl);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.watch(navigationCtrl.notifier).titles[currentIndex],
          style: const TextStyle(
            color: VarturColors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentIndex == 1
            ? VarturColors.mainColor
            : VarturColors.secondaryColor,
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
          ref.watch(navigationCtrl.notifier).updateIndex(1);
        },

        child: Icon(
          Icons.search,
          size: currentIndex == 1 ? 30 : 24,
        ), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button location to left

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold

        // color: Colors.redAccent,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              borderRadius: BorderRadius.circular(20),
              highlightColor: VarturColors.lightWhite,
              onTap: () {
                ref.watch(navigationCtrl.notifier).updateIndex(0);
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: currentIndex != 0 ? 8.0 : 2, left: 10, right: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: currentIndex == 0
                          ? VarturColors.mainColor
                          : VarturColors.secondaryColor,
                      size: currentIndex == 0 ? 30 : 24,
                    ),
                    Text("Vartur",
                        style: TextStyle(
                            color: currentIndex == 0
                                ? VarturColors.mainColor
                                : VarturColors.secondaryColor,
                            fontSize: currentIndex == 0 ? 12 : 10)),
                  ],
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              highlightColor: VarturColors.lightWhite,
              onTap: () {
                ref.watch(navigationCtrl.notifier).updateIndex(2);
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: currentIndex != 2 ? 8.0 : 2, left: 10, right: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: currentIndex == 2
                          ? VarturColors.mainColor
                          : VarturColors.secondaryColor,
                      size: currentIndex == 2 ? 28 : 24,
                    ),
                    Text(
                      "My Account",
                      style: TextStyle(
                          color: currentIndex == 2
                              ? VarturColors.mainColor
                              : VarturColors.secondaryColor,
                          fontSize: currentIndex == 2 ? 12 : 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ref.watch(navigationCtrl.notifier).pages[currentIndex],
    );
  }
}
