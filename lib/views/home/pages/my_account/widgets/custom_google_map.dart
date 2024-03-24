import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/features/addresses/set_address/set_address_bloc.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    super.key,
    required this.isAddTitle,
    this.lat,
    this.lng,
  });
  final bool isAddTitle;
  final double? lat;
  final double? lng;

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final bloc = KiwiContainer().resolve<SetUpdateAdressBloc>();
  // Completer<GoogleMapController>? myController;
  late GoogleMapController googleMapController;
  final Set<Marker> markers = {};
  static LatLng? initialPosition;
  @override
  void initState() {
    super.initState();
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    print(widget.lat);
    print(widget.lng);
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    _determinePosition();
    _initMarker();
  }

  late BitmapDescriptor customIcon;
  void _initMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/marker.png');
    if (!widget.isAddTitle) {
      markers.add(
        Marker(
          icon: customIcon,
          markerId: const MarkerId("1"),
          position: LatLng(widget.lat!, widget.lng!),
        ),
      );
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    googleMapController.dispose();
  }

  void goToLocation(
      {required double latitude, required double longitude}) async {
    String x = "25.24516138143614426841";
    double y = double.parse(x);
    print(y);
    googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 15));
    markers.clear();
    markers.add(
      Marker(
        icon: customIcon,
        markerId: const MarkerId('1'),
        position: LatLng(latitude, longitude),
      ),
    );

    print('****************************************');
    bloc.lat = (latitude.toString());
    bloc.lng = (longitude.toString());
    CacheHelper.setLat(latitude.toString());
    CacheHelper.setLng(longitude.toString());
    print(latitude);
    print(longitude);
    print(CacheHelper.getLat());
    print(CacheHelper.getLat());
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    var myPlace = placemarks.first;
    CacheHelper.setLocation(myPlace.street ?? "");
    bloc.location = myPlace.street;
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
                  CameraPosition(target: initialPosition!, zoom: 15),
              onTap: (argument) {
                goToLocation(
                    latitude: argument.latitude, longitude: argument.longitude);
                setState(() {});
              },
              gestureRecognizers: {}..add(Factory<EagerGestureRecognizer>(
                  () => EagerGestureRecognizer())),
            ),
          );
  }

  Future<Position> _determinePosition() async {
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    Position myLocation = await Geolocator.getCurrentPosition();
    // await goToLocation(
    //     latitude: myLocation.latitude, longitude: myLocation.longitude);
    initialPosition = LatLng(myLocation.latitude, myLocation.longitude);
    setState(() {});
    return myLocation;
  }
}
// 31.58204289076406