import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_alert.dart';
import 'package:weather_app/providers/user_provider.dart';
import 'package:weather_app/utils/spacing_extension.dart';

class WeatherAlertsSection extends StatelessWidget {
  const WeatherAlertsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeProvider>();

    return Column(
      crossAxisAlignment: .start,
      children: [
        // Header row
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Weather Alerts',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                _openCreateAlertBottomSheet(context);
              },
              child: const Text('+ Set Alert'),
            ),
          ],
        ),
        8.height,

        // List of alerts
        if (home.alerts.isEmpty)
          Text(
            'No alerts yet. Tap "+ Set Alert" to create one.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          )
        else
          Column(
            children: home.alerts
                .map(
                  (a) => Container(
                    margin: 8.paddingBottom,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(a.condition),
                        Text(
                          '${a.above ? '>' : '<'} ${a.threshold}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  void _openCreateAlertBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _CreateAlertSheet(),
    );
  }
}

class _CreateAlertSheet extends StatefulWidget {
  const _CreateAlertSheet();

  @override
  State<_CreateAlertSheet> createState() => _CreateAlertSheetState();
}

class _CreateAlertSheetState extends State<_CreateAlertSheet> {
  final TextEditingController _thresholdController = TextEditingController();

  String _selectedCondition = 'Rain chance';
  bool _above = true; // above or below threshold

  @override
  void dispose() {
    _thresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: bottom + 20,
        top: 16,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Text(
            'Set Weather Alert',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          16.height,

          // Condition dropdown
          Text(
            'Condition',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            initialValue: _selectedCondition,
            items: const [
              DropdownMenuItem(
                value: 'Rain chance',
                child: Text('Rain chance (%)'),
              ),
              DropdownMenuItem(
                value: 'Temperature',
                child: Text('Temperature (°C)'),
              ),
              DropdownMenuItem(
                value: 'Wind speed',
                child: Text('Wind speed (m/s)'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedCondition = value);
              }
            },
          ),
          12.height,

          // Above / Below
          Text(
            'Trigger when value is',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
          4.height,
          Row(
            children: [
              ChoiceChip(
                label: const Text('Above'),
                selected: _above,
                onSelected: (_) => setState(() => _above = true),
              ),
              8.width,
              ChoiceChip(
                label: const Text('Below'),
                selected: !_above,
                onSelected: (_) => setState(() => _above = false),
              ),
            ],
          ),
          12.height,

          // Threshold
          Text(
            'Threshold',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
          4.height,
          TextField(
            controller: _thresholdController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'e.g. 70',
            ),
          ),
          16.height,

          // Buttons
          Row(
            mainAxisAlignment: .end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              8.width,
              ElevatedButton(
                onPressed: () {
                  final value = double.tryParse(_thresholdController.text);
                  if (value == null) return;

                  final alert = WeatherAlert(
                    condition: _selectedCondition,
                    threshold: value,
                    above: _above,
                  );

                  context.read<HomeProvider>().addAlert(alert);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
