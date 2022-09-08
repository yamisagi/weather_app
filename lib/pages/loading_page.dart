// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/constants/service_components.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/service/network_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  // We created two properties to store the latitude and longitude
  // To use the properties, when we get the data from the API
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    // And to get the current location of the device,
    LocationService locationService = LocationService();
    await locationService.determinePosition(context);
    // Waiting for the current location of the device
    // and assign the latitude and longitude to the properties
    latitude = locationService.latitude;
    longitude = locationService.longitude;
    // And to get the weather data from the API
    // Of current location
    NetworkService networkService = NetworkService(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${Constants.API_KEY}");
    // Then waiting for the that location's weather data
    Response data = await networkService.fetchData();
    // And then we need to send the data to the HomePage
    log(data.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        final decodedData = jsonDecode(data.body);
        return HomePage(data: decodedData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Constants.APP_NAME,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          SpinKitPulse(
            color: Colors.blueGrey.shade800,
            size: 150.0,
          ),
          const SizedBox(height: 20),
          Text(
            'Please wait while we get your location',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      )),
    );
  }
}
