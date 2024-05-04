import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/logic/cache_helper.dart';

class GetLocationn {
  static LatLng? initialPosition;
  static StreamController<bool> controller = StreamController<bool>.broadcast();

  static bool isGetMyLocation = false;
  static Future<Position?> determinePosition() async {
    controller.add(false);
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    Position? myLocation;
    try {
      myLocation = await Geolocator.getCurrentPosition();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    // await goToLocation(
    //     latitude: myLocation.latitude, longitude: myLocation.longitude);
    initialPosition = myLocation != null
        ? LatLng(myLocation.latitude, myLocation.longitude)
        : null;

    List<Placemark>? placemarks = myLocation != null
        ? await placemarkFromCoordinates(
            myLocation.latitude, myLocation.longitude)
        : null;
    if (placemarks != null) {
      var myPlace = placemarks.first;
      await CacheHelper.setCurrentLocation(myPlace.subAdministrativeArea ?? '');
      controller.add(true);
      isGetMyLocation = true;
    }
    return myLocation;
  }
}
