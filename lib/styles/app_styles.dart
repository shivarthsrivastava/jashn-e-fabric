import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final ColorScheme colorScheme = ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.grey[900]!,
    surface: Colors.white,
    background: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
  );

  static TextStyle get headingLarge => GoogleFonts.montserrat(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    height: 1.2,
  );

  static TextStyle get headingMedium => GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static TextStyle get headingSmall => GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  static TextStyle get bodyLarge => GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static TextStyle get bodyMedium =>
      GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle get bodySmall =>
      GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle get buttonText => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  );

  static ButtonStyle get outlinedButton => OutlinedButton.styleFrom(
    foregroundColor: Colors.black,
    side: const BorderSide(color: Colors.black, width: 1),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  );

  static const double maxContentWidth = 1440;
  static const double horizontalPadding = 24;
  static const double verticalSpacing = 80;

  static BoxDecoration get imageBorderDecoration =>
      BoxDecoration(border: Border.all(color: Colors.black, width: 1));

  static const Duration defaultAnimationDuration = Duration(milliseconds: 400);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
}
