import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  final size;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    var _size = size;
    return Container(
      height: _size,
      width: _size,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
        borderRadius: BorderRadius.all(
          Radius.circular(9.0),
        ),
      ),
    );
  }

  Logo.small(this.image) : size = 24.0;
  Logo.medium(this.image) : size = 40.0;
  Logo.large(this.image) : size = 80.0;
}
