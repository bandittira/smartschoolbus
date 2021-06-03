import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/profile/components/background.dart';
import 'package:smartschoolbus/screens/profile/components/information.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Car_Information carInformation = Car_Information();
  final auth = FirebaseAuth.instance;

  String carId = "";
  _retreieveDataprofile() async {
    FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .snapshots()
        .listen((DocumentSnapshot doc) async {
      Map<String, dynamic> document = doc.data();
      setState(() {
        carId = document['carId'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _retreieveDataprofile();
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("car_inf")
            .doc(carId)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return BackgroundProfile(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 130,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.pink.shade100,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ]),
                    child: Image.asset("assets/images/car_inf/boy.png"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Driver name",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        (snapshot.data['driver_name']),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Car ID",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        (snapshot.data['carId']),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Phone number",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        (snapshot.data['driverPhonenum']),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.pink.shade100,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    "Assistant",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 5),
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                            "assets/images/car_inf/more copy.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 20, top: 10),
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            color: Colors.white),
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: Image.asset(
                                              "assets/images/car_inf/women.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          (snapshot.data['astName']),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Teacher",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          (snapshot.data['astPhonenum']),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
