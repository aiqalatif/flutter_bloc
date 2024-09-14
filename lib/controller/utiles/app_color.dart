import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kineticqr/controller/utiles/sub_theme_data.dart';



const Color primaryDarkColorDark=Color(0xFF2e3c62);
const Color  primarycolorDark=Color(0xFF99ace1);
final Color mainTextColor= Color.fromARGB(255,40,40,40);
const  Color cardColor=Color.fromARGB(255, 254, 254, 255);
class DarkTheme with SubThemeData{
  buildDarkTheme(){
    final ThemeData systemDarkTheme=ThemeData.dark();
    return systemDarkTheme.copyWith(
     iconTheme: getIconTheme(),
     cardColor:cardColor ,
     textTheme: getTextTheme().apply(
      bodyColor: mainTextColor,
      displayColor: mainTextColor
     )
    );

  } 
}