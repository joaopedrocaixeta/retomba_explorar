import 'dart:async';
import 'package:explorar/constants.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'markers.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
  
}

class _MapState extends State<Map> {
  GoogleMapController _controller;
  bool isMapCreated = false;
  BitmapDescriptor _mapMarker1;
  BitmapDescriptor _mapMarker2;
  BitmapDescriptor _mapMarker3;
  BitmapDescriptor _mapMarker1s;
  BitmapDescriptor _mapMarker2s;
  BitmapDescriptor _mapMarker3s;

  static final LatLng myLocation = LatLng(-18.925007, -48.283918); //deixar arbitrario assim mesmo


  @override
  void initState() {
    super.initState();
    //Add Firebase instance

  }

  
  
  final CameraPosition _kDefaultPosition = CameraPosition(
    target: myLocation,
    zoom: 15.5,
  );

  //go to default position funcion
  Future<void> _goToDefault() async {
    final GoogleMapController controller = _controller;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kDefaultPosition));
  }

  //map styling
  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString("assets/map/map_style.json");
  }


  //markers passar os métodos para a pag markers.dart
  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_mapMarker1 == null) {
      _mapMarker1= await getBitmapDescriptorFromAssetBytes("assets/icons/map/pin1.png", 150);//assign path
      _mapMarker2= await getBitmapDescriptorFromAssetBytes("assets/icons/map/pin2.png", 150);//assign path
      _mapMarker3= await getBitmapDescriptorFromAssetBytes("assets/icons/map/pin3.png", 150);//assign path
      //_mapMarker1s= await getBitmapDescriptorFromAssetBytes("assets/icons/map/pin1s.png", 150);//assign path
      //_mapMarker2s= await getBitmapDescriptorFromAssetBytes("assets/icons/map/pin2s.png", 150);//assign path
      //_mapMarker3s= await getBitmapDescriptorFromAssetBytes("assets/icons/map/pin3s.png", 150);//assign path
    }
  }

  _updateMarkers(){
    //mudar o icone do marcador para o marcador menor 'pinXs.png' baseado no zoom
  }

  _onMarkerClicked(){
    //subir uma pagina de informações do edifício
    //colocar um círculo atrás do marcador
  }

  
  Set<Marker> _createMarkers() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: myLocation,
        icon: _mapMarker1,
        onTap: (){
          _onMarkerClicked();
        },
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(-18.93, -48.285),
        icon: _mapMarker2,
      ),
      Marker(
        markerId: MarkerId("marker_3"),
        position: LatLng(-18.9357, -48.2857),
        icon: _mapMarker3,
      ),
    ].toSet();
  }


  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);

    return Stack(
      children: <Widget> [
        
        Container(
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              isMapCreated = true;
              getJsonFile("assets/map/map_style.json").then(setMapStyle);
              setState(() {});
            },
            onCameraMove: (CameraPosition cameraPosition) {
              if (cameraPosition.zoom<16.6){
                //_updateMarkers();
              }
            },
            mapType: MapType.normal,
            mapToolbarEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            rotateGesturesEnabled: true,
            markers: _createMarkers(),
            initialCameraPosition: _kDefaultPosition,
            
            
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: _goToDefault,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.my_location_rounded , color: kDarkBlue,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: _goToDefault,
                      backgroundColor: kDarkBlue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions , color: Colors.white,),
                          Text("IR", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }
}