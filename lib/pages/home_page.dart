import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/routes.dart';
import 'package:weather_app/utils/app_safe_area.dart';
import 'package:weather_app/utils/context_extension.dart';
import 'package:weather_app/utils/spacing_extension.dart';
import 'package:weather_app/widget.dart/custom_button.dart';
import 'package:weather_app/widget.dart/forcecaset_switcher.dart';
import 'package:weather_app/widget.dart/hour_weather_strip.dart';
import 'package:weather_app/widget.dart/weatheer_card.dart';
import 'package:weather_app/widget.dart/weather_metrics_card.dart';
import '../../providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeProvider>();

    return Scaffold(
      body: AppSafeArea(
        padding: 20.paddingAll,
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Text("Hello, ${home.username}"),
            WeatherCard(
              dateText: "12/23",
              condition: "Will rain",
              temperature: 40,
            ),
            14.height,
            WeatherMetricsCard(windSpeed: 12, humidity: 78, rainChance: 70),
            14.height,
            const ForecastSwitcher(),
            CustomButton(
              label: 'go to detail',
              onTap: () {
                home.setUsername("daro");
                // Navigator.pushNamed(context, Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
