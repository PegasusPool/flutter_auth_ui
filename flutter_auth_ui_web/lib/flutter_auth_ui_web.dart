import 'dart:async';

import 'package:flutter/services.dart';

enum AuthUiItem {
  /// set Anonymous provider.
  AuthAnonymous,

  /// set Email provider.
  AuthEmail,

  /// set PhoneNumber provider.
  AuthPhone,

  /// set Sign in with Apple provider.
  AuthApple,

  /// set Github provider.
  AuthGithub,

  /// set Microsoft provider.
  AuthMicrosoft,

  /// set Yahoo provider.
  AuthYahoo,

  /// set Google Sign-In provider.
  AuthGoogle,

  /// set Facebook Login provider.
  AuthFacebook,

  /// set Twitter provider.
  AuthTwitter
}

extension ExtendedAuthUiItem on AuthUiItem {
  String get providerName {
    switch (this) {
      case AuthUiItem.AuthAnonymous:
        return 'Anonymous';
      case AuthUiItem.AuthEmail:
        return 'Email';
      case AuthUiItem.AuthPhone:
        return 'Phone';
      case AuthUiItem.AuthApple:
        return 'Apple';
      case AuthUiItem.AuthGithub:
        return 'Github';
      case AuthUiItem.AuthMicrosoft:
        return 'Microsoft';
      case AuthUiItem.AuthYahoo:
        return 'Yahoo';
      case AuthUiItem.AuthGoogle:
        return 'Google';
      case AuthUiItem.AuthFacebook:
        return 'Facebook';
      case AuthUiItem.AuthTwitter:
        return 'Twitter';
      default:
        return '';
    }
  }
}

/// Terms of service(Tos) and Privacy Policy link.
class TosAndPrivacyPolicy {
  TosAndPrivacyPolicy(this.tosUrl, this.privacyPolicyUrl);

  String tosUrl;
  String privacyPolicyUrl;
}

class FlutterAuthUi {
  static const MethodChannel _channel = const MethodChannel('flutter_auth_ui');

  /// Start Firebase Auth UI process.
  ///
  /// Return `true` if login process is completed.
  static Future<bool> startUi(
      List<AuthUiItem> items, TosAndPrivacyPolicy tosAndPrivacyPolicy) async {
    final providers = items.map((e) => e.providerName).join(',');
    final data = await _channel.invokeMethod('startUi', <String, String>{
      'providers': providers,
      'tosUrl': tosAndPrivacyPolicy.tosUrl,
      'privacyPolicyUrl': tosAndPrivacyPolicy.privacyPolicyUrl
    });
    if (data == null) return false;

    return true;
  }
}
