import 'dart:async';
import 'package:explorar/constants.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Explorar extends StatefulWidget {
  @override
  _ExplorarState createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  GoogleMapController _controller;
  bool isMapCreated = false;
  static final LatLng myLocation = LatLng(-18.925007, -48.283918);

  @override
  void initState() {
    super.initState();
  }

  final CameraPosition _kDefaultPosition = CameraPosition(
    target: myLocation,
    zoom: 15.5,
  );

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }
  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString("assets/map/map_style.json");
  }

  Future<void> _goToDefault() async {
    final GoogleMapController controller = _controller;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kDefaultPosition));
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("marker_1"),
          position: myLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _goToDefault,
        backgroundColor: Colors.white,
        child: Icon(Icons.my_location_rounded , color: kDarkBlue,),
      ),
      body: Container(
        child: GoogleMap(
    
          mapType: MapType.normal,
          mapToolbarEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          rotateGesturesEnabled: true,
          
          markers: _createMarker(),
          initialCameraPosition: _kDefaultPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            isMapCreated = true;
            getJsonFile("assets/map/map_style.json").then(setMapStyle);
            setState(() {});
          },
          
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: [],),
    );
  }
}