
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 const double _mobileScreenPadding=12.0;
 const double _carBoarderPadding=15.0;
  double get mobileScreenPadding=>_mobileScreenPadding;
  double get carBoarderPadding=>_carBoarderPadding;
class UiParamters{
  static BorderRadius get cardBoardRadious=>BorderRadius.circular(_carBoarderPadding);
  static EdgeInsets get mobileScreenPadding=>  const EdgeInsets.all(_mobileScreenPadding);
  static bool isDarkMode(){
    return  Get.isDarkMode?true:false;
   
  }
  
}