import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool favourite = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                ),
                child: Image.network("https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939__340.jpg",
                fit: BoxFit.cover,),
              ),
              Positioned(
                right: 5,
                  top: 10,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        favourite = !favourite;
                      });
                      print(favourite);
                    },
                    child: favourite == false ? Icon(
                    Ionicons.ios_heart_empty,
                    color: Colors.redAccent.withOpacity(.9),
                    size: 30,
                  ):Icon(
                      Ionicons.ios_heart,
                      color: Colors.redAccent.withOpacity(.9),
                      size: 30,
                    ),
                  )
              )
            ],
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/item_details");
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Robert house",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),),
                      Text("New york city, Usa",style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14
                      ),),
                      Row(
                          children: [
                            Icon(FontAwesome.bed,color: Color.fromRGBO(86, 60, 221, 97)),
                            Text("   5  "),
                            Icon(FontAwesome.bath,color: Color.fromRGBO(86, 60, 221, 97)),
                            Text("    3  "),
                            Icon(FontAwesome.car,color: Color.fromRGBO(86, 60, 221, 97)),
                            Text("    2  ")
                          ],
                        ),
                    ],
                  ),
                  Text("\u09f3 4800",style: TextStyle(
                    color: Color.fromRGBO(86, 60, 221, 97),
                    fontSize: 20,
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
