import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/sign_in/Sign_in.dart';
import 'package:smartschoolbus/screens/register/Register.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ------ Van logo image
              Container(
                padding: EdgeInsets.only(top: 50.0),
                alignment: Alignment.center,
                child: Column(
                  children: [Image.asset("assets/images/bg/Van.png")],
                ),
              ),

              // ------- TEXT ------
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Smart school bus",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // ------- TEXT ------
              Container(
                width: 320,
                child: Column(
                  children: [
                    Text(
                      "Is a project that creates for parents \nwho want to let their child boards the school bus for more safely and comfortable.",
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.5, color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // ---------- Button -------------
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue),
                width: 280,
                height: 50,
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccount()))
                  },
                  child: Text(
                    "Create account",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // -------- Text --------------
              Container(
                child: Text(
                  "already have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.lightBlue)),
                width: 180,
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    ),
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              // ------------ Drop down button ------------
              Container(
                child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "EN",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child:
                          Text("TH", style: TextStyle(color: Colors.lightBlue)),
                      value: 2,
                    )
                  ],
                  onChanged: (value) {},
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: Text(
                  "By signing up for a Smart school bus account you agree to our Privacy Policy and Terms of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
