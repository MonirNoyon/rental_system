import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rental_system/screen/dashboard/item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<String> _choices;
  late List<String> _choicesType;
  late int _choiceIndex;
  int selectedPage = 0;
  dynamic choose = "Buy";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choiceIndex = 0;
    _choices = ["Rentals", "Sales", "Buy"];
    _choicesType = ["Flat", "Apartment", "Room", "Market"];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Hey Monir",
          style: TextStyle(color: Colors.black54),
        ),
        leading: Container(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search here",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          )),
                          builder: (BuildContext context) {
                            return buildSheet();
                          });
                    },
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: size.height * 0.1,
              child: ListView.builder(
                itemCount: _choices.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemExtent: 150,
                padding: EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ChoiceChip(
                      label: Container(
                          height: 40,
                          child: Center(child: Text(_choices[index]))),
                      selected: _choiceIndex == index,
                      selectedColor: Color.fromRGBO(86, 60, 221, 97),
                      backgroundColor: Colors.black26,
                      shape: StadiumBorder(side: BorderSide()),
                      onSelected: (bool selected) {
                        setState(() {
                          _choiceIndex = selected ? index : 0;
                        });
                      },
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            Item(),
            Item(),
            Item(),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() => StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "I am looking to...",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          dropdownColor: Colors.white,
                          value: choose,
                          onChanged: (dynamic newValue) {
                            stateSetter(() => choose = newValue);
                          },
                          items: _choices.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: 2.8,
                    child: Text(
                      "Property type ",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                    itemCount: _choicesType.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemExtent: 150,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: ChoiceChip(
                          label: Container(
                              height: 40,
                              child: Center(child: Text(_choicesType[index]))),
                          selected: _choiceIndex == index,
                          selectedColor: Color.fromRGBO(86, 60, 221, 97),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onSelected: (bool selected) {
                            stateSetter(() {
                              _choiceIndex = selected ? index : 0;
                            });
                          },
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: 2.8,
                    child: Text(
                      "Number of Rooms ",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bedroom",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bathrooms",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Parking Area",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: 2.8,
                    child: Text(
                      "Price Range ",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    )),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * 0.9,
                  lineHeight: 14.0,
                  percent: 0.5,
                  backgroundColor: Colors.grey,
                  progressColor: Color.fromRGBO(86, 60, 221, 97),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0 \u09F3",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      "60000 \u09F3",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(86, 60, 221, 97),
                      borderRadius: BorderRadius.circular(40)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      customBorder: StadiumBorder(),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
}
