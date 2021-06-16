import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/student_list/components/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  _updateboarding() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .update({"boarding": "1"});
    print("success");
  }

  _updateboarding2() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .update({"boarding": "0"});
  }

  _updatearr() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .update({"arr_des": "1"});
    print("success");
  }

  _updatearr2() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .update({"arr_des": "0"});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("user")
              .doc(auth.currentUser.email)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return bgstList(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue.shade50),
                          height: 180,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "Pawinee Srisook",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.pin_drop_rounded),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Chaeng Wattana",
                                          style: TextStyle(color: Colors.blue),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              if (snapshot.data['boarding'] ==
                                                  "1") {
                                                _updateboarding2();
                                              } else if (snapshot
                                                      .data['boarding'] ==
                                                  "0") {
                                                _updateboarding();
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade800)),
                                              width: 70,
                                              height: 30,
                                              child: Text(
                                                "ขึ้นรถแล้ว",
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              if (snapshot.data['arr_des'] ==
                                                  "1") {
                                                _updatearr2();
                                              } else if (snapshot
                                                      .data['arr_des'] ==
                                                  "0") {
                                                _updatearr();
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade800)),
                                              width: 80,
                                              height: 30,
                                              child: Text(
                                                "ถึงที่หมายแล้ว",
                                                style: TextStyle(fontSize: 11),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        TextButton(
                                            onPressed: () {},
                                            child: Container(
                                              padding: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade800)),
                                              width: 70,
                                              height: 30,
                                              child: Text(
                                                "กำลังจะถึง",
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
