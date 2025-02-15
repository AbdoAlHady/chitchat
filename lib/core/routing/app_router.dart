import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/features/messages/presentations/messages_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.messagesScreen:
        return MaterialPageRoute(builder: (_) => MessagesScreen());
      default:
        return null;
    }
  }
}
