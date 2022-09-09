import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';

class WeatherContainer extends StatelessWidget {
  final String? cityName;
  final String? weatherDescription;
  final int? temp;
  final String weatherIcon;
  final double mintemp;
  final double maxtemp;
  final int humidity;
  final int pressure;

  const WeatherContainer({
    Key? key,
    required this.cityName,
    required this.weatherDescription,
    required this.temp,
    required this.weatherIcon,
    required this.mintemp,
    required this.maxtemp,
    required this.humidity,
    required this.pressure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constants.globalMargin,
      padding: Constants.globalPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: Constants.borderRadius,
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(0.4),
            Colors.grey.withOpacity(0.5),
            Colors.white.withOpacity(0.2),
          ],
          center: Alignment.topLeft,
          radius: 2.0,
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'The weather in $cityName is',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${weatherDescription?.toUpperCase()}',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'with a temperature of',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${temp?.toStringAsFixed(1)}°C',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.orange.shade700),
              ),
              Image.network(
                'http://openweathermap.org/img/wn/$weatherIcon@2x.png',
                filterQuality: FilterQuality.high,
                scale: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Min: ${mintemp.toStringAsFixed(1)} Max: ${maxtemp.toStringAsFixed(1)}',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white)),
            ],
          ),
          Constants.spacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Humidity: $humidity% Pressure: $pressure hPa',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
