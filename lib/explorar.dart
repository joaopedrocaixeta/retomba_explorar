
import 'package:flutter/material.dart';
import 'package:explorar/explorar/mapa.dart';



class Explorar extends StatefulWidget {
  @override
  _ExplorarState createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        child: Map()
      ),
    );
  }
}