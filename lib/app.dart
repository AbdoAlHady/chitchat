import 'package:chitchat/core/routing/app_router.dart';
import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChitChatApp extends StatelessWidget {
  const ChitChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          onGenerateRoute: AppRouter().onGenerateRoute,
          navigatorKey: AppRouter.navigatorKey,
          initialRoute: Routes.loginScreen,
        );
      },
    );
  }
}
