import 'package:flutter/material.dart';

class BackgroundPersonalProfile extends StatelessWidget {
  final Widget child;
  const BackgroundPersonalProfile({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                //color: Colors.green,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Image.asset(
                            "assets/images/Icon/Register_icons/next.png"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        "Profile",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3))
                            ]),
                        width: 65,
                        height: 37,
                        child: TextButton(
                          onPressed: () => {},
                          child: Column(
                            children: [
                              Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.pink.shade300),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
