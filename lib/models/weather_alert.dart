class WeatherAlert {
  final String condition; // e.g. "Rain chance"
  final double threshold; // e.g. 70
  final bool above; // true = above, false = below

  WeatherAlert({
    required this.condition,
    required this.threshold,
    required this.above,
  });
}
