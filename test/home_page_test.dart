import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';

import 'package:weather_app/providers/user_provider.dart';
import 'package:weather_app/widget.dart/forcecaset_switcher.dart';
import 'package:weather_app/widget.dart/weatheer_card.dart';
import 'package:weather_app/widget.dart/weather_alert_section.dart';
import 'package:weather_app/widget.dart/weather_metrics_card.dart'; // <-- import WeatherCard

void main() {
  Widget buildTestWidget() {
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => HomeProvider(),
      child: const MaterialApp(home: HomePage()),
    );
  }

  testWidgets('HomePage shows greeting and main sections', (
    WidgetTester tester,
  ) async {
    // Build
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    // 1. Greeting text
    expect(find.text('Hello, Hang Daro'), findsOneWidget);

    // 2. Weather card exists
    final weatherCardFinder = find.byType(WeatherCard);
    expect(weatherCardFinder, findsOneWidget);

    // 3. Weather card has correct temperature value (40)
    final weatherCard = tester.widget<WeatherCard>(weatherCardFinder);
    expect(weatherCard.temperature, 40);

    // 4. Other main sections exist
    expect(find.byType(WeatherMetricsCard), findsOneWidget);
    expect(find.byType(ForecastSwitcher), findsOneWidget);
    expect(find.byType(WeatherAlertsSection), findsOneWidget);
  });
}
