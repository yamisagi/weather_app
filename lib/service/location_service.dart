// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants/dialog_components.dart';

class LocationService {
  // We created two properties to store the latitude and longitude
  double? latitude;
  double? longitude;

  Future<Position> determinePosition(BuildContext context) async {
    try {
      // And to get the current location of the device,
      // 1.  Service should be enabled in the device settings
      // 2.  We need to request permission to access the location

      bool serviceEnabled;
      LocationPermission permission;
      // We need to check if the service is enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // If the service is not enabled, we need to request permission
      if (!serviceEnabled) {
        return Dialogs.openSettingsDialog(context);
      }
      // If the service is enabled, we need to request permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Dialogs.dialogComponent(context);
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Dialogs.dialogComponent(context);
      }
      try {
        // If the permission is granted, we need to get the current location
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: const Duration(seconds: 10),
        );
        // And store the latitude and longitude
        latitude = position.latitude;
        longitude = position.longitude;
        return position;
      } on TimeoutException catch (_) {
        // If the location is not found in 5 seconds, we need to show a dialog
        // And retry to get the location
        Dialogs.timeOutDialog(context);
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        // And store the latitude and longitude
        latitude = position.latitude;
        longitude = position.longitude;
        return position;
      }
    } catch (e) {
      // If the location is not available, we need to show a dialog
      return Dialogs.dialogComponent(context);
    }
  }
}
