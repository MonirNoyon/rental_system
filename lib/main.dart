import 'package:flutter/material.dart';
import 'package:rental_system/home/sign_in.dart';
import 'package:rental_system/home/sign_up.dart';
import 'package:rental_system/home/splash_page.dart';
import 'package:rental_system/screen/dashboard/dashboard.dart';
import 'package:rental_system/screen/dashboard/home.dart';
import 'package:rental_system/screen/dashboard/item_details.dart';

void main() {
  runApp(HomePage());
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        '/sign_in':(_) => Signin(),
        '/sign_up':(_) => Signup(),
        '/dashboard_home':(_) => DashboardHome(),
        '/item_details':(_) => ItemDetails(),
      },
    );
  }
}

