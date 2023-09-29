import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//* Colors
Color blackColor = const Color(0xFF272727);
Color greyColor = const Color(0xFFF0F0F0);
Color primaryColor = const Color(0xFFF76C6A);
Color secondaryColor = const Color(0xFFF79E89);
Color greenColor = const Color(0xFF00FF19);

//* Text Styles
TextStyle header1 = GoogleFonts.bebasNeue(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: blackColor,
    letterSpacing: -3.5);

TextStyle header2 = header1.copyWith(fontSize: 45, letterSpacing: -2.5);
TextStyle header3 = header1.copyWith(fontSize: 36, letterSpacing: 0);
TextStyle header4 = header1.copyWith(fontSize: 26, letterSpacing: 1);

TextStyle body1 = const TextStyle(fontSize: 16, color: Colors.white);
TextStyle body2 = body1.copyWith(fontSize: 14, color: Colors.white);
TextStyle body3 = body1.copyWith(fontSize: 12, color: Colors.white);
TextStyle body4 = body1.copyWith(fontSize: 10, color: Colors.white);
