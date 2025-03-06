import 'dart:developer';

import 'package:chitchat/app.dart';
import 'package:chitchat/core/di/service_locator.dart';
import 'package:chitchat/core/services/socket_service.dart';
import 'package:chitchat/core/utils/app_bloc_observer.dart';
import 'package:chitchat/core/utils/cache_helper.dart';
import 'package:chitchat/core/utils/prefs_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await checkIfLoggedInUser();

  await SocketService().initSocket();
  Bloc.observer = AppBlocObserver();
  runApp(const ChitChatApp());
}

checkIfLoggedInUser() async {
  String? userToken = await CacheHelper.getSecuredString(PrefsKeys.token);
  if (userToken == null || userToken.isEmpty) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
    userId = await CacheHelper.getSecuredString(PrefsKeys.userId) ?? '';
    log("userId: $userId");
  }
}
