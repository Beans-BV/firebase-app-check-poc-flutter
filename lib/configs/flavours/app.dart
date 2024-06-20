// Flutter imports:
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Environment { dev, prod, stage }

class AppConfig extends InheritedWidget {

  const AppConfig({
    required super.child, required this.environment, required this.appTitle, super.key,
  });
  final Environment environment;
  final String appTitle;

  static AppConfig? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppConfig>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}


AndroidProvider getAndroidProvider() => kReleaseMode ? AndroidProvider.playIntegrity : AndroidProvider.debug;
AppleProvider getAppleProvider() => kReleaseMode ? AppleProvider.appAttestWithDeviceCheckFallback : AppleProvider.debug;
