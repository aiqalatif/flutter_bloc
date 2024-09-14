import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kineticqr/controller/controller.dart';
import 'package:kineticqr/controller/qrcode_controller_scan.dart';
import 'package:kineticqr/controller/theme-controller.dart';


import 'view/weight/app_route.dart';

void main() {
  Get.put(QRCodeController());
  Get.put(QRCodeC());
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'KineticQR',
      theme: Get.find<ThemeController>().lightTheme,
      initialRoute: AppRoutes.splash, // Set the initial route
      getPages: AppRoutes.routes, // Use the defined routes
      // Optionally: Configure default transition and other settings
      defaultTransition: Transition.fadeIn,
    );
  }
}
