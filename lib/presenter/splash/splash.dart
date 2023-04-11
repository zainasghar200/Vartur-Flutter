import 'package:flutter/material.dart';
import 'package:vartur_assignment/presenter/vartur_app.dart';

import '../../shared/assets.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    gotoMain(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Image.asset(
          VarturImages.logo,
        ),
      )),
    );
  }

  gotoMain(context) async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => VarturApp()),
        (route) => false,
      );
    });
  }
}
