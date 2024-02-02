import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the new Maps renderer to support styling with a Maps Cloud ID on Android.
  // The Maps package by default uses a legacy renderer which does not support cloud map ID's.
  final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    unawaited(mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest));
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const LatLng _fallbackCoordinates = LatLng(52.357994, 4.868648);
  static const initialCameraPosition = CameraPosition(
    target: _fallbackCoordinates,
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          mapToolbarEnabled: false,
          rotateGesturesEnabled: false,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          cloudMapId: '<YOUR CLOUD MAP ID>',
        ),
      ),
    );
  }
}
