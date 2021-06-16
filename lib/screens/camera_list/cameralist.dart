import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/camera_list/components/body.dart';

class cameraList extends StatefulWidget {
  @override
  _cameraListState createState() => _cameraListState();
}

class _cameraListState extends State<cameraList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
