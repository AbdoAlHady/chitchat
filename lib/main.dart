import 'package:chitchat/app.dart';
import 'package:chitchat/core/di/service_locator.dart';
import 'package:chitchat/core/utils/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const ChitChatApp());
}
