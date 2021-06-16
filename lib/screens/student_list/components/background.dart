import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class bgstList extends StatelessWidget {
  final Widget child;
  bgstList({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: -180,
              top: -100,
              child: Image.asset("assets/images/bg/1.png"),
            ),
            Positioned(
                bottom: -100,
                right: -50,
                child: Image.asset("assets/images/bg/register_bottom.png")),
            Container(
              height: 70,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () => {
                      {Navigator.pop(context)}
                    },
                    child: Image.asset(
                        "assets/images/Icon/Register_icons/next2.png"),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "Student list",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
