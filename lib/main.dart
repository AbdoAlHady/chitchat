import 'package:chitchat/app.dart';
import 'package:chitchat/core/di/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const ChitChatApp());
}
