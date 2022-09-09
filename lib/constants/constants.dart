// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Constants {
  // ------------STRINGS-------------
  static const String APP_NAME = "WhatWeather";
  static const String get_weather_button = "Get Weather";
  static const String loading_text = 'Please wait while we get your location';
  // ------------API-------------
  static const String API_KEY = "a696bd529272a6241accc0c8b90207eb";
  // ------------OTHERS-------------
  static const spacer = SizedBox(height: 20);
  static const globalMargin = EdgeInsets.all(20);
  static const globalPadding = EdgeInsets.all(20);
  static final splashComponent = SpinKitPulse(
    color: Colors.blueGrey.shade800,
    size: 150.0,
  );
  static final BorderRadius borderRadius = BorderRadius.circular(10);
  // -----------COLORS-------------
  static final List<Color> gradientList = [
    Colors.blue.shade100,
    Colors.blue.shade200,
    Colors.blue.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.blue.shade600,
    Colors.blue.shade700,
    Colors.blue.shade800,
    Colors.blue.shade900,
  ];
}
