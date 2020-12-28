
import 'package:explorar/components/menuButtom.dart';
import 'package:explorar/constants.dart';
import 'package:flutter/material.dart';
import 'package:explorar/explorar/mapa.dart';



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
      drawer: Container(
        width: _width*0.75,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }


  buildBottomNavigationBar() {
    return Padding(
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
    );
  }
}