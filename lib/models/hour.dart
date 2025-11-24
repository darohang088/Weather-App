import 'package:weather_app/providers/user_provider.dart';

class HourData {
  final String time;
  final int temp;
   final WeatherStatus status;

  HourData(this.time, this.temp, this.status);
}
