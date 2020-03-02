import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(0.0),
                title: Text(
                  "Jane Dow",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "Manager",
                ),
                trailing: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/settings");
                  },
                ),
              ),
              BlockHeading(
                title: "Points of sales",
                onTap: () {
                  Navigator.of(context).pushNamed('/points-of-sale');
                },
              ),
              PointsOfSaleBlock(),
              BlockHeading(
                title: "Staff",
                onTap: () {
                  Navigator.of(context).pushNamed("/staff");
                },
              ),
              StaffBlock(),
            ],
          ),
        ),
      ),
    );
  }
}

class BlockHeading extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  BlockHeading({this.title = "Block heading", this.onTap});

  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "All",
              textScaleFactor: 0.85,
            ),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class StaffBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EmployeeCard(),
      ],
    );
  }
}

class EmployeeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text("John Smith"),
        subtitle: Text("Employee"),
        onTap: () {
          Navigator.of(context).pushNamed("/staff/employee");
        },
      ),
    );
  }
}

class PointsOfSaleBlock extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PointOfSaleCard(),
        PointOfSaleCard(),
        PointOfSaleCard(),
      ],
    );
  }
}

class PointOfSaleCard extends StatelessWidget {
  final String title;

  PointOfSaleCard({this.title = "J&C Restaurant"});

  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(0.0),
          dense: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed("/pos");
          },
        ),
      ),
    );
  }
}
