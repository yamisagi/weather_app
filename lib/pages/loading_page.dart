// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/service/weather_model.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getLocation() {
    WeatherModel().getLocationData(context).then((data) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              data: jsonDecode(data.body),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Constants.boxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              child: Text(
                Constants.APP_NAME,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Constants.spacer,
            Constants.splashComponent,
            Text(
              Constants.loading_text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
              child: ElevatedButton(
                  onPressed: () {
                    getLocation();
                  },
                  child: const Text(Constants.get_weather_button)),
            )
          ],
        ),
      ),
    );
  }
}
