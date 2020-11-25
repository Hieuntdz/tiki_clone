import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                titleSpacing: 0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(0),
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                expandedHeight: 200,
                backgroundColor: Colors.red,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: 300,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 300,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 300,
                    color: Colors.grey,
                  ),
                ]),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
