import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionHelper {
  ConnectionHelper._();
  static final ConnectionHelper _instance = ConnectionHelper._();
  factory ConnectionHelper() => _instance;

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  Future<bool> checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      return false;
    } else if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.vpn)) {
      return true;
    }
    return false;
  }

  void init() async {
    final result = await Connectivity().checkConnectivity();
    isNetworkConnected(result);
    Connectivity().onConnectivityChanged.listen(isNetworkConnected);
  }

  bool isNetworkConnected(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false;
    } else if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    } else {
      return false;
    }
  }
}
