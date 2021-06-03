import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartschoolbus/Bottom_nav.dart';
import 'package:smartschoolbus/home.dart';
import 'package:smartschoolbus/screens/mainPage/mainPage.dart';
import 'package:smartschoolbus/screens/sign_in/components/authenticate.dart';
import 'package:smartschoolbus/screens/sign_in/components/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Firebaseusertest>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return BottomNav();
    }
  }
}
