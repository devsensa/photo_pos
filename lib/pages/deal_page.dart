import "package:flutter/material.dart";

import "package:photo_pos/controls.dart";

class DealPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        title: Text(
          "Table 1",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: GoBack(),
      ),
    );
  }
}
