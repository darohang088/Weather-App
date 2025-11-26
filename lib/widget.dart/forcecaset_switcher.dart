import 'package:flutter/material.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/providers/user_provider.dart';
import 'package:weather_app/utils/spacing_extension.dart';
import 'package:weather_app/widget.dart/hour_weathe_card.dart';

class ForecastSwitcher extends StatelessWidget {
  const ForecastSwitcher({
    super.key,
    required this.selectedSection,
    required this.todayOnTap,
    required this.hourlyOnTap,
    required this.monthlyOnTap,
    required this.currentItems,
  });

  final ForecastSection selectedSection;
  final List<HourData> currentItems;
  final Function() todayOnTap;
  final Function() hourlyOnTap;
  final Function() monthlyOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // Tabs row
        Row(
          children: [
            _ForecastTabItem(
              label: 'Today',
              isSelected: selectedSection == ForecastSection.today,
              onTap: todayOnTap,
            ),
            25.width,
            _ForecastTabItem(
              label: 'Hourly',
              isSelected: selectedSection == ForecastSection.hourly,
              onTap: hourlyOnTap,
            ),
            24.width,
            _ForecastTabItem(
              label: 'Monthly',
              isSelected: selectedSection == ForecastSection.monthly,
              onTap: monthlyOnTap,
            ),
          ],
        ),

        8.height,
        12.height,
        // List for selected sections
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: currentItems.length,
            separatorBuilder: (_, __) => 12.width,
            itemBuilder: (context, index) {
              final item = currentItems[index];
              return HourlyWeatherCard(
                timeLabel: item.time,
                temperature: item.temp,
                weatherStatus: item.status,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ForecastTabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ForecastTabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.grey.shade800 : Colors.grey.shade500;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: color,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}
