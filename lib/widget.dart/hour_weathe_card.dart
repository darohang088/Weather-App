import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/providers/user_provider.dart';
import 'package:weather_app/utils/icons_utils.dart';
import 'package:weather_app/widget.dart/lottie_icon.dart';

class HourlyWeatherCard extends StatelessWidget {
  final String timeLabel;
  final int temperature;
  final WeatherStatus weatherStatus;

  const HourlyWeatherCard({
    super.key,
    required this.timeLabel,
    required this.temperature,
    required this.weatherStatus,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Colors.grey.shade700;

    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            timeLabel,
            style: textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          AppLottieIcon(width: 50, assetPath: weatherAsset(weatherStatus)),
          const SizedBox(height: 12),
          Text(
            '${temperature}º',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
