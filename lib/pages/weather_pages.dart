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
  final WeatherServices _weatherService =
      WeatherServices(apikey: 'enter your api key');

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
      final Weather weather =
          await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      debugPrint("Weather fetch error: $e");
    }
  }
  // animation



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //city name
       Center(child: Text(_weather?.cityName?? "loading city...")),
     
       //animation
     
      //  Lottie.asset('animation/cloudy.json'),
        //temperature
        Text('${_weather?.temperature.round()}°C'),
     
      ],
     ),
    );
  }
}
