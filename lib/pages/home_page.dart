import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/pages/city_page.dart';
import 'package:weather_app/product/weather_container.dart';
import 'package:weather_app/product/weather_message.dart';
import 'package:weather_app/service/weather_model.dart';

class HomePage extends StatefulWidget {
  final dynamic data;
  const HomePage({
    super.key,
    required this.data,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel = WeatherModel();
  double temp = 0;
  String? cityName;
  String? weatherIcon;
  String? weatherMessage;
  String? weatherDescription;
  double? weatherTempMax;
  double? weatherTempMin;
  int? weatherHumidity;
  int? weatherPressure;
  String? weatherWindSpeed;
  String? weatherFeelsLike;
  String? message;

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  void updateUI(weatherData) {
    setState(() {
      temp = weatherData['main']['temp'];
      cityName = weatherData['name'];
      weatherIcon = weatherData['weather'][0]['icon'];
      weatherMessage = weatherData['weather'][0]['main'];
      weatherDescription = weatherData['weather'][0]['description'];
      weatherTempMax = weatherData['main']['temp_max'];
      weatherTempMin = weatherData['main']['temp_min'];
      weatherHumidity = weatherData['main']['humidity'];
      weatherPressure = weatherData['main']['pressure'];
      weatherWindSpeed = weatherData['wind']['speed'].toString();
      weatherFeelsLike = weatherData['main']['feels_like'].toString();
      message = weatherModel.getMessage(temp.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.APP_NAME),
        elevation: 0,
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          icon: const Icon(Icons.location_on_outlined),
          onPressed: () async {
            Response weatherData = await weatherModel.getLocationData(context);
            updateUI(jsonDecode(weatherData.body));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String cityValue = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CitySearchPage(),
                ),
              );
              Response weatherData =
                  await weatherModel.getSearchLocationData(cityValue);
              updateUI(jsonDecode(weatherData.body));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: Constants.boxDecoration,
          child: Column(
            children: [
              WeatherContainer(
                mintemp: weatherTempMin ?? 0,
                maxtemp: weatherTempMax ?? 0,
                humidity: weatherHumidity ?? 0,
                pressure: weatherPressure ?? 0,
                cityName: cityName,
                weatherDescription: weatherDescription,
                temp: temp.toInt(),
                weatherIcon: weatherIcon ?? '🙃',
              ),
              WeatherMessage(
                weatherMessage: message ?? 'You are in',
                cityName: cityName ?? 'Unknown Location',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
