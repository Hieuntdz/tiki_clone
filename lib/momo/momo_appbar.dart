import 'package:flutter/material.dart';

class MomoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      title: Container(
        color: Colors.yellow,
      ),
    );
  }
}
