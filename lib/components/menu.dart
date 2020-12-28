import 'package:flutter/material.dart';
import '../constants.dart';
import 'crossPlataformSVG.dart';

Container buildMenu(double _width, double _height) {
    return Container(
          width: _width*0.75,
          child: Drawer(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(
                                    color: kGrey,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0,1),
                                  )]
                                ),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage("https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg"),
                                ),
                              ),
                              onTap: () => print("Editar Perfil"),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Olá José",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text("josee@gmail.com"),
                            SizedBox(height: 20,),
                            Container(
                              child: CrossPlatformSvg.asset("https://svgshare.com/i/ShA.svg"),
                              //SvgPicture.asset('assets/icons/LoadingBar.svg')
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      ListTile(
                        title: Text('Configurações', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: Text('Sobre o retomba', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: Text('Sugerir edifício', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: Text('Mudar cidade', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: Text('Sair', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                    ],
                  ),
                ),
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 80,
                    alignment: Alignment.center,
                    color: kLightGrey.withOpacity(0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "retomba", 
                          style:TextStyle(
                            fontFamily: 'atami',
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 1,
                          )
                        ),
                        Text(
                          "v.1.0.0.2", 
                          style:TextStyle(
                            fontWeight: FontWeight.w100,
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }