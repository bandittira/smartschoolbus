import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/personal_profile/components/information.dart';
import 'package:smartschoolbus/screens/register/components/background.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final loginkey = GlobalKey<ScaffoldState>();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  String username = '';
  String email = '';
  String password = '';
  String phonenumber = '';
  String error = '';

  final auth = FirebaseAuth.instance;
  Information myInformation = Information();

  createRecord() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(myInformation.email)
        .set({
      "pname": myInformation.pname,
      "email": myInformation.email,
      "phonenum": myInformation.phonenum,
      "chname": "-",
      "school": "-",
      "userType": "0",
      "arr_des": "0",
      "boarding": "0",
      "amt": "0",
      "carId": "-"
    });
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text("Create account success"));
    final snackBar2 = SnackBar(content: Text("Error please try again"));
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return BackGround(
              key: loginkey,
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 160, left: 0),
                          child: Container(
                            child: Text(
                              "Create account",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 310,
                            height: 50,
                            child: TextFormField(
                              //validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => username = val);
                              },
                              onSaved: (String pname) {
                                myInformation.pname = pname;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.only(left: 0, bottom: 10),
                                    child: Image.asset(
                                        "assets/images/Icon/Register_icons/id-card2.png"),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: 'Enter name'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 310,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              onSaved: (String email) {
                                myInformation.email = email;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.only(left: 0, bottom: 10),
                                    child: Image.asset(
                                        "assets/images/Icon/Register_icons/email2.png"),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: 'Email'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 250,
                                height: 50,
                                child: TextFormField(
                                  validator: (val) => val.length < 6
                                      ? 'Enter a password 6+ chars long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, bottom: 10),
                                        child: Image.asset(
                                            "assets/images/Icon/Register_icons/lock2.png"),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        top: 15,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: 'Password'),
                                  onSaved: (val) => password = val,
                                  obscureText: _obscureText,
                                ),
                              ),
                              new TextButton(
                                  onPressed: _toggle,
                                  child:
                                      new Text(_obscureText ? "Show" : "Hide"))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 310,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an Phone number' : null,
                              onChanged: (val) {
                                setState(() => phonenumber = val);
                              },
                              onSaved: (String phonenum) {
                                myInformation.phonenum = phonenum;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.only(left: 0, bottom: 10),
                                    child: Image.asset(
                                        "assets/images/Icon/Register_icons/telephone2.png"),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: 'Phone number'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          child: Text("Or create account using social media"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(20.0),
                              width: 60,
                              height: 60,
                              child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  child: Image.asset(
                                      "assets/images/Icon/Register_icons/facebook.png"),
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Image.asset(
                                        "assets/images/Icon/Register_icons/google.png"),
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.lightBlue),
                          child: TextButton(
                            child: Text(
                              "Create",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                await createRecord();
                                _formKey.currentState.reset();

                                dynamic userCredential =
                                    await _auth.registerWithEmailAndPasword(
                                  email,
                                  password,
                                );
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar2);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
