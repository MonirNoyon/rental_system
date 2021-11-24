import 'package:flutter/material.dart';
import 'package:rental_system/screen/account/account.dart';
import 'package:rental_system/screen/chat/chat.dart';
import 'package:rental_system/screen/dashboard/dashboard.dart';
import 'package:rental_system/screen/favourite/favourite.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int selectedPage = 0;
  List _pages = [
    Dashboard(),
    Chat(),
    Favourite(),
    Account(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        selectedItemColor: Color.fromRGBO(86, 60, 221, 100),
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(
            color: Colors.black54
        ),
      ),
    );
  }
}
