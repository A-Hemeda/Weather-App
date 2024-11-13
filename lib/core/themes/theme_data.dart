import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.dart';

class ThemeConfig {
  static ThemeData simpleTheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      backgroundColor: colorScheme.background,
      primaryColor: colorScheme.primary,
      cardColor: colorScheme.primaryContainer,
      errorColor: colorScheme.error,
      bottomNavigationBarTheme: bottomNavigationBarThemeData(colorScheme),
      textTheme: textTheme(colorScheme),
      navigationBarTheme: navigationBarTheme(colorScheme),
      useMaterial3: true,
    );
  }

  static ColorScheme colorSchemeFromSeed =
      ColorScheme.fromSeed(seedColor:  Colors.orange);

  static ThemeData themeFromSeed() => ThemeData.from(
      colorScheme: colorSchemeFromSeed,
      textTheme: textTheme(colorSchemeFromSeed));

  static ThemeData get darkTheme => simpleTheme(darkColorScheme);

  static ThemeData get lightTheme => simpleTheme(lightColorScheme);

  static ThemeData get themeSeed => themeFromSeed();

  // convert color scheme to theme data

  static textTheme(ColorScheme colorScheme) => TextTheme(
        headline1: GoogleFonts.montserrat(
          fontSize: 98,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: GoogleFonts.montserrat(
          fontSize: 61,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: GoogleFonts.montserrat(
          fontSize: 49,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.montserrat(
          fontSize: 35,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headline5: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline6: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      );

  static navigationBarTheme(ColorScheme colorScheme) => NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all<TextStyle>(
          GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSecondaryContainer,
          ),
        ),
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        iconTheme: MaterialStateProperty.all<IconThemeData>(
          IconThemeData(
            color: colorScheme.onSecondaryContainer,
          ),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      );

  static bottomNavigationBarThemeData(ColorScheme colorScheme) =>
      BottomNavigationBarThemeData(
        backgroundColor: colorScheme.secondaryContainer,
        selectedItemColor: colorScheme.onSecondaryContainer,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        selectedIconTheme:
            IconThemeData(color: colorScheme.onSecondaryContainer),
        unselectedIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
        selectedLabelStyle: TextStyle(
            color: colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
            color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600),
      );
}
