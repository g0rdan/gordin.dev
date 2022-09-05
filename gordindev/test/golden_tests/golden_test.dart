import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gordindev/main.dart';

void main() {
  group('Basic Goldens', () {
    /// This test uses .pumpWidgetBuilder to automatically set up
    /// the appropriate Material dependencies in order to minimize boilerplate.
    ///
    /// It simply pumps a custom widget and captures the golden
    testGoldens(
      'Main Page',
      (tester) async {
        await tester.pumpWidgetBuilder(
          const MaterialApp(
            home: Center(child: MyApp()),
          ),
          surfaceSize: const Size(800, 2000),
        );
        await screenMatchesGolden(tester, 'main_page');
      },
    );
  });
}
