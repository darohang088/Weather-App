import 'package:flutter/material.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/utils/icons_utils.dart';
import 'package:weather_app/utils/spacing_extension.dart';
import 'package:weather_app/widget.dart/hour_weathe_card.dart';

class HourlyWeatherStrip extends StatelessWidget {
  final List<HourData> items;

  const HourlyWeatherStrip({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: 16.paddingHorizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => 12.width,
        itemBuilder: (context, index) {
          final item = items[index];
          return HourlyWeatherCard(
            timeLabel: item.time,
            temperature: item.temp,
            icon: weatherStatusToIcon(item.status),
          );
        },
      ),
    );
  }
}
