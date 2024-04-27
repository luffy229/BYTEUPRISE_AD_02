import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'CalculateControllerProvider.dart';
import 'Colors.dart';
import 'CustomAppButton.dart';
import 'ThemeControllerProvider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    var calculateProvider = Provider.of<CalculateControllerProvider>(context);
    var themeProvider = Provider.of<ThemeControllerProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDark
          ? DarkColors.scaffoldBgColor
          : LightColors.scaffoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            outPutSection(themeProvider, calculateProvider),
            inPutSection(themeProvider, calculateProvider),
          ],
        ),
      ),
    );
  }

  Widget inPutSection(ThemeControllerProvider themeProvider,
      CalculateControllerProvider calculateProvider) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: themeProvider.isDark
            ? DarkColors.sheetBgColor
            : LightColors.sheetBgColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: buttons.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return CustomAppButton(
                buttonTapped: () {
                  calculateProvider.clearInputAndOutput();
                },
                color: themeProvider.isDark
                    ? DarkColors.leftOperatorColor
                    : LightColors.leftOperatorColor,
                textColor: themeProvider.isDark
                    ? DarkColors.btnBgColor
                    : LightColors.btnBgColor,
                text: buttons[index],
              );
            case 1:
              return CustomAppButton(
                buttonTapped: () {
                  calculateProvider.deleteBtnAction();
                },
                color: themeProvider.isDark
                    ? DarkColors.leftOperatorColor
                    : LightColors.leftOperatorColor,
                textColor: themeProvider.isDark
                    ? DarkColors.btnBgColor
                    : LightColors.btnBgColor,
                text: buttons[index],
              );
            case 19:
              return CustomAppButton(
                buttonTapped: () {
                  calculateProvider.equalPressed();
                },
                color: themeProvider.isDark
                    ? DarkColors.leftOperatorColor
                    : LightColors.leftOperatorColor,
                textColor: themeProvider.isDark
                    ? DarkColors.btnBgColor
                    : LightColors.btnBgColor,
                text: buttons[index],
              );
            default:
              return CustomAppButton(
                buttonTapped: () {
                  calculateProvider.onBtnTapped(buttons, index);
                },
                color: isOperator(buttons[index])
                    ? LightColors.operatorColor
                    : themeProvider.isDark
                        ? DarkColors.btnBgColor
                        : LightColors.btnBgColor,
                textColor: isOperator(buttons[index])
                    ? Colors.white
                    : themeProvider.isDark
                        ? Colors.white
                        : Colors.black,
                text: buttons[index],
              );
          }
        },
      ),
    );
  }

  Widget outPutSection(ThemeControllerProvider themeProvider,
      CalculateControllerProvider calculateProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Switch(
            value: !themeProvider
                .isDark, // Invert the value to show the correct state
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 70),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  calculateProvider.userInput,
                  style: GoogleFonts.ubuntu(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                      fontSize: 38),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  calculateProvider.userOutput,
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                    fontSize: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool isOperator(String y) {
    return y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=";
  }
}
