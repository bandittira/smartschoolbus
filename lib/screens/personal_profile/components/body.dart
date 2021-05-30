import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smartschoolbus/screens/personal_profile/components/background.dart';
import 'package:smartschoolbus/screens/personal_profile/components/information.dart';

class Body extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  Information myInformation = Information();
  CollectionReference _informationCollection =
      FirebaseFirestore.instance.collection("Information");
  @override
  Widget build(BuildContext context) {
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
                child: Image.asset("assets/images/Personal Profile/woman.png"),
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
                  validator: RequiredValidator(errorText: "Enter parent name"),
                  onSaved: (String pname) {
                    myInformation.pname = pname;
                  },
                  decoration: InputDecoration(
                    hintText: "Mother",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
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
                  validator: RequiredValidator(errorText: "Enter child name"),
                  onSaved: (String chname) {
                    myInformation.chname = chname;
                  },
                  decoration: InputDecoration(
                    hintText: "Children name",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
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
                  validator: RequiredValidator(errorText: "Enter phone number"),
                  onSaved: (String phonenum) {
                    myInformation.phonenum = phonenum;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "0988301183",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                    prefixStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  "Assumption College",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      await _informationCollection.add({
                        "pname": myInformation.pname,
                        "chname": myInformation.chname,
                        "phonenum": myInformation.phonenum
                      });
                      formKey.currentState.reset();
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
  }
}
