import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/constants.dart';

List<List<int>> indiTotal1 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List<List<int>> namkeenBox1 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List<List<int>> namkeenPatti1 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
int grandBox1 = 0;
int grandPatti1 = 0;
List<int> total1 = [0, 0, 0, 0, 0];
int grandtotal1 = 0;

class ViewOrder2 extends StatefulWidget {
  final order;
  ViewOrder2({
    this.order,
  });

  @override
  _ViewOrder2State createState() => _ViewOrder2State();
}

class _ViewOrder2State extends State<ViewOrder2> {
  bool isloading = false;
  late final orderdetails;
  void getData() async {
    print('5');
    setState(() {
      isloading = true;
    });
    final _auth = FirebaseAuth.instance;
    User user;
    final _firestore = FirebaseFirestore.instance;
    user = _auth.currentUser!;
    final orderdetails = await _firestore
        .collection('${user.displayName} ${user.uid}')
        .doc(widget.order)
        .get();
    log(orderdetails.data()!['0'].toString());

    await _firestore
        .collection('${user.displayName} ${user.uid}')
        .orderBy('DateTime')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // var parseddatetime =
        //     DateTime.parse(doc['DateTime'].toDate().toString());
        // print(parseddatetime.day);
        // String time = doc['Time'];
        // print('$time');
        // int finaltotal = doc['Total'];
        // var day, month, year;
        // day = parseddatetime.day;
        // month = parseddatetime.month;
        // year = parseddatetime.year;
        // print(doc["DateTime"]);

        // final Appointment recurrenceAppointment2 = Appointment(
        //   notes: '${DateFormat('d MMMM\n').format(parseddatetime)} $time',
        //   isAllDay: true,
        //   startTime: DateTime(year, month, day, 8),
        //   endTime: DateTime(year, month, day, 8),
        //   subject: 'Total : $finaltotal',
        //   id: parseddatetime.toString(),
        //   color: Colors.purple,
        // );
        // tempappointment.add(recurrenceAppointment2);
        // log(doc.id);
        print(widget.order);
        if (widget.order == doc.id) {
          // setState(() {
          //   isLoading = false;
          // });

          for (int i = 0; i < 5; i++) {
            for (int j = 0; j < knamkeen[i].length; j++) {
              namkeenBox1[i][j] = doc['$i'][j]['Box'];

              namkeenPatti1[i][j] = doc['$i'][j]['Patti'];
              indiTotal1[i][j] = doc['$i'][j]['Total'];
              print(doc['$i'][j]['Total'].runtimeType);
              grandBox1 += namkeenBox1[i][j];
              grandPatti1 += namkeenPatti1[i][j];
              total1[i] += indiTotal1[i][j];
              print(total1[i]);

              print('$grandBox1');
              print('$grandPatti1');
            }
            grandtotal1 += total1[i];
          }

          setState(() {
            isloading = false;
          });
        }
      });
    });

    print(total1[1]);
    print(total1[2]);
    print(total1[3]);
    print(total1[4]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    indiTotal1 = [
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ]
    ];
    namkeenBox1 = [
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ]
    ];
    namkeenPatti1 = [
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ]
    ];
    grandBox1 = 0;
    grandPatti1 = 0;
    total1 = [0, 0, 0, 0, 0];
    grandtotal1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                total1[0] == 0
                    ? SizedBox(height: 0, width: 0)
                    : HeaderRow(
                        amount: 5,
                        itemName: 'Namkeen',
                      ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children:
                        ListBuilder(screenWidth: screenWidth, itemNumber: 0),
                  ),
                ),
                total1[1] == 0
                    ? SizedBox(height: 0, width: 0)
                    : HeaderRow(amount: 5, itemName: 'Waffer'),
                total1[1] == 0
                    ? SizedBox(height: 0, width: 0)
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: ListBuilder(
                              screenWidth: screenWidth, itemNumber: 1),
                        ),
                      ),
                total1[2] == 0
                    ? SizedBox(height: 0, width: 0)
                    : HeaderRow(amount: 5, itemName: 'Krackers'),
                total1[2] == 0
                    ? SizedBox(height: 0, width: 0)
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: ListBuilder(
                              screenWidth: screenWidth, itemNumber: 2),
                        ),
                      ),
                total1[3] == 0
                    ? SizedBox(height: 0, width: 0)
                    : HeaderRow(amount: 10, itemName: 'Namkeen'),
                total1[3] == 0
                    ? SizedBox(height: 0, width: 0)
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: ListBuilder(
                              screenWidth: screenWidth, itemNumber: 3),
                        ),
                      ),
                total1[4] == 0
                    ? SizedBox(height: 0, width: 0)
                    : HeaderRow(amount: 400, itemName: 'Namkeen'),
                total1[4] == 0
                    ? SizedBox(height: 0, width: 0)
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: ListBuilder(
                              screenWidth: screenWidth, itemNumber: 4),
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total :$grandtotal1',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'button'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
    );
  }
}

List<Widget> ListBuilder(
    {required double screenWidth, required int itemNumber}) {
  return List.generate(
    knamkeen[itemNumber].length,
    (int i) => indiTotal1[itemNumber][i] == 0
        ? const SizedBox(
            height: 0,
            width: 0,
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth / 3,
                    child: Text(
                      '${knamkeen[itemNumber][i]}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'arima',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                      width: screenWidth / 6,
                      child: Text(
                        '${namkeenBox1[itemNumber][i]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'arima',
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  Container(
                      width: screenWidth / 6,
                      child: Text('${namkeenPatti1[itemNumber][i]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'arima'))),
                  Container(
                      width: screenWidth / 5,
                      child: Text('${indiTotal1[itemNumber][i]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'arima')))
                ],
              ),
              SizedBox(
                height: 25,
                child: Divider(
                  color: Color.fromARGB(255, 112, 220, 171),
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                ),
              )
            ],
          ),
  );
}

class HeaderRow extends StatelessWidget {
  int amount;
  String itemName;
  HeaderRow({required this.amount, required this.itemName});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth / 3,
            child: Divider(
              indent: 15,
              endIndent: 5,
              color: Colors.black38,
              thickness: 3,
            ),
          ),
          Column(
            children: [
              Text(
                '₹$amount',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'button',
                    color: Colors.black87),
              ),
              Text(
                '$itemName',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'button',
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            width: screenWidth / 3,
            child: Divider(
              indent: 5,
              endIndent: 15,
              color: Colors.black38,
              thickness: 3,
            ),
          ),
        ],
      ),
    );
  }
}
