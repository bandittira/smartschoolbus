import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/camera_list/components/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return bgCameraList(
      child: Text("Hello"),
    );
  }
}
