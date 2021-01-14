import 'package:flutter/material.dart';
import 'package:tiki_clone/momo/momo_appbar.dart';

class MomoMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MomoMainScreenState();
  }
}

class MomoMainScreenState extends State<MomoMainScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MomoAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 700,
              color: Colors.yellow,
            ),
            Container(
              height: 700,
              color: Colors.red,
            )
          ]),
        ),
      ],
    );
  }
}
