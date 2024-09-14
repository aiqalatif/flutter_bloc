
import 'package:flutter/material.dart';

import 'package:kineticqr/controller/utiles/constant.dart';
import 'package:google_fonts/google_fonts.dart';


mixin SubThemeData{
   TextTheme getTextTheme(){
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w400
        ),
      )
    );
    
  }
 IconThemeData  getIconTheme(){
    return const IconThemeData(color: onSurfaceTextColor,size: 16);
  }
}