import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:streamer_clock/ui/views/view.dart';
import 'package:streamer_clock/ui/widgets/widgets.dart';

void main() {
  setUpAll(() => initializeDateFormatting('es_CO'));

  Future<void> pumpAtWidth(WidgetTester tester, double width) async {
    tester.view
      ..physicalSize = Size(width, 400)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const MyApp());
  }

  testWidgets('shows date and time in a row on wide screens', (
    WidgetTester tester,
  ) async {
    await pumpAtWidth(tester, 600);

    expect(find.byType(DateWidget), findsOneWidget);
    expect(find.byType(TimeWidget), findsOneWidget);
    expect(
      tester.getTopLeft(find.byType(TimeWidget)).dy,
      tester.getTopLeft(find.byType(DateWidget)).dy,
    );
  });

  for (double width in <double>[250, 120, 70]) {
    testWidgets('stacks date over time without overflow at $width px', (
      WidgetTester tester,
    ) async {
      await pumpAtWidth(tester, width);

      expect(tester.takeException(), isNull);
      expect(
        tester.getTopLeft(find.byType(TimeWidget)).dy,
        greaterThan(tester.getTopLeft(find.byType(DateWidget)).dy),
      );
    });
  }
}
