import 'package:flutter/material.dart';

class DeviceType {
  static const int tabletBreakpoint = 600;
  static const int desktopBreakpoint = 1024;

  /// Telefon boyutu kontrolü
  static bool isPhone(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < tabletBreakpoint;
  }

  /// Tablet boyutu kontrolü
  static bool isTablet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= tabletBreakpoint && screenWidth < desktopBreakpoint;
  }

  /// Bilgisayar boyutu kontrolü
  static bool isDesktop(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= desktopBreakpoint;
  }
}
