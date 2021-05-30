import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/mainPage/components/body.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(15),
      //       color: Colors.white,
      //       boxShadow: [
      //         BoxShadow(
      //             color: Colors.grey.withOpacity(0.2),
      //             spreadRadius: 2,
      //             blurRadius: 5,
      //             offset: Offset(0, 3))
      //       ]),
      //   padding: EdgeInsets.all(1.0),
      //   margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      //   height: 60,
      //   child: Container(
      //     padding: EdgeInsets.only(left: 30, right: 30),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         IconButton(
      //             icon: Image.asset(
      //                 "assets/images/Icon/Bottom Menus/home pink copy.png"),
      //             onPressed: () => {
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder: (context) => MainPage()))
      //                 }),
      //         IconButton(
      //             icon:
      //                 Image.asset("assets/images/Icon/Bottom Menus/user_g.png"),
      //             onPressed: () => {
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => PersonalProfile()))
      //                 }),
      //         IconButton(
      //             icon: Image.asset(
      //                 "assets/images/Icon/Bottom Menus/image-gallery_g.png"),
      //             onPressed: () => {}),
      //         IconButton(
      //             icon: Image.asset(
      //                 "assets/images/Icon/Bottom Menus/video-camera_g.png"),
      //             onPressed: () => {})
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
