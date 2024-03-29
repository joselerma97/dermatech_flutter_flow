import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userIdServer = '';
  String get userIdServer => _userIdServer;
  set userIdServer(String value) {
    _userIdServer = value;
  }

  String _deviceIdServer = '';
  String get deviceIdServer => _deviceIdServer;
  set deviceIdServer(String value) {
    _deviceIdServer = value;
  }
}
