import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/widget.dart/lottie_icon.dart';

class WeatherMetricsCard extends StatelessWidget {
  final int windSpeed; // m/s
  final int humidity; // %
  final int rainChance; // %

  const WeatherMetricsCard({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.rainChance,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.grey.shade700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _WeatherMetricItem(
            icon: Icons.air_rounded,
            valueText: '$windSpeed m/s',
            labelText: 'Wind',
            color: color,
          ),
          _WeatherMetricItem(
            icon: Icons.water_drop_outlined,
            valueText: '$humidity%',
            labelText: 'Humidity',
            color: color,
          ),
          _WeatherMetricItem(
            icon: Icons.cloudy_snowing, // or Icons.umbrella
            valueText: '$rainChance%',
            labelText: 'Rain',
            color: color,
          ),
        ],
      ),
    );
  }
}

class _WeatherMetricItem extends StatelessWidget {
  final IconData icon;
  final String valueText;
  final String labelText;
  final Color color;

  const _WeatherMetricItem({
    required this.icon,
    required this.valueText,
    required this.labelText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24, color: color),

        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.topLeft,
            child: Lottie.asset("assets/images/weather_rain.json"),
          ),
        ),

        const SizedBox(height: 8),
        Text(
          valueText,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          labelText,
          style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
