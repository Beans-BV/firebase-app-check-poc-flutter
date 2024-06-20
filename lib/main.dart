import 'package:app_check_poc/constants/theme.dart';
import 'package:app_check_poc/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:master_utility/master_utility.dart';

const initialAppScreenSize = Size(375, 812);

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceServiceHelper.init();
  await dotenv.load(fileName: 'prod.env');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

Widget buildProvidersTree() => ScreenUtilInit(
    designSize: initialAppScreenSize,
    builder: (context, child) => MasterUtilityMaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    ),
  );
