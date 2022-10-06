import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bl_getx/bl_getx.dart';

void main() {
  const MethodChannel channel = MethodChannel('bl_getx');

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
    expect(await BlGetx.platformVersion, '42');
  });
}
