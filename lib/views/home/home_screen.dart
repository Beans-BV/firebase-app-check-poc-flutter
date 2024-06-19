import 'dart:io';

import 'package:app_check_poc/configs/env/env.dart';
import 'package:app_check_poc/configs/flavours/app.dart';
import 'package:app_check_poc/constants/api_constants.dart';
import 'package:app_check_poc/constants/dimension.dart';
import 'package:app_check_poc/widgets/appbar.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
        appBar: appBarCustom(
          title: AppConfig.of(context)?.appTitle ?? '',
          onPressed: () => exit(0),
        ),
        backgroundColor: Colors.deepPurple.shade50,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _appCheckProtectedCall,
                child: const Text('Protected'),
              ),
              SizedBox(height: AppHeight.h4),
              ElevatedButton(
                onPressed: _nonAppCheckProtectedCall,
                child: const Text('Unprotected'),
              ),
            ],
          ),
        ),
      ),
    );

  Future<void> _nonAppCheckProtectedCall() async {
    try {
      final res = await Dio().get(
        '${EnvConfig().baseApiUrl}${ApiConstants.getDataWithoutAppCheck}',
        options: Options(validateStatus: (_) => true),
      );
      if (kDebugMode) {
        print('status: ${res.statusCode}\nmessage: ${res.statusMessage}\nbody: ${res.data}');
      }
      if (res.data is Map) {
        final message = res.data['message'] as String?;
        _showSnackBar(message, isSuccess: res.data['success'] as bool? ?? false);
      } else {
        _showSnackBar(res.statusMessage);
      }
    } on Exception catch (e, stackTrace) {
      _showSnackBar(e.toString());
      if (kDebugMode) {
        print('Error: $e\ntrace: $stackTrace');
      }
    }
  }

  Future<void> _appCheckProtectedCall() async {
    try {
      final appCheckToken = await FirebaseAppCheck.instance.getToken();
      final res = await Dio().get(
        '${EnvConfig().baseApiUrl}${ApiConstants.getDataWithAppCheck}',
        options: Options(
          validateStatus: (_) => true,
          headers: {
            ApiConstants.headerXFirebaseAppCheck: appCheckToken,
          },
        ),
      );
      if (kDebugMode) {
        print('status: ${res.statusCode}\nmessage: ${res.statusMessage}\nbody: ${res.data}');
      }

      if (res.data is Map) {
        final message = res.data['message'] as String?;
        _showSnackBar(message, isSuccess: res.data['success'] as bool? ?? false);
      } else {
        _showSnackBar(res.statusMessage);
      }
    } on Exception catch (e, stackTrace) {
      _showSnackBar(e.toString());
      if (kDebugMode) {
        print('Error: $e\ntrace: $stackTrace');
      }
    }
  }

  void _showSnackBar(String? message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? '', style: const TextStyle(color: Colors.white)),
        duration: const Duration(milliseconds: 2500),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}
