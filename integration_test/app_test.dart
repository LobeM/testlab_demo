import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testlab_demo/main.dart' as app;

void main() {
  // Add the IntegrationTestWidgetsFlutterBinding and .ensureInitialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('end-to-end test', (tester) async {
    //  execute the app.main() function
    app.main();
    //  Wait until the app has settled
    await tester.pumpAndSettle();
    // Verify that the counter starts at 0
    expect(find.text('0'), findsOneWidget);
    // Finds the floating action button (fab) to tap on
    await tester.tap(find.byTooltip('Increment'));
    // Wait for the app to settle
    await tester.pumpAndSettle();
    // Verify that the counter has incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
