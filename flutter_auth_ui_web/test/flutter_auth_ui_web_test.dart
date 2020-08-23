import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_auth_ui_web/flutter_auth_ui_web.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_auth_ui_web');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterAuthUiWeb.platformVersion, '42');
  });
}
