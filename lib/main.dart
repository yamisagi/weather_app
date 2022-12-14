import 'package:flutter/material.dart';
import 'package:weather_app/pages/loading_page.dart';
import 'package:weather_app/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProductTheme.lightTheme,
      home: const LoadingPage(),
    );
  }
}
