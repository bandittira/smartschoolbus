import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/sign_in/Sign_in.dart';

class Background_ForgotPassword extends StatelessWidget {
  final Widget child;
  const Background_ForgotPassword({
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
        children: [
          Positioned(
              top: -85,
              left: -80,
              child: Image.asset("assets/images/Forgot_password/1.png")),
          Positioned(
              top: 10,
              right: -50,
              child: Image.asset("assets/images/Forgot_password/2.png")),
          Positioned(
              bottom: -100,
              left: -70,
              child: Image.asset("assets/images/Forgot_password/3.png")),
          Positioned(
              top: 80,
              left: 30,
              child: TextButton(
                  onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()))
                      },
                  child: Image.asset(
                      "assets/images/Icon/Register_icons/next2.png"))),
          child,
        ],
      ),
    );
  }
}
