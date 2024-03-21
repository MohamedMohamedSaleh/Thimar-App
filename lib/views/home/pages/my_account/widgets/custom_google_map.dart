import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  // Completer<GoogleMapController>? myController;
  late GoogleMapController googleMapController;
  final Set<Marker> markers = {};
  static LatLng? initialPosition;
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
  void dispose() {
    super.dispose();
    googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return initialPosition == null
        ? Center(
            child: Text(
              'loading map..',
              style: TextStyle(
                  fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GoogleMap(
              // myLocationButtonEnabled: true,
              // myLocationEnabled: true,
              markers: markers,
              onMapCreated: (controller) {
                googleMapController = controller;
                // myController?.complete(controller);
              },
              initialCameraPosition:
                  CameraPosition(target: initialPosition!, zoom: 16),
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
              gestureRecognizers: {}..add(Factory<EagerGestureRecognizer>(
                  () => EagerGestureRecognizer())),
            ),
          );
  }

  Future<Position> _determinePosition() async {
    // ignore: unused_local_variable
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    Position myLocation = await Geolocator.getCurrentPosition();
    // await goToLocation(
    //     latitude: myLocation.latitude, longitude: myLocation.longitude);
    initialPosition = LatLng(myLocation.latitude, myLocation.longitude);
    setState(() {});
    return myLocation;
  }

  // void test()async {
  //   initialPosition =await testPosition();
  // }

  // Future<LatLng> testPosition() async {
  //   // ignore: unused_local_variable
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  //   Position myLocation = await Geolocator.getCurrentPosition();
  //   // await goToLocation(
  //   //     latitude: myLocation.latitude, longitude: myLocation.longitude);
  //   initialPosition = LatLng(myLocation.latitude, myLocation.longitude);
  //   setState(() {});
  //   return LatLng(myLocation.latitude, myLocation.longitude);
  // }
}
