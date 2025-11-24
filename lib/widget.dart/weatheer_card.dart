import 'package:flutter/material.dart';
import 'package:weather_app/utils/spacing_extension.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateText,
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade500,
                  ),
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

          // RIGHT SIDE: icon / illustration
          const _CloudMoonIcon(),
        ],
      ),
    );
  }
}

class _CloudMoonIcon extends StatelessWidget {
  const _CloudMoonIcon();

  @override
  Widget build(BuildContext context) {
    // Simple fake illustration using Stack of Icons
    return SizedBox(
      width: 90,
      height: 70,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // Moon / sun
          Positioned(
            right: 8,
            top: 10,
            child: Icon(
              Icons.brightness_3_rounded, // moon shape
              size: 42,
              color: const Color(0xFFF8B339), // yellow-ish
            ),
          ),
          // Cloud in front
          Positioned(
            right: 0,
            bottom: 6,
            child: Icon(
              Icons.cloud_rounded,
              size: 60,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
