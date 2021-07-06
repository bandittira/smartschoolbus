import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartschoolbus/home.dart';
import 'package:smartschoolbus/screens/mainPage/components/background.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';
import 'card.dart';
import 'package:photo_view/photo_view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(auth.currentUser.email)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          String boarding = snapshot.data['boarding'];
          String arrdes = snapshot.data['arr_des'];
          test() {
            if (boarding == "1") {
              return CardStatus("Boarding to Destination",
                  Colors.yellow.shade300, Colors.yellow.shade100);
            } else {
              return CardStatus("Waiting for student", Colors.pink.shade300,
                  Colors.pink.shade100);
            }
          }

          test2() {
            if (arrdes == "1") {
              return CardStatus("Arriving to destination",
                  Colors.green.shade300, Colors.green.shade100);
            } else {
              return Container();
            }
          }

          return BackgroundMainPage(
            child: BackgroundMainPage(
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
                          width: 340,
                          height: 230,
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(7.0),
                                  width: 220,
                                  height: 170,
                                  child: PhotoView(
                                    imageProvider: AssetImage(
                                        "assets/images/Main/test2.png"),
                                  )),
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
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Text(
                                                "Zoom",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        Colors.grey.shade800),
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
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      child: Container(
                                          margin: EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: [
                                              TextButton(
                                                onPressed: () async {
                                                  await _auth.signOut().then(
                                                      (value) =>
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return HomePage();
                                                          })));
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Capture",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors
                                                              .grey.shade800),
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
                  Padding(
                    padding: EdgeInsets.only(top: 390, left: 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            "Status",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        test(),
                        SizedBox(
                          height: 20,
                        ),
                        test2()
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
