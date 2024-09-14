import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _lightTheme;
  late ThemeData _darkTheme;
  
  // Observable to track dark mode
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  // Initialize the light and dark themes
  initializeThemeData() {
    _darkTheme = ThemeData.dark().copyWith(
      iconTheme: IconThemeData(color: Colors.white), // Dark mode icon color
      primaryColor: Colors.black,  // Dark mode background color
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black, // Dark mode background
        selectedItemColor: Colors.white, // Icon color for selected item
        unselectedItemColor: Colors.grey, // Icon color for unselected items
      ),
    );

    _lightTheme = ThemeData.light().copyWith(
      iconTheme: IconThemeData(color: Colors.black), // Light mode icon color
      primaryColor: Colors.white,  // Light mode background color
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white, // Light mode background
        selectedItemColor: Colors.black, // Icon color for selected item
        unselectedItemColor: Colors.grey, // Icon color for unselected items
      ),
    );
  }

  // Getters for light and dark themes
  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

  // Function to toggle theme
  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark;
    Get.changeTheme(isDark ? _darkTheme : _lightTheme);
  }
}
