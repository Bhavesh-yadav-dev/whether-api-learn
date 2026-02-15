import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:whether_app_api/models/whether_model.dart';

class WhetherServices {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apikey;

  WhetherServices({required this.apikey});

  Future<Whether> getWheather(String cityName) async {
    final response = await http.get(
      Uri.parse('$BASE_URL?q=$cityName&appid=$apikey&units=metric'),
    );
    if (response.statusCode == 200) {
      return Whether.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load weathe");
    }
  }

  Future<String> getCurrentCity() async {
    // get permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //fetch current location

    Position position = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );
    // convert into city name

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
