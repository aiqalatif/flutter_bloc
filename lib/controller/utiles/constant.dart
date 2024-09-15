import 'package:flutter/material.dart';
import 'package:kineticqr/controller/utiles/app_color.dart';
import 'package:kineticqr/controller/utiles/light_color.dart';
import 'package:kineticqr/controller/utiles/ui_parameters.dart';

// class CustomColors {
//   static const Color darkBlue = Color(0xFF22325C);
//   static const Color lightBlue = Color(0xff36487A);
//   static const Color purpleColor = Color(0xFF290D56);
//   static const Color green = Color(0xFF00D361);
//   static const Color green1 = Color(0xFF11B52B);
//   static const Color yellow = Color(0xFFFFBF00);
//   static const Color lightRed = Color(0xFFD04959);
//   static const Color red = Color(0xffCE1313);
//   static const Color orange = Color(0xffFFA500);
// }
const Color onSurfaceTextColor=Colors.white;
const Color onSurfaceBlueColor=Color(0xFF2e3c62);


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

LinearGradient mainGradient()=>
UiParamters.isDarkMode()?mainGradientDark:mainGradientLight;
Color customScafolledColor(BuildContext context){
    return UiParamters.isDarkMode()?const Color(0xFF2e3c62):const Color.fromARGB(255, 224, 242, 241)
;
  }
   
  