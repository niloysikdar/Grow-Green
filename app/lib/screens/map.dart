import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hack_project/screens/login_screen.dart';
import 'package:hack_project/widgets/star_rating.dart';
import 'package:hack_project/screens/shop_dashboard.dart';

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  Position _position;
  String currentLocation;

  //adding markers
  List<Marker> myMarker = <Marker>[];

  int _selectedIndex = 0;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: size.height - (size.height * 0.33),
                      ),
                      width: size.width,
                      margin: EdgeInsets.only(
                        top: size.height * 0.06,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titlePrice(context: context),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              customButton(
                                text: "Address",
                                iconData: Icons.location_on_rounded,
                              ),
                              SizedBox(width: 25),
                              customButton(
                                text: "Call",
                                iconData: Icons.call,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              customButton(
                                text: "Visit Website",
                                iconData: Icons.web,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Small pottery shop based out of Jaipur\nSpecialities: Printed pots, matkas.",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              customButton(text: "Pottery"),
                              SizedBox(width: 10),
                              customButton(text: "Rajasthanisakas"),
                              SizedBox(width: 10),
                              customButton(text: "Pottery"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    myMarker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(19.2481883, 73.1539467),
      infoWindow: InfoWindow(title: "hh"),
      onTap: _showBottomSheet,
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if(index==1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "fav"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget customButton({
  @required String text,
  IconData iconData,
}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          (iconData != null)
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                )
              : Container(height: 0, width: 0),
        ],
      ),
    ),
  );
}

Widget titlePrice({@required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Local Pottery shop",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          ratingBar(
            context: context,
            initialRating: 4,
          ),
        ],
      ),
      Text(
        "₹ 40-80",
        style: GoogleFonts.dmSans(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
