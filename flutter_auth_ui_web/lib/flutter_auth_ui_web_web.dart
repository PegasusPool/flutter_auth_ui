import 'dart:html' as html show window;
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_ui_web/auth_ui.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the FlutterAuthUiWeb plugin.
class FlutterAuthUiWebWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'flutter_auth_ui',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    final pluginInstance = FlutterAuthUiWebWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    final method = call.method;
    if (method != 'startUi') {
      throw PlatformException(
        code: 'Unimplemented',
        details:
            'flutter_auth_ui_web for web doesn\'t implement \'${call.method}\'',
      );
    }

    final args = (call.arguments as Map<dynamic, dynamic>);
    final providers = (args['providers'] as String).split(',').map((name) {
      switch (name) {
        case "Anonymous":
          return AnonymousAuthProvider();
        case "Email":
          return EmailPasswordAuthProvider();
        case "Phone":
          return PhoneAuthProvider();
        case "Apple":
          return OAuthProvider('Apple');
        case "Github":
          return GithubAuthProvider();
        case "Microsoft":
          return OAuthProvider('Microsoft');
        case "Yahoo":
          return OAuthProvider('Yahoo');
        case "Google":
          return GoogleAuthProvider();
        case "Facebook":
          return FacebookAuthProvider();
        case "Twitter":
          return TwitterAuthProvider();
        default:
          throw PlatformException(
            code: 'Unimplemented',
            details:
                'flutter_auth_ui_web for web doesn\'t implement \'${call.method}\'',
          );
      }
    }).toList();

    // todo open firebaseui-web
    html.window.alert('test');
  }
}
