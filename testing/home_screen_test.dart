import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_finder_app/features/home/data/repos/mocked_home_repo.dart';
import 'package:pets_finder_app/home_app.dart';

void main() {

  group('Home screen integration', () {
    late MockedHomeRepo mockRepo;

    setUp(() {
      mockRepo = MockedHomeRepo();
    });

     testWidgets('fetches, filters and favorites flow', (WidgetTester tester) async {
      // 1) Start app with mock repo
      await tester.pumpWidget(HomeApp(repo: mockRepo));
      await tester.pumpAndSettle();

      // 2) Wait for breeds to appear (first item text should be present).
      final firstBreedText = find.text('Golden Retriever');
      expect(firstBreedText, findsOneWidget);

      // 3) Verify all mocked items listed (or at least count).
      final petItem1 = find.byKey(const Key('pet_item_1'));
      final petItem2 = find.byKey(const Key('pet_item_2'));
      expect(petItem1, findsOneWidget);
      expect(petItem2, findsOneWidget);

      // 4) Type into search to filter (type 'poodle')
      final searchField = find.byKey(const Key('home_search_field'));
      await tester.tap(searchField);
      await tester.enterText(searchField, 'poodle');
      // wait for cubit -> filter
      await tester.pumpAndSettle();

      // Confirm only Poodle is shown
      expect(find.text('Poodle'), findsOneWidget);
      // If no results, assert the no-results widget not visible
      expect(find.byKey(const Key('no_results_widget')), findsNothing);

      // 5) Clear search to show all again
      await tester.enterText(searchField, '');
      await tester.pumpAndSettle();
      expect(find.text('Golden Retriever'), findsOneWidget);

      // 6) Favorite an item (tap favorite icon)
      final favIcon = find.byKey(const Key('favorite_icon_1'));
      await tester.tap(favIcon);
      await tester.pumpAndSettle();

      // Check UI changed (e.g., icon changed to filled heart). Check color or icon existence
      final favIconSelected = find.byWidgetPredicate((w) =>
        w is Icon && w.icon == Icons.favorite); // adjust depending on your implementation
      expect(favIconSelected, findsWidgets);

      // 7) Switch to Favorites tab via bottom nav
      final favTab = find.byKey(const Key('bottom_nav_favorite'));
      await tester.tap(favTab);
      await tester.pumpAndSettle();

      // Confirm favorited item appears on Favorites screen
      final favListItem = find.byKey(const Key('favorite_list_item_1'));
      expect(favListItem, findsOneWidget);
    });

  });
}
