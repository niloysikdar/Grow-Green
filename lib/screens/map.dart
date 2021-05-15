import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();


}

class _MapState extends State<Map> {

  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController mapController;
  Position _position;
  String currentLocation;

  //adding markers
  List<Marker> myMarker = <Marker>[];

  int _selectedIndex = 0;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    myMarker.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(19.2481883, 73.1539467),
        )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  void _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        setState(() {
          currentLocation = "permission denied";
        });
      } else {
        var position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          // currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
          _position = position;
        });
      }
    } else {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _position = position;
        // currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
      });
    }
    print(_position);
    if (_position != null) {
      CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(
          LatLng(_position.latitude, _position.longitude), 15);
      mapController.animateCamera(cameraUpdate);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 11.0,
        ),
        markers: Set.from(myMarker),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "fav"

          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),


    );
  }

}

