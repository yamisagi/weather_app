import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
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
  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  WeatherModel weatherModel = WeatherModel();
  double temp = 0;
  String? cityName;
  String? weatherIcon;
  String? weatherMessage;
  String? weatherDescription;
  String? weatherTempMax;
  String? weatherTempMin;
  String? weatherHumidity;
  String? weatherPressure;
  String? weatherWindSpeed;
  String? weatherFeelsLike;
  String? message;
  void updateUI(dynamic data) {
    setState(() {
      temp = widget.data['main']['temp'];
      cityName = widget.data['name'];
      weatherIcon = widget.data['weather'][0]['icon'];
      weatherMessage = widget.data['weather'][0]['main'];
      weatherDescription = widget.data['weather'][0]['description'];
      weatherTempMax = widget.data['main']['temp_max'].toString();
      weatherTempMin = widget.data['main']['temp_min'].toString();
      weatherHumidity = widget.data['main']['humidity'].toString();
      weatherPressure = widget.data['main']['pressure'].toString();
      weatherWindSpeed = widget.data['wind']['speed'].toString();
      weatherFeelsLike = widget.data['main']['feels_like'].toString();
      message = weatherModel.getMessage(temp.toInt());
      log(message ?? 'message is null');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.APP_NAME),
        elevation: 0,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Constants.gradientList,
          ),
        ),
        child: Column(
          children: [
            WeatherContainer(
              cityName: cityName,
              weatherDescription: weatherDescription,
              temp: temp,
              weatherIcon: weatherIcon,
            ),
            WeatherMessage(
              weatherMessage: message?? 'You are in',
              cityName: cityName?? 'Unknown Location',
            ),
          ],
        ),
      ),
    );
  }
}
