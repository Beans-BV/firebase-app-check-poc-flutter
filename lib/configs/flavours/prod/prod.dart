import 'package:app_check_poc/configs/flavours/app.dart';
import 'package:app_check_poc/configs/flavours/prod/firebase_options_prod.dart';
import 'package:app_check_poc/constants/strings.dart';
import 'package:app_check_poc/main.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptionsProd.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: getAndroidProvider(),
    appleProvider: getAppleProvider(),
  );
  final configuredApp = AppConfig(
    environment: Environment.prod,
    appTitle: '${AppStrings.appName}: ${Environment.prod.name}',
    child: buildProvidersTree(),
  );
  await dotenv.load(fileName: 'prod.env');
  runApp(configuredApp);
}
