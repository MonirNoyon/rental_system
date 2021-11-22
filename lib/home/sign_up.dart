import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
   Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                top: 42,
                  left: 10,
                  child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                  ))
              ),
              Positioned(
                top: 300,
                child: Container(
                  height: size.height * 0.7,
                  width: size.width,
                  padding: const EdgeInsets.only(bottom: 25),
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
                              "Create your account",
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
                              prefixIcon: Icon(Icons.person),
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.black54)),
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
                              prefixIcon: Icon(Icons.phone_android),
                              hintText: "Phone number",
                              hintStyle: TextStyle(color: Colors.black54)),
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
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                              hintText: "Password",
                              hintStyle:
                              TextStyle(color: Colors.black54)),
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
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                              hintText: "Confirmed password",
                              hintStyle:
                              TextStyle(color: Colors.black54)),
                        ),
                      ),
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
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 50,
                              width: size.width * 0.7,
                              child: const Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        ),
                      ),
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
