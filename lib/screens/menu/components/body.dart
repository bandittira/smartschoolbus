import 'package:flutter/material.dart';
import 'package:smartschoolbus/home.dart';
import 'package:smartschoolbus/screens/mainPage/mainPage.dart';
import 'package:smartschoolbus/screens/menu/components/background.dart';
import 'package:smartschoolbus/screens/personal_profile/personal_profile.dart';
import 'package:smartschoolbus/screens/profile/profile.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MenuPageBackground(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Image.asset("assets/images/car_inf/women.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Jirada Paolo",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalProfile()),
                ),
              },
              child: Text("View my profile"),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalProfile()),
                        ),
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink.shade50),
                            child: Icon(
                              Icons.account_circle,
                              size: 30,
                              color: Colors.pink.shade200,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalProfile()),
                              ),
                            },
                            child: Icon(Icons.navigate_next_rounded),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        ),
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green.shade50),
                            child: Icon(
                              Icons.directions_car_sharp,
                              size: 30,
                              color: Colors.green.shade200,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Car information",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              ),
                            },
                            child: Icon(Icons.navigate_next_rounded),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        ),
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow.shade100),
                            child: Icon(
                              Icons.image_search_sharp,
                              size: 30,
                              color: Colors.yellow.shade700,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Log image",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          TextButton(
                              onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()),
                                    ),
                                  },
                              child: Icon(Icons.navigate_next_rounded))
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50),
                            child: Icon(
                              Icons.menu_book_rounded,
                              size: 30,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Guide book",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey.shade700),
                          ),
                          SizedBox(
                            width: 112,
                          ),
                          TextButton(
                            onPressed: () => {},
                            child: Icon(Icons.navigate_next_rounded),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await _auth.signOut().then((value) =>
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            })));
                      },
                      child: Text("Sign out",
                          style: TextStyle(color: Colors.grey.shade700),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
//     return MenuPageBackground(
//       child: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 3,
//                           blurRadius: 7,
//                           offset: Offset(0, 3))
//                     ]),
//                 child: Image.asset("assets/images/car_inf/women copy"),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
  }
}
