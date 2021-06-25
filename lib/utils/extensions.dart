import 'package:flutter/material.dart';

extension ISMobileExtension on BuildContext{
  bool get isMobile => MediaQuery.of(this).size.shortestSide <= 768;
    
}