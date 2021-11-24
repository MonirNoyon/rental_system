import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_system/home/sign_in.dart';
import 'package:rental_system/screen/dashboard/home.dart';
import 'package:responsive_container/responsive_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveContainer(
        widthPercent: 100,
        heightPercent: 100,
        child: Container(
          color: Color(0xfff8f5f0),    // white color
          //color: Color(0xff1869d9),  // blue color
          child: Image.asset(
              'assets/images/city.gif'         // white gif
            //'assets/gif/city_blue.gif'  // blue gif
          ),
        ),
      ),
    );
  }
  Future navigateFromSplash () async {
    String isOnBoard = "97d8";
    String isLoggedIn = "false";
    if(isOnBoard ==null || isOnBoard == "0"){
      //Navigate to OnBoarding Screen.
      //LocalStorage.sharedInstance.setAuthStatus(key:Constants.isLoggedIn,value: "false");
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
    }else{
      if(isLoggedIn==null || isLoggedIn=="false"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signin()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> DashboardHome()));
      }
    }
  }
}
