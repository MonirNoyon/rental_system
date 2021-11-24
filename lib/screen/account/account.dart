import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          child: ClipRRect(
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
            ),
            child: Center(
              child: ListView(
                children: [
                  Container(
                    height: size.height/3.8,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueGrey,
                          Colors.blue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person,size: 45,),
                          ),
                          Text("Monir Hossain"),
                          Text("01993422911"),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title:const Text("Update profile"),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Update Password"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("My Offer"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Add Post"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
