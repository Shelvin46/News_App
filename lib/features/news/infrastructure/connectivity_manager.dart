import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:news_app/service_locator.dart';

class ConnectivityCheck {
  // final Connectivity _connectivity = Connectivity();
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await locator<Connectivity>().checkConnectivity();

      log("the $result");
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    // setState(() {
    _connectionStatus = result;
    log(_connectionStatus.toString());
    // });
    // ignore: avoid_print
    print('Connectivity changed: $_connectionStatus');
  }
}
