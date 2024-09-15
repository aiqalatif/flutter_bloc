import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kineticqr/controller/utiles/sub_theme_data.dart';



const Color primarylightColorlight=Colors.teal;
const Color  primarycolorlight=Color(0xFFE0F2F1);
final Color mainTextColor= Color.fromARGB(255, 240, 231, 231);
 class lightTheme with SubThemeData{
  buildLightTheme(){
    final ThemeData systemLightThemeData=ThemeData.light();
  
    return systemLightThemeData.copyWith(
      primaryColor: primarycolorlight,
           visualDensity: VisualDensity.adaptivePlatformDensity,
              iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
       bodyColor: mainTextColor,displayColor: mainTextColor,
      )
    );
  
  }
 }