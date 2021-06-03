import 'package:flutter/material.dart';
import 'package:smartschoolbus/home.dart';
import 'package:smartschoolbus/screens/mainPage/components/background.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return BackgroundMainPage(
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 150,
                child: Container(
                  width: 350,
                  height: 220,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: 145,
                left: 35,
                child: Container(
                  width: 350,
                  height: 230,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7.0),
                        width: 220,
                        child: Image.asset("assets/images/Main/test1.png"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text("Camera"),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 90,
                              height: 33,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "Zoom",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade800),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 15,
                                        height: 15,
                                        child: Image.asset(
                                            "assets/images/Main/expand-screen.png"),
                                      )
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 90,
                              height: 33,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Container(
                                  margin: EdgeInsets.only(left: 0),
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          await _auth.signOut().then((value) =>
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return HomePage();
                                              })));
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Capture",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade800),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 15,
                                              height: 15,
                                              child: Image.asset(
                                                  "assets/images/Main/image-gallery.png"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "will update picture in 5:00",
                                style: TextStyle(fontSize: 8),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: 400,
                left: 50,
                child: Text(
                  "Status",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
