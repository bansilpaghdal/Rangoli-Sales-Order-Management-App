import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rangoli/constants.dart';
import 'package:flutter/material.dart';
import 'edit_create_order_list.dart';
import 'edit_namkeen.dart';
import 'package:intl/intl.dart';

class ReviewEditedOrder extends StatefulWidget {
  final orderid;
  ReviewEditedOrder({required this.orderid});

  @override
  _ReviewEditedOrderState createState() => _ReviewEditedOrderState();
}

class _ReviewEditedOrderState extends State<ReviewEditedOrder>
    with SingleTickerProviderStateMixin {
  final _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  var now = DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now());
  var date, time;

  Map<String, dynamic> cloudMap = {};

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Order'),
      ),
      body: ListView(
        children: [
          categorytotal[0] == 0
              ? SizedBox(height: 0, width: 0)
              : HeaderRow(
                  amount: 5,
                  itemName: 'Namkeen',
                ),
          Column(
            children: ListBuilder(screenWidth: screenWidth, itemNumber: 0),
          ),
          categorytotal[1] == 0
              ? SizedBox(height: 0, width: 0)
              : HeaderRow(amount: 5, itemName: 'Wafer'),
          Column(
            children: ListBuilder(screenWidth: screenWidth, itemNumber: 1),
          ),
          categorytotal[2] == 0
              ? SizedBox(height: 0, width: 0)
              : HeaderRow(amount: 5, itemName: 'Krackers'),
          Column(
            children: ListBuilder(screenWidth: screenWidth, itemNumber: 2),
          ),
          categorytotal[3] == 0
              ? SizedBox(height: 0, width: 0)
              : HeaderRow(amount: 10, itemName: 'Namkeen'),
          Column(
            children: ListBuilder(screenWidth: screenWidth, itemNumber: 3),
          ),
          categorytotal[4] == 0
              ? SizedBox(height: 0, width: 0)
              : HeaderRow(amount: 400, itemName: 'Namkeen'),
          Column(
            children: ListBuilder(screenWidth: screenWidth, itemNumber: 4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: GestureDetector(
              onTap: () {
                var userId = user!.uid;
                cloudMap['Store Name'] = user!.displayName;
                date = DateFormat('d/MM/y').format(DateTime.now());
                time = DateFormat().add_jm().format(DateTime.now());
                cloudMap['Date'] = date;
                cloudMap['Time'] = time;
                cloudMap['DateTime'] = DateTime.now();
                cloudMap['Total'] = grandTotal2;

                for (int i = 0; i < 5; i++) {
                  List newList = [];

                  for (int j = 0; j < knamkeen[i].length; j++) {
                    Map newMap = {
                      'Number': j,
                      'Box': namkeenBox2[i][j],
                      'Patti': namkeenPatti2[i][j],
                      'Total': indiTotal2[i][j]
                    };
                    newList.add(newMap);
                  }
                  cloudMap['$i'] = newList;
                }
                print(cloudMap);
                _firestore
                    .collection('${user!.displayName} $userId')
                    .doc(widget.orderid)
                    .set(cloudMap);
              },
              child: Container(
                color: Colors.amberAccent,
                width: 50,
                height: 50,
                child: Center(child: Text('Confirm')),
              ),
            ),
          )
        ],
      ),
    );
  }
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
                    color: Colors.black87),
              ),
              Text(
                '$itemName',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
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

List<Widget> ListBuilder(
    {required double screenWidth, required int itemNumber}) {
  return List.generate(
    knamkeen[itemNumber].length,
    (int i) => indiTotal2[itemNumber][i] == 0
        ? SizedBox(
            height: 0,
            width: 0,
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth / 3,
                    child: Text(
                      '${knamkeen[itemNumber][i]}',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                      width: screenWidth / 5,
                      child: Text(
                        '${namkeenBox2[itemNumber][i]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )),
                  Container(
                      width: screenWidth / 5,
                      child: Text('${namkeenPatti2[itemNumber][i]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 22))),
                  Container(
                      width: screenWidth / 5,
                      child: Text('${indiTotal2[itemNumber][i]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22)))
                ],
              ),
              SizedBox(
                height: 25,
                child: Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 4,
                ),
              )
            ],
          ),
  );
}
