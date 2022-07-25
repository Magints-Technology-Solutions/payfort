import 'dart:async';

import 'package:flutter/services.dart';

class PayfortPlugin {
  static const MethodChannel _channel = const MethodChannel('payfort_plugin');

  ///
  /// this method is for getting user device id to help in generating SDK token
  static Future<String?> get getID async {
    final String? version = await _channel.invokeMethod('getID');
    return version;
  }

  ///
  /// this method is for calling payfort sdk in both android and ios to perform payment process with
  /// specified parameters.
  static Future<Map?> performPaymentRequest({
    required String merchantRef,
    required String sdkToken,
    required String name,
    required String language,
    required String email,
    required String amount,
    required String command,
    required String currency,
    required String mode,
  }) async {
    Map? result = await _channel.invokeMethod('initPayFort', {
      'sdkToken': sdkToken,
      'merchantRef': merchantRef,
      'amount': amount.toString(),
      'email': email,
      'lang': language,
      'command': command,
      'name': name,
      'currency': currency,
      'mode': mode
    });
    return result;
  }
}
