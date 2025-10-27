// Ignore for testing purposes

import 'package:flutter_test/flutter_test.dart';
import 'package:javerage_todos/core/app.dart';
import 'package:javerage_todos/features/home/view/home_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

class MockTodosApi extends Mock implements TodosApi {}

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(
          createTodosRepository: () => TodosRepository(
            todosApi: MockTodosApi(),
          ),
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
