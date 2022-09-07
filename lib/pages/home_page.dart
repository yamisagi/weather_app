// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/constants/service_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.APP_NAME),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ServiceComponents.determinePosition(context);
          },
          child: const Text(Constants.get_weather_button),
        ),
      ),
    );
  }
}
