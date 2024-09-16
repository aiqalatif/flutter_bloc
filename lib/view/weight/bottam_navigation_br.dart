import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kineticqr/controller/theme-controller.dart';
import 'package:kineticqr/view/qr_code_genrate.dart';
import 'package:kineticqr/view/qrcode_history_screen.dart';
import 'package:kineticqr/view/qrscaner_gnerater.dart';
import 'package:kineticqr/view/setting_jscreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final iconList = <IconData>[
    Icons.qr_code_scanner,
    Icons.history,
    Icons.qr_code,
    Icons.settings,
  ];

  final List<Widget> _pages = [
    QRScannerGenerator(),
    QRCodeHistoryScreen(),
    QRCodeGenerate(),
    SettingScreen(),
  ];

  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.teal,
        child: const Icon(Icons.qr_code,color: Colors.white,),
        onPressed: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
     
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center, // Change to GapLocation.end if needed
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        activeColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}
