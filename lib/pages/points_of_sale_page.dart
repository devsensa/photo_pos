import "package:flutter/material.dart";

import 'package:photo_pos/controls/controls.dart';

class PointsOfSalePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GoBack(),
        title: Text("Points of sales"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<AlertDialog>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("New point-of-sale"),
              contentPadding: EdgeInsets.all(16.0),
              content: SingleChildScrollView(
                child: NewPosForm(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewPosForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                border: OutlineInputBorder(),
                labelText: 'Address',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: RaisedButton(
              child: Text(
                "Add",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
