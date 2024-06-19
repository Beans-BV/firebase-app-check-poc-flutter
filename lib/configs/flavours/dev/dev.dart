import 'package:app_check_poc/configs/flavours/app.dart';
import 'package:app_check_poc/configs/flavours/dev/firebase_options_dev.dart';
import 'package:app_check_poc/constants/strings.dart';
import 'package:app_check_poc/main.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptionsDev.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  final configuredApp = AppConfig(
    environment: Environment.dev,
    appTitle: '${AppStrings.appName}: ${Environment.dev.name}',
    child: buildProvidersTree(),
  );
  await dotenv.load(fileName: 'dev.env');
  runApp(configuredApp);
}
