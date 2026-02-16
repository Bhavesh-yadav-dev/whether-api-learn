import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:whether_app_api/models/weather_model.dart';

class WeatherServices {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apikey;

  WeatherServices({required this.apikey});

  Future<Weather> getWeather(String cityName) async {
    cityName = cityName.trim(); 

    final response = await http.get(
      Uri.parse(
        '$BASE_URL?q=${Uri.encodeComponent(cityName)}&appid=$apikey&units=metric',
      ), // ✅ FIX 2
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      print("API Error: ${response.statusCode} - ${response.body}");
      throw Exception("failed to load weather");
    }
  }

  Future<String> getCurrentCity() async {
    // get permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // convert into city name
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    // ✅ FIX 3: fallback if locality is null
    String? city =
        placemarks[0].locality ??
        placemarks[0].administrativeArea;

    return city?.trim() ?? "";
  }
}
