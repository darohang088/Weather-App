import 'package:flutter/material.dart';
import 'package:weather_app/utils/spacing_extension.dart';
import 'package:weather_app/widget.dart/lottie_icon.dart';

class WeatherCard extends StatelessWidget {
  final String dateText; // e.g. "04 August 2024"
  final String condition; // e.g. "Cloudy"
  final int temperature; // e.g. 18

  const WeatherCard({
    super.key,
    required this.dateText,
    required this.condition,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          // LEFT SIDE: date, condition, temperature
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Icon(Icons.my_location_outlined, size: 18),
                    5.width,
                    Text(
                      dateText,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                6.height,
                Text(
                  condition,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                16.height,
                Text(
                  '${temperature}ºC',
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          16.width,
          AppLottieIcon(
            width: 100,
            assetPath: "assets/images/weather_cloud.json",
          ),
        ],
      ),
    );
  }
}
