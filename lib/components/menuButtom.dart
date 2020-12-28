import 'package:flutter/material.dart';
import 'package:explorar/constants.dart';


class LeadingButtom extends StatefulWidget {
  @override
  _LeadingButtomState createState() => _LeadingButtomState();
  
}

class _LeadingButtomState extends State<LeadingButtom> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isPlaying = false; 

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
    Scaffold.of(context).openDrawer();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0,top:40.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 48,
            height: 48,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => _handleOnPressed(),
                backgroundColor: Colors.white,
                child: AnimatedIcon(
                  size: 30,
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  color: kDarkBlue,
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}