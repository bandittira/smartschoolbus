import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smartschoolbus/screens/personal_profile/components/background.dart';
import 'package:smartschoolbus/screens/personal_profile/components/information.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  Information myInformation = Information();
  CollectionReference _informationCollection =
      FirebaseFirestore.instance.collection("Information");

  updateData() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .update({
      "pname": myInformation.pname,
      "chname": myInformation.chname,
      "phonenum": myInformation.phonenum,
    });
    print(myInformation.pname);
    print(myInformation.chname);
    print(myInformation.phonenum);
  }

  retreieveData() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser.email)
        .snapshots()
        .listen((DocumentSnapshot doc) async {
      Map<String, dynamic> document = doc.data();
      setState(() {
        myInformation.pname = document['pname'];
        myInformation.chname = document['chname'];
        myInformation.phonenum = document['phonenum'];
      });
    });
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
              return BackgroundPersonalProfile(
                  child: SingleChildScrollView(
                child: Container(
                  width: 300,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.pink.shade100),
                          child: Image.asset(
                              "assets/images/Personal Profile/woman.png"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Parent name",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please enter parent name"),
                            onChanged: (String pname) {
                              myInformation.pname = pname = pname;
                            },
                            decoration: InputDecoration(
                                hintText: snapshot.data['pname'],
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.edit)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Child name",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please enter children name"),
                            onChanged: (String chname) {
                              myInformation.chname = chname;
                            },
                            decoration: InputDecoration(
                                hintText: snapshot.data['chname'],
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.edit)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Telephone",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please enter phonenum"),
                            onChanged: (String phonenum) {
                              myInformation.phonenum = phonenum;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: snapshot.data['phonenum'],
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                prefixStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.edit)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            auth.currentUser.email,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade700,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "School",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data['school'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade700,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.pink.shade200),
                          child: TextButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                await retreieveData();
                                updateData();
                                formKey.currentState.reset();
                              }
                            },
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
            }));
  }
}
