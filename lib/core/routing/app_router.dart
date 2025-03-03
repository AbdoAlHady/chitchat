import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/features/auth/ui/screens/login_screen.dart';
import 'package:chitchat/features/auth/ui/screens/register_screen.dart';
import 'package:chitchat/features/auth/ui/screens/verify_email_screen.dart';
import 'package:chitchat/features/messages/presentation/chat_screen.dart';
import 'package:chitchat/features/conversations/presentations/messages_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.messagesScreen:
        return MaterialPageRoute(builder: (_) => MessagesScreen());
      case Routes.chatScreen:
        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  conversationId: args as String,
                ));
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(
            builder: (_) => VerifyEmailScreen(
                  email: args as String,
                ));
      default:
        return null;
    }
  }
}
