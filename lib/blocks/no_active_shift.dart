import 'package:flutter/material.dart';

class NoActiveShift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 360,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Shift not started"),
              Text("You can start your next shift by press button 'Start'"),
              RaisedButton(
                onPressed: () {},
                child: Text("Start"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
