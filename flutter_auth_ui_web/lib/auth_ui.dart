@JS('firebaseui.auth')
library auth;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    show AuthProvider;
import 'package:js/js.dart';

@JS()
class AuthUI {
  external factory AuthUI(FirebaseAuth auth);

  external static AuthUI getInstance(String appID);

  external void disableAutoSignIn();

  external void start(String element, Config config);

  external void setConfig(Config config);

  external void signIn();

  external void reset();

  external Future<void> delete();

  external bool isPendingRedirect();
}

@anonymous
@JS()
class Config {
  external factory Config();

  external String get widgetUrl;

  external set widgetUrl(String v);

  external bool get popupMode;

  external set popupMode(bool v);

  external String get signInSuccessUrl;

  external set signInSuccessUrl(String v);

  external List<AuthProvider> get signInOptions;

  external set signInOptions(List<AuthProvider> v);

  external String get tosUrl;

  external set tosUrl(String v);

  external String get privacyPolicyUrl;

  external set privacyPolicyUrl(String v);
}

// region providers

class AnonymousAuthProvider extends AuthProvider {
  AnonymousAuthProvider() : super('anonymous');
}

class EmailPasswordAuthProvider extends EmailAuthProvider {
  EmailPasswordAuthProvider() : super();
}

// endregion
