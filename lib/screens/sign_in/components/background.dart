import 'package:flutter/material.dart';
import 'package:smartschoolbus/home.dart';

class Background_signin extends StatelessWidget {
  final Widget child;
  const Background_signin({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/Login/SignIn_top.png"),
          ),
          Positioned(
            top: 53,
            right: -30,
            child: Image.asset("assets/images/Login/van.png"),
          ),
          Positioned(
            top: 80,
            left: 30,
            child: TextButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
              },
              child: Image.asset("assets/images/Icon/Register_icons/next2.png"),
            ),
          ),
          Positioned(
            bottom: -40,
            left: -50,
            child: Image.asset("assets/images/Login/SignIn_bottom2.png"),
          ),
          child,
        ],
      ),
    );
  }
}
