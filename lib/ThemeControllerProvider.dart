import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeControllerProvider extends ChangeNotifier {
  bool isDark = true;
  late ValueNotifier<bool> switcherController;

  ThemeControllerProvider() {
    switcherController = ValueNotifier<bool>(isDark);
  }

  /// Toggle between light and dark themes
  void toggleTheme() {
    isDark = !isDark;
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor:
            Colors.transparent, // Adjust this based on your app's design
        statusBarIconBrightness:
            Brightness.dark, // Set to Brightness.dark for light theme
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor:
            Colors.transparent, // Adjust this based on your app's design
        statusBarIconBrightness:
            Brightness.light, // Set to Brightness.light for dark theme
      ));
    }
    notifyListeners();
  }
}
