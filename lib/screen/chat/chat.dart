import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
   Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/blank_chat.png"),
            Text("No chat yet")
          ],
        ),
      ),
    );
  }
}
