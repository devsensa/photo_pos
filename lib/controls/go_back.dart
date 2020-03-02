import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:photo_pos/services.dart";

class GoBack extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Provider.of<NavigationService>(context, listen: false).goBack();
      },
    );
  }
}
