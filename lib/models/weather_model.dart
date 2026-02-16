class Weather {
  final String cityName;
  final double temperature;
  final String maincondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.maincondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? '',
      temperature: (json['main']?['temp'] ?? 0).toDouble(),
      maincondition:
          json['weather'] != null && json['weather'].isNotEmpty
              ? json['weather'][0]['main']
              : 'Unknown',
    );
  }
}
