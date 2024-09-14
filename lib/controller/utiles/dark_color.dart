import 'package:flutter/material.dart';
import 'package:kineticqr/controller/utiles/app_color.dart';
import 'package:kineticqr/controller/utiles/light_color.dart';
import 'package:kineticqr/controller/utiles/ui_parameters.dart';

const Color onSurfaceTextColor=Colors.white;
const Color onSurfaceBlueColor=Color(0xFF2e3c62);
const Color correctAnswered =Color(0xFF3ac3cb);
const Color wrongAnswered=Color(0xFFf85187);
const Color notAnswered=Color(0xFF3ac3cb);

const mainGradientLight =LinearGradient(
  begin:Alignment.topLeft,
  end: Alignment.bottomRight,

   colors: [
    primarylightColorlight,
    primarycolorlight
   ]
);
const mainGradientDark =LinearGradient(
  begin:Alignment.topLeft,
  end: Alignment.bottomRight,

   colors: [
    primaryDarkColorDark,
    primarycolorDark,
   ]
);
Color answerSelectedColor()=>UiParamters.isDarkMode()?Color.fromARGB(255, 221, 221, 221):Color.fromARGB(255, 20, 46, 158);
    Color answerBorderColor()=>UiParamters.isDarkMode()?Color.fromARGB(255, 20, 46, 158):Color.fromARGB(255, 221, 221, 221)
    ;
LinearGradient mainGradient()=>
UiParamters.isDarkMode()?mainGradientDark:mainGradientLight;
Color customScafolledColor(BuildContext context){
    return UiParamters.isDarkMode()?const Color(0xFF2e3c62):const Color.fromARGB(255, 245, 236, 255);
  }
   
  