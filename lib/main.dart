import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/app.dart';
import 'package:news_app/service_locator.dart';

void main() async {
  //Setting up ServiceLocator
  ServiceLocator.setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  //Setting SystemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: false,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MyApp(),
      );
    },
  );
}
