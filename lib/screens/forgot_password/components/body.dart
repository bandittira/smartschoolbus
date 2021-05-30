import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/forgot_password/components/background.dart';
import 'package:smartschoolbus/home.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background_ForgotPassword(
        child: Stack(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 230),
                child: Container(
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              child: Text(
                "Enter your registered email below to receive password reset instruction",
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0)),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Image.asset(
                            "assets/images/Icon/Register_icons/email2.png"),
                      ),
                      hintText: "Email",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              width: 270,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: TextButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()))
                },
                child: (Text(
                  "Back to login",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                )),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
