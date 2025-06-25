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

  bool _isOtpSend = false;
  bool get isOtpSend => _isOtpSend;
  set isOtpSend(bool value) {
    _isOtpSend = value;
  }

  String _selectedCode = '';
  String get selectedCode => _selectedCode;
  set selectedCode(String value) {
    _selectedCode = value;
  }

  bool _continueOnTap = false;
  bool get continueOnTap => _continueOnTap;
  set continueOnTap(bool value) {
    _continueOnTap = value;
  }

  String _monthlySubscriptionId = '';
  String get monthlySubscriptionId => _monthlySubscriptionId;
  set monthlySubscriptionId(String value) {
    _monthlySubscriptionId = value;
  }
}
