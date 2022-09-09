
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/service/location_service.dart';
import 'package:weather_app/service/network_service.dart';

class WeatherModel {
  final String url = 'https://api.openweathermap.org/data/2.5/weather?';
  Future<Response> getLocationData(BuildContext context) async {
    // And to get the current location of the device,
    LocationService locationService = LocationService();
    await locationService.determinePosition(context);
    // And to get the weather data from the API
    // Of current location
    NetworkService networkService = NetworkService(
        "${url}lat=${locationService.latitude}&lon=${locationService.longitude}&appid=${Constants.API_KEY}&units=metric");
    // Then waiting for the that location's weather data
    Response data = await networkService.fetchData();
    // And then we need to send the data to the HomePage
    return data;
  }

  Future<Response> getSearchLocationData(String city) async {
    NetworkService networkService =
        NetworkService("${url}q=$city&appid=${Constants.API_KEY}&units=metric");
    // Then waiting for the that location's weather data
    Response data = await networkService.fetchData();
    // And then we need to send the data to the HomePage

    return data;
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
