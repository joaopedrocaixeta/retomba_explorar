import 'package:explorar/explorar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,// transparent status bar
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: kGrey,
  ));
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kDarkBlue),
          bodyText2: TextStyle(color: kDarkBlue),
        ),
        primaryColor: kDarkBlue,
        //textTheme: Theme.of(context).textTheme.apply(bodyColor: kDarkBlue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Explorar(),
    );
  }
}
