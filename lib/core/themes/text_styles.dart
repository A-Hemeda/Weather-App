import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


TextStyle titleTextStyle({
  bool isDark = false,
  FontWeight fontWeight = FontWeight.w500,
  double fontSize = 15,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    color: isDark ? AppColors.darkTextColor : AppColors.textColor,
// fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle subTitleTextStyle({
  bool isDark = false,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    color:
        isDark ? AppColors.dartSubtextColor : AppColors.subTextColor,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}
