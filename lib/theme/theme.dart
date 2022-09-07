import 'package:flutter/material.dart';

class ProductTheme {
  ProductTheme._();

  static final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.w900,
        )),
  );
}
