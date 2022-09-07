import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Dialogs {
  // -----------------COMPONENTS-----------------
  static dialogComponent(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Please grant location permission in settings !',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              child: const Text('Open Settings'),
              onPressed: () async {
                Navigator.of(context).pop();
                await Geolocator.openAppSettings();
                await Geolocator.openLocationSettings();
              },
            ),
          )
        ],
      ),
    );
  }

  static openSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Please make sure location is on in settings !',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              child: const Text('Open Settings'),
              onPressed: () async {
                Navigator.of(context).pop();
                await Geolocator.openLocationSettings();
              },
            ),
          )
        ],
      ),
    );
  }
}
