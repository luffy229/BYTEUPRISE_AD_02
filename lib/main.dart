import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'CalculateControllerProvider.dart';
import 'ThemeControllerProvider.dart';
import 'Main Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculateControllerProvider>(
          create: (_) => CalculateControllerProvider(),
        ),
        ChangeNotifierProvider<ThemeControllerProvider>(
          create: (_) => ThemeControllerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Calculator",
        home: MainScreen(),
      ),
    );
  }
}
