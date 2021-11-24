import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signin extends StatefulWidget {
   Signin({Key? key}) : super(key: key);


  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: size.height * 0.55,
                child: Image.network(
                  "https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 330,
                child: Container(
                  height: size.height * 0.66,
                  width: size.width,
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(90))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Column(
                          children: const [
                            Text(
                              "Welcome back",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 25),
                            ),
                            Text(
                              "Login to your account",
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: size.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(196, 196, 196, 100),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: "Enter email",
                              hintStyle: TextStyle(color: Colors.black54)),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: size.width * 0.8,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(196, 196, 196, 100),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.vpn_key_rounded),
                                    hintText: "Enter password",
                                    hintStyle:
                                        TextStyle(color: Colors.black54)),
                              ),
                            ),
                            Container(
                              width: size.width * 0.8,
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                "Forgot password",
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: const Color.fromRGBO(79, 186, 209, 80)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  customBorder:const StadiumBorder(),
                                  splashColor: Colors.white54,
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/dashboard_home");
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    width: size.width * 0.7,
                                    child: const Center(
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width*0.7,
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.email_outlined),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.email_outlined),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.email_outlined),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                     RichText(
                         text: TextSpan(
                           children: [
                             const TextSpan(text: "Don't have an account? ",style: TextStyle(
                               color: Colors.black54
                             )),
                             TextSpan(
                                 text: "Sign up",
                                 recognizer: TapGestureRecognizer()..onTap=(){
                                   Navigator.of(context).pushNamed("/sign_up");
                                 },
                                 style: const TextStyle(
                                     color:  Color.fromRGBO(79, 186, 209, 80),
                               fontSize: 16,
                               fontWeight: FontWeight.w600
                             )
                             ),
                           ]
                         )
                     )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
