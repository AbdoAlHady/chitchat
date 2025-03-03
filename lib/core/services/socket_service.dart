import 'dart:developer';

import 'package:chitchat/core/utils/cache_helper.dart';
import 'package:chitchat/core/utils/prefs_keys.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  SocketService._();
  static final SocketService _instance = SocketService._();
  factory SocketService() => _instance;

  late IO.Socket socket;

  Future<void> initSocket() async {
    final token =
        'Bearer ${await CacheHelper.getSecuredString(PrefsKeys.token)}';
    socket = IO.io(
        'http://localhost:5000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setExtraHeaders({'Authorization': token})
            .build());
    socket.connect();

    socket.onConnect((_) {
      log('Socket connected ${socket.id}');
    });

    socket.onDisconnect((_) {
      log('Socket disconnected');
    });
  }
}
