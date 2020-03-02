import "package:flutter/material.dart";

import "package:photo_pos/controls.dart";

class EmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          primary: true,
          leading: GoBack(),
          title: Text("John Smith"),
          actions: <Widget>[
            PopupMenuButton<Object>(
              itemBuilder: (BuildContext context) {
                return [];
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hour rate: 5\$"),
              Text("% of sales: 10%"),
              ListTile(
                contentPadding: EdgeInsets.all(0.0),
                dense: true,
                title: Text("Shifts"),
              ),
              EmployeeShiftCard(),
              EmployeeShiftCard(),
              EmployeeShiftCard(),
            ],
          ),
        ));
  }
}

class EmployeeShiftCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("J&C Restaurant"),
          Text("02.02.2020"),
          Text("4h 36m"),
          Text("Earn: 80\$"),
          Text("Sell: 250"),
          Text("Not payed"),
        ],
      ),
    );
  }
}
