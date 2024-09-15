import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kineticqr/view/qr_code_genrate.dart';
import 'package:kineticqr/view/qrcode_history_screen.dart';
import 'package:kineticqr/view/qrscaner_gnerater.dart';
import 'package:kineticqr/view/setting_jscreen.dart';
import 'package:kineticqr/view/splash_screen.dart';

class AppRoutes {
  // Define route names as constants
  static const splash = '/splash';
  static const qrScanner = '/qrScanner';
  static const qrHistory = '/qrHistory';
  static const qrGenerate = '/qrGenerate';
  static const settings = '/settings';

  // Define your routes
  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: qrScanner,
      page: () => QRScannerGenerator(),
    ),
    GetPage(
      name: qrHistory,
      page: () => QRCodeHistoryScreen(),
    ),
    // GetPage(
    //   name: qrGenerate,
    //   page: () => QRCodeGenrate(),
    // ),
    GetPage(
      name: settings,
      page: () => SettingScreen(),
    ),
  ];
}
