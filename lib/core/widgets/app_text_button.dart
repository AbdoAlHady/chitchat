import 'package:chitchat/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor,
      this.textStyle,
      this.padding,
      this.radius,
      this.width,
      this.height});
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(width ?? 1.sw, height ?? 40.h),
        backgroundColor: backgroundColor ?? AppColors.buttonColor,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 25),
        ),
      ),
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
