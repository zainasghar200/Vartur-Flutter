import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vartur_assignment/presenter/splash/splash.dart';
import 'package:vartur_assignment/shared/varture_theme.dart';

void main() {
  runApp(
    MainApp(),
    // DevicePreview(builder: (context) => MainApp())
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: VartureTheme.standard,
        home: SplashScreen(),
      ),
    );
  }
}
