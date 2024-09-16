import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kineticqr/controller/theme-controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the instance of ThemeController
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
       appBar: AppBar(
    title: const Text("KineticQr",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.teal,
  ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 18),
                ),
                Obx(
                  () => Switch(
                    value: themeController.isDarkMode.value, // Current state of the theme (from controller)
                    onChanged: (value) {
                      themeController.toggleTheme(value); // Toggle theme on switch change
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
