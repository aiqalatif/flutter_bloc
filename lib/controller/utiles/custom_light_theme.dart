

  import 'package:flutter/material.dart';
import 'package:kineticqr/controller/utiles/ui_parameters.dart';


TextStyle cartTitles(context)=> TextStyle(
                color: UiParamters.isDarkMode()?Theme.of(context).textTheme.titleMedium!.color:
                Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              );