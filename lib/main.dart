import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kineticqr/controller/history_controller.dart';

import 'package:kineticqr/controller/theme-controller.dart';
import 'package:kineticqr/view/shared_prefrence_service.dart';


import 'view/weight/app_route.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter framework is ready
  await SharedPreferencesService.init();
  Get.put(QRCodeController());
  // Get.put(QRCodeC());
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
     
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
    );
    
  }
}

