import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whether_app_api/models/weather_model.dart';
import 'package:whether_app_api/services/weather_services.dart';

class WeatherPages extends StatefulWidget {
  const WeatherPages({super.key});

  @override
  State<WeatherPages> createState() => _WeatherPagesState();
}

class _WeatherPagesState extends State<WeatherPages> {
  // API service
  final WeatherServices _weatherService = WeatherServices(
    apikey: 'api key ',
  );

  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  // Fetch weather
  Future<void> _fetchWeather() async {
    try {
      // Get current city
      final String cityName = await _weatherService.getCurrentCity();

      // Get weather data
      final Weather weather = await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      debugPrint("Weather fetch error: $e");
    }
  }
  // animation

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'cloud':
        return 'assets/animation/cloudy.json';
      case 'shower rain':
        return 'assets/animation/rainy.json';
      case 'thunderstorm':
        return 'assets/animation/thunder.json';
      case 'clear':
        return 'assets/animation/sunny.json';
      default:
        return 'assets/animation/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 179, 176, 176),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertically centers

            children: [
              // city name
              Text(
                _weather?.cityName ?? "loading city...",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              // animation
              Lottie.asset(getWeatherAnimation(_weather?.maincondition ?? "")),

              // temperature
              Text(
                '${_weather?.temperature.round()}°C',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),

              // Weather Condition Text
              Text(
                _weather?.maincondition ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ), // Medium bold
              ),
            ],
          ),
        ),
      ),
    );
  }
}
