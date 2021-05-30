import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/mainPage/mainPage.dart';

class BackgroundProfile extends StatelessWidget {
  final Widget child;
  const BackgroundProfile({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
                top: -50,
                right: -60,
                child: Image.asset("assets/images/car_inf/SignIn_bottom.png")),
            Positioned(
                top: 100,
                left: -160,
                child: Image.asset("assets/images/Login/2.png")),
            Positioned(
              top: 50,
              left: 30,
              child: Container(
                height: 45,
                width: 45,
                child: TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child:
                      Image.asset("assets/images/Icon/Register_icons/next.png"),
                ),
              ),
            ),
            Positioned(
                top: 60,
                left: 130,
                child: Text(
                  "Car information",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            child,
          ],
        ),
      ),
    );
  }
}
