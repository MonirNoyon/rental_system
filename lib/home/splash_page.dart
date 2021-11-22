import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/splash.png",fit: BoxFit.cover,),
          Container(
            child: Column(
              children: const [
                Text(
                  "Ready to move ?",
                  style: TextStyle(
                      fontSize: 26,
                      letterSpacing: 1.0,
                      height: 3,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Find your dream home. The most\naccurate home search",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.2,
                      color: Colors.black38,
                     ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color.fromRGBO(79, 186, 209, 80)
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: StadiumBorder(),
                splashColor: Colors.white54,
                onTap: (){
                  Navigator.of(context).pushNamed("/sign_in");
                },
                child: Container(
                  height: 50,
                  width: size.width*0.6,

                  child: const Center(child: Text("Get Started",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
