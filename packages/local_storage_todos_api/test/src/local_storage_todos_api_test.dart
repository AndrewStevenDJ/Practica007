// Not required for test files

import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalStorageTodosApi', () {
    test('can be instantiated', () {
      expect(
        LocalStorageTodosApi(plugin: MockSharedPreferences()),
        isNotNull,
      );
    });
  });
}
