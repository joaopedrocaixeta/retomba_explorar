
import 'package:explorar/components/menuButtom.dart';
import 'package:explorar/constants.dart';
import 'package:flutter/material.dart';
import 'package:explorar/explorar/mapa.dart';

import 'components/menu.dart';


class Explorar extends StatefulWidget {
  @override
  _ExplorarState createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        child: Stack(children:<Widget>[
          Map(),
          LeadingButtom(),
        ])
      ),
      drawer: buildMenu(_width, _height),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: kDarkBlue.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0,-1),
        ),]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:5,left: 20, right: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 26,
          unselectedItemColor: kGrey,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              label: "Comunidade",
              icon:  Icon(Icons.people_alt_rounded),
              backgroundColor: kLightYellow,
            ),
            BottomNavigationBarItem(
              label: "Explorar",
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: "Lista",
              icon:  Icon(Icons.list_rounded),
            ),
          ],
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}