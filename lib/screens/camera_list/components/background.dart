import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class bgCameraList extends StatelessWidget {
  final Widget child;
  bgCameraList({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(' E').format(now);
    return SafeArea(
      child: Row(
        children: [
          Container(
            child: Text("Today's $formattedDate"),
          )
        ],
      ),
    );
  }
}
