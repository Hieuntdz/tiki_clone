import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiki_clone/momo/momo_main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blueAccent, //or set color with: Color(0xFF0000FF)
  ));
  runApp(MomoApp());
}

class MomoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MomoMainScreen(),
    );
  }
}
