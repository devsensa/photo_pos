import "package:flutter/material.dart";

import "package:photo_pos/controls.dart";

class PosPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  title: Text(
                    "J&C Restaurant",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  leading: GoBack(),
                ),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
                PosDealCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PosDealCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          title: Text(
            "Table 1",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
            textScaleFactor: 0.85,
          ),
          trailing: SizedBox(
            height: 64,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Statistics(label: "Price", value: 20),
                Statistics(label: "Items", value: 2),
              ],
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("John Smith"),
              Text("09:40"),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/deals");
          },
        ),
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  final String label;
  final num value;
  final double labelScaleFactor;
  final double valueScaleFactor;
  final EdgeInsets padding;

  Statistics({
    this.label = "Label",
    this.value = 0,
    this.labelScaleFactor = 0.7,
    this.valueScaleFactor = 1.125,
    this.padding = const EdgeInsets.all(8.0),
  });

  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        margin: EdgeInsets.all(0.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                label,
                textScaleFactor: labelScaleFactor,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "$value",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textScaleFactor: valueScaleFactor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
