import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToastType { success, error, warning }

void showToast(
    {required BuildContext context,
    required String message,
    required ToastType type,
    int? second}) {
  DelightToastBar(
    autoDismiss: true,
    position: DelightSnackbarPosition.bottom,
    snackbarDuration: Duration(seconds: second ?? 3),
    builder: (context) {
      return ToastCard(
        title: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(
          type == ToastType.error
              ? Icons.error
              : type == ToastType.success
                  ? Icons.done
                  : Icons.warning,
          color: Colors.white,
          size: 32,
        ),
        color: type == ToastType.error
            ? Colors.red
            : type == ToastType.success
                ? Colors.green
                : Colors.orange,
      );
    },
  ).show(context);
}
