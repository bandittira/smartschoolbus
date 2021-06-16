import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/log_file/components/background.dart';
import 'package:timelines/timelines.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BackgroundLog(
      child: Padding(
        padding: EdgeInsets.only(top: 300),
        child: Container(
          height: 1000,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("7:30 AM"),
                      SizedBox(
                        height: 20,
                      ),
                      ContainerIndicator(
                        child: Container(
                          width: 2.0,
                          height: 120.0,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurple),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("7:30 AM"),
                      SizedBox(
                        height: 20,
                      ),
                      ContainerIndicator(
                        child: Container(
                          width: 2.0,
                          height: 120.0,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurple),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
