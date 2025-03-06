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
  bool _isConnected = false;
  static const String _baseUrl = 'http://10.0.2.2:5000';

  bool get isConnected => _isConnected;

  Future<void> initSocket() async {
    try {
      final token = await CacheHelper.getSecuredString(PrefsKeys.token);
      if (token == null || token.isEmpty) {
        log('Socket initialization failed: No auth token available');
        return;
      }

      socket = IO.io(
        _baseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setExtraHeaders({'Authorization': 'Bearer $token'})
            .enableReconnection()
            .build(),
      );

      _setupSocketListeners();
      socket.connect();
    } catch (e) {
      log('Socket initialization error: $e');
      _isConnected = false;
    }
  }

  void _setupSocketListeners() {
    socket.onConnect((_) {
      _isConnected = true;
      log('Socket connected ${socket.id}');
    });

    socket.onDisconnect((_) {
      _isConnected = false;
      log('Socket disconnected');
    });

    socket.onError((error) {
      _isConnected = false;
      log('Socket error: $error');
    });

    socket.onConnectError((error) {
      _isConnected = false;
      log('Socket connection error: $error');
    });
  }
}
