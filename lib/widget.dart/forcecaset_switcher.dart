import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/user_provider.dart';
import 'package:weather_app/utils/icons_utils.dart';
import 'package:weather_app/utils/spacing_extension.dart';
import 'package:weather_app/widget.dart/hour_weathe_card.dart';

class ForecastSwitcher extends StatelessWidget {
  const ForecastSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs row
        Row(
          children: [
            _ForecastTabItem(
              label: 'Today',
              isSelected: provider.selectedSection == ForecastSection.today,
              onTap: () => provider.setSection(ForecastSection.today),
            ),
            25.width,
            _ForecastTabItem(
              label: 'Hourly',
              isSelected: provider.selectedSection == ForecastSection.hourly,
              onTap: () => provider.setSection(ForecastSection.hourly),
            ),
            24.width,
            _ForecastTabItem(
              label: 'Monthly',
              isSelected: provider.selectedSection == ForecastSection.monthly,
              onTap: () => provider.setSection(ForecastSection.monthly),
            ),
          ],
        ),

        8.height,
        12.height,
        // List for selected section
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: provider.currentItems.length,
            separatorBuilder: (_, __) => 12.width,
            itemBuilder: (context, index) {
              final item = provider.currentItems[index];
              return HourlyWeatherCard(
                timeLabel: item.time,
                temperature: item.temp,
                icon: weatherStatusToIcon(item.status),
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
