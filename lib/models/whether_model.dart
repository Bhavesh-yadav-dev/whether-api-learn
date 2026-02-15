class Whether {
  final String cityName;
  final double temperature;
  final String maincondition;

  Whether({
    required this.cityName,
    required this.temperature,
    required this.maincondition,
  });

  factory Whether.fromJson(Map<String, dynamic> json) {
    return Whether(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      maincondition: json['whether'][0]['main'],
    );
  }
}
