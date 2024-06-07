import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:news_app/service_locator.dart';

class ConnectivityCheck {
  // when the time of creating single ton of this class i need to initialize the network listener
  StreamSubscription<List<ConnectivityResult>> initializeNetworkListener() {
    return locator<Connectivity>()
        .onConnectivityChanged
        .listen(updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await locator<Connectivity>().checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.none)) {
      // setState(() {
      //   _connectionStatus = 'No Internet';
      // });
    } else if (result.contains(ConnectivityResult.mobile)) {
      // setState(() {
      //   _connectionStatus = 'Mobile: Online';
      // });
    } else if (result.contains(ConnectivityResult.wifi)) {
      // setState(() {
      //   _connectionStatus = 'WiFi: Online';
      // });
    }
    // setState(() {
  }
}
