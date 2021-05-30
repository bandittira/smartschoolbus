import 'package:flutter/material.dart';
import 'package:smartschoolbus/home.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({
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
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/bg/register_top.png"),
            ),
            Positioned(
              width: 200,
              top: 10,
              right: 50,
              child: Image.asset(
                  "assets/images/Icon/Register_icons/electric-vehicle.png"),
            ),
            Positioned(
                top: 60,
                left: 20,
                child: Container(
                  child: TextButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()))
                          },
                      child: Image.asset(
                          "assets/images/Icon/Register_icons/next2.png")),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  child: Image.asset("assets/images/bg/register_bottom.png"),
                )),
            child,
          ],
        ),
      ),
    );
  }
}
