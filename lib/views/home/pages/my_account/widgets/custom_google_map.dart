import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    _determinePosition();
    _initMarker();
  }

  late BitmapDescriptor customIcon;
  void _initMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/marker.png');
    markers.add(
      Marker(
        icon: customIcon,
        markerId: const MarkerId("1"),
        position: const LatLng(27.35811230096054, 30.82675897473382),
      ),
    );
    setState(() {});
  }

  @override
  dispose() {
    super.dispose();
    googleMapController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GoogleMap(
        markers: markers,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
        initialCameraPosition: const CameraPosition(
            target: LatLng(27.35811230096054, 30.82675897473382), zoom: 4),
                          onTap: (argument) {
                markers.clear();
                markers.add(
                  Marker(
                    icon: customIcon,
                    markerId: const MarkerId('1'),
                    position: LatLng(argument.latitude, argument.longitude),
                  ),
                );
          
                setState(() {});
              },
      ),
    );
  }

  Future<void> goToLocation(
      {required double latitude, required double longitude}) async {
    googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 17));
    markers.clear();
    
    markers.add(
      Marker(
        icon: customIcon,
        markerId: const MarkerId('1'),
        position: LatLng(latitude, longitude),
      ),
    );
    setState(() {
      
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location services are disabled'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var myLocation = await Geolocator.getCurrentPosition();
   await goToLocation(
        latitude: myLocation.latitude, longitude: myLocation.longitude);
    setState(() {});
    return myLocation;
  }
}
