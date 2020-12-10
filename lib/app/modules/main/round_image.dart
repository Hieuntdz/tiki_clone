import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final double borderRadius;
  final Color borderColor;
  final String imageUrl;
  final BoxFit boxFit;

  RoundImage(this.imageUrl, {this.borderRadius = 5, this.borderColor = Colors.transparent, this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              imageUrl,
              fit: boxFit,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.transparent,
            border: Border.all(color: borderColor, width: 1),
          ),
        ),
      ],
    );
  }
}
