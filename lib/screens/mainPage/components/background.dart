import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BackgroundMainPage extends StatelessWidget {
  final Widget child;
  BackgroundMainPage({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(' E  d').format(now);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            left: -100,
            top: -230,
            child: Image.asset("assets/images/Main/main_top.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 35),
            child: Row(
              children: [
                SizedBox(width: 20),
                Container(
                  child: Text("Today's $formattedDate",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 80,
                ),
                Container(
                  width: 55,
                  height: 55,
                  child: TextButton(
                    onPressed: () {},
                    child: Stack(
                      children: [
                        Image.asset("assets/images/Main/notification.png"),
                        Positioned(
                            right: 6,
                            child: Text(
                              "3",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
