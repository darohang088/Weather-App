import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/user_provider.dart';
import 'package:weather_app/utils/app_safe_area.dart';
import 'package:weather_app/utils/spacing_extension.dart';
import 'package:weather_app/widget.dart/forcecaset_switcher.dart';
import 'package:weather_app/widget.dart/weatheer_card.dart';
import 'package:weather_app/widget.dart/weather_alert_section.dart';
import 'package:weather_app/widget.dart/weather_metrics_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      body: AppSafeArea(
        padding: 20.paddingAll,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .start,
            children: [
              Text("Hello, Hang Daro"),
              WeatherCard(
                dateText: "12/23",
                condition: "Will rain",
                temperature: 40,
              ),
              14.height,
              WeatherMetricsCard(windSpeed: 12, humidity: 78, rainChance: 70),
              14.height,
              ForecastSwitcher(
                selectedSection: provider.selectedSection,
                todayOnTap: () {
                  provider.setSection(ForecastSection.today);
                },
                hourlyOnTap: () {
                  provider.setSection(ForecastSection.hourly);
                },
                monthlyOnTap: () {
                  provider.setSection(ForecastSection.monthly);
                },
                currentItems: provider.currentItems,
              ),
              30.height,
              const WeatherAlertsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
