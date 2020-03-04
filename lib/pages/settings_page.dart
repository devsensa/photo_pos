import "package:flutter/material.dart";

import 'package:photo_pos/controls/controls.dart';

class SettingsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListTile(
          leading: GoBack(),
        ),
      ),
    );
  }
}
