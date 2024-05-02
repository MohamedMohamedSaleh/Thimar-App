import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocationn {
  static LatLng? initialPosition;

  static Future<Position?> determinePosition() async {
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    Position? myLocation;
    try {
       myLocation = await Geolocator.getCurrentPosition();
    } catch (e) {
      print(e.toString());
    }
    // await goToLocation(
    //     latitude: myLocation.latitude, longitude: myLocation.longitude);
    initialPosition = myLocation != null
        ? LatLng(myLocation.latitude, myLocation.longitude)
        : null;
    return myLocation;
  }
}
