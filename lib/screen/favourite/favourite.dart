import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
   Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/blank_favourite.png"),
           const Text("Don't have favourite list")
          ],
        ),
      ),
    );
  }
}
