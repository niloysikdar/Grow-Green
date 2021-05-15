import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();


}

class _MapState extends State<Map> {

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller)  {
    mapController = controller;

  }

    @override
  void initState() {
    super.initState();
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("App"),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,

          initialCameraPosition: CameraPosition(
            target: LatLng(37.43296265331129, -122.08832357078792),
            zoom: 11.0,
          ),

        ),



      );
    }
  }

