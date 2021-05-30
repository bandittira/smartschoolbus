import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smartschoolbus/Bottom_nav.dart';
import 'package:smartschoolbus/screens/forgot_password/Forgot_password.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';
import 'package:smartschoolbus/screens/sign_in/components/background.dart';

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

  CollectionReference _information =
      FirebaseFirestore.instance.collection('information');

  final formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Background_signin(
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200.0, left: 0),
                  child: Container(
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    width: 350,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator([
                        EmailValidator(errorText: "Enter email only"),
                        RequiredValidator(errorText: "Please enter an email"),
                      ]),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image.asset(
                              "assets/images/Icon/Register_icons/id-card2.png"),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                        hintText: ("Email"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 0,
                  ),
                  child: Container(
                    width: 350,
                    child: TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                        suffix: GestureDetector(
                          onTap: _toggle,
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(_obscureText ? "Show" : "Hide"),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image.asset(
                              "assets/images/Icon/Register_icons/lock2.png"),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: ("Password?"),
                      ),
                      onSaved: (val) => password = val,
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Text(
                    "Or login using social media",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(0.0),
                          width: 55,
                          height: 55,
                          child: TextButton(
                            onPressed: () {},
                            child: Image.asset(
                                "assets/images/Icon/Register_icons/facebook.png"),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        child: TextButton(
                          onPressed: () {},
                          child: Image.asset(
                              "assets/images/Icon/Register_icons/google.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.lightBlue),
                  child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        dynamic userCredential = await _auth
                            .signInWithEmailAndPasword(email, password)
                            .then((value) => Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BottomNav();
                                })));
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      ),
                    },
                    child: TextButton(
                      onPressed: () async {
                        dynamic result = await _auth.signInAnon();
                        if (result == null) {
                          print('error signing in');
                        } else {
                          print('signed in');
                          print(result.uid);
                        }
                      },
                      child: Text("Forgot password",
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 15)),
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () async {
                //     await _auth.signOut();
                //   },
                //   child: Text("Sign out",
                //       style: TextStyle(color: Colors.grey.shade700),
                //       textAlign: TextAlign.center),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
