import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle font11W600 =
      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600);

  static TextStyle font13W600 =
      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600);

  static TextStyle font13W700 =
      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700);

  static TextStyle font16W600 =
      GoogleFonts.alegreyaSans(fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle font16WhiteW700 = TextStyle(
      fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w700);

  static TextStyle font16W700 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);

  static TextStyle font19W700 =
      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w700);

  static TextStyle font23W700 = TextStyle(
      fontSize: 23.sp, color: Colors.black, fontWeight: FontWeight.w700);
}
