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
