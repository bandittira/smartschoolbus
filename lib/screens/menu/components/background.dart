import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MenuPageBackground extends StatelessWidget {
  final Widget child;
  const MenuPageBackground({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(color: const Color(0xFFEDEEFF)),
        child: Stack(
          children: <Widget>[child],
        ),
      ),
    );
  }
}
