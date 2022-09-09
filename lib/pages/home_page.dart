import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';

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
  double? temp;
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
  void updateUI() {
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
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.APP_NAME),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Home Page'),
            Text('You are in ${widget.data['name']}'),
          ],
        ),
      ),
    );
  }
}
