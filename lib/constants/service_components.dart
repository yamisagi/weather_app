// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants/dialog_components.dart';

class ServiceComponents {
  static Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Dialogs.openSettingsDialog(context);
    }

    permission = await Geolocator.checkPermission();
    log(permission.toString());
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Dialogs.dialogComponent(context);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Dialogs.dialogComponent(context);
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    log(position.toString());
    return position;
  }
}
