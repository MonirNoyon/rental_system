import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(expandedHeight: size.height * 0.5),
            ),
            SliverList(
                delegate:
                    SliverChildBuilderDelegate((context, index) => ListTile(
                          title: Text("index : $index"),
                        ))),
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverDelegate({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("offset: $shrinkOffset");
    print("expand: $expandedHeight");
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity((1 - shrinkOffset / expandedHeight)),
                  BlendMode.dstATop),
              image: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939__340.jpg',
              ),
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12
                  .withOpacity(0.5*(1 - shrinkOffset / expandedHeight)),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: shrinkOffset == 0.0
                      ? Colors.white
                          .withOpacity((1-shrinkOffset / expandedHeight))
                      : Colors.black54
                          .withOpacity((shrinkOffset / expandedHeight)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black12
                  .withOpacity(0.5*(1 - shrinkOffset / expandedHeight)),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Ionicons.ios_heart_empty,
                  color: shrinkOffset == 0.0
                      ? Colors.redAccent
                          .withOpacity((1-shrinkOffset / expandedHeight))
                      : Colors.black54
                          .withOpacity((shrinkOffset / expandedHeight)),
                ),
              ),
            )),
        Positioned(
          left: 20,
          top: expandedHeight / 1.25 - shrinkOffset,
          right: 20,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 5,
              child: SizedBox(
                height: expandedHeight / 3,
                width: MediaQuery.of(context).size.width*0.6,
                child: Column(
                  children: [
                    Text("Hello")
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
