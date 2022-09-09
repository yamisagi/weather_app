import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';

class WeatherMessage extends StatelessWidget {
  final String weatherMessage;
  final String cityName;
  const WeatherMessage({
    super.key,
    required this.weatherMessage,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constants.globalMargin,
      padding: Constants.globalPadding,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.white.withOpacity(0.5),
            Colors.grey.withOpacity(0.3),
          ],
          center: Alignment.topLeft,
          radius: 2.0,
        ),
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: Constants.borderRadius,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              '${weatherMessage.toUpperCase()} in',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Text(
            ' $cityName',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.white,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
