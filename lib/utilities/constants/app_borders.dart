import 'package:flutter/material.dart';

import 'app_border_radius.dart';

class AppBorders { 
  AppBorders._(); 

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: AppBorderRadius.a10,
    borderSide: BorderSide.none,
  );

  static const errorInputBorder = OutlineInputBorder(
    borderRadius: AppBorderRadius.a10,
    borderSide: BorderSide(color: Colors.red),
  );
}