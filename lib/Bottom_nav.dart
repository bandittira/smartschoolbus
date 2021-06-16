import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartschoolbus/notification_service.dart';
import 'package:smartschoolbus/screens/camera_list/cameralist.dart';
import 'package:smartschoolbus/screens/mainPage/mainPage.dart';
import 'package:smartschoolbus/screens/menu/menu.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  PageController _pageController = PageController();
  List<Widget> _screens = [MainPage(), NotificationApp(), MenuPage()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {}

  // void _onItemTapped(int selectedIndex) {
  //   _pageController.jumpToPage(selectedIndex);
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call, size: 30), label: "Camera list"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded, size: 30), label: "Menu"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pink.shade300,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
    );
  }
}
