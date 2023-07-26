import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rangoli/constants.dart';
import 'package:flutter/material.dart';
import 'edit_namkeen.dart';
import 'package:rangoli/screens/order/components/price_container.dart';

List<int> categorytotal = [0, 0, 0, 0, 0];
int grandTotal2 = 0;
List<DataRow> rs5namkeen = [];

bool bottomflex = false;

class EditCreateOrder extends StatefulWidget {
  final orderid;
  EditCreateOrder({required this.orderid});
  final rs5list = knamkeen;

  @override
  EditCreateOrderState createState() => EditCreateOrderState();
}

class EditCreateOrderState extends State<EditCreateOrder>
    with SingleTickerProviderStateMixin {
  late final orderdetails;
  bool isloading = true;
  void callback(int newtotal) {
    setState(() {
      categorytotal[0] = newtotal;
    });
    getTotal();
  }

  void newstate() {
    setState(() {});
  }

  void callback1(int newtotal) {
    setState(() {
      categorytotal[1] = newtotal;
    });
    getTotal();
  }

  void callback2(int newtotal) {
    setState(() {
      categorytotal[2] = newtotal;
    });
    getTotal();
  }

  void callback3(int newtotal) {
    setState(() {
      categorytotal[3] = newtotal;
    });
    getTotal();
  }

  void callback4(int newtotal) {
    setState(() {
      categorytotal[4] = newtotal;
    });
    getTotal();
  }

  void callback5(int newtotal) {
    setState(() {
      categorytotal[5] = newtotal;
    });
    getTotal();
  }

  void getTotal() {
    int tempTotal = 0;
    for (int i = 0; i < 5; i++) {
      tempTotal += categorytotal[i];
    }
    setState(() {
      grandTotal2 = tempTotal;
    });
  }

  Future<void> getdata() async {
    final _auth = FirebaseAuth.instance;
    User user;
    final _firestore = FirebaseFirestore.instance;
    user = _auth.currentUser!;
    orderdetails = await _firestore
        .collection('${user.displayName} ${user.uid}')
        .doc(widget.orderid)
        .get();

    setState(() {
      isloading = false;
    });
    log(orderdetails.data()!['0'].toString());
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getdata();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenBottom = MediaQuery.of(context).viewInsets.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    final ScrollController _scrollController = ScrollController(
      initialScrollOffset: 0,
    );
    final PageController _pagecontroller = PageController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Theme(
          data: ThemeData.light().copyWith(dividerColor: Colors.black),
          child: isloading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Container(
                        height: screenHeight / 8.5,
                        child: EditBottomPrice(
                          context1: context,
                          total: grandTotal2,
                          orderid: widget.orderid,
                        )),
                    SingleChildScrollView(
                      // physics: RangeMaintainingScrollPhysics(),
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                _pagecontroller.animateToPage(0,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.decelerate);
                                _scrollController.animateTo(0,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.decelerate);
                              },
                              child: Container(
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '₹5',
                                      style: TextStyle(
                                          fontSize: screenHeight / 30),
                                    ),
                                    Text('Namkeen'),
                                    Text(categorytotal[0] != null
                                        ? '${categorytotal[0]}'
                                        : '0')
                                  ],
                                )),
                                height: screenHeight / 8,
                                width: screenWidth / 5,
                              ),
                            ),
                            SizedBox(child: kcreateorderVerticalDivider),
                            PriceContainer(
                              pageno: 1,
                              price: '₹5',
                              category: 'Waffers',
                              total: categorytotal[1],
                              pagecontroller: _pagecontroller,
                              scrollcontroller: _scrollController,
                              statecallback: newstate,
                            ),
                            SizedBox(child: kcreateorderVerticalDivider),
                            PriceContainer(
                                pageno: 2,
                                price: '₹5',
                                category: 'Krackers',
                                total: categorytotal[2],
                                pagecontroller: _pagecontroller,
                                scrollcontroller: _scrollController,
                                statecallback: newstate),
                            SizedBox(child: kcreateorderVerticalDivider),
                            PriceContainer(
                                pageno: 3,
                                price: '₹10',
                                category: 'Namkeen',
                                total: categorytotal[3],
                                pagecontroller: _pagecontroller,
                                scrollcontroller: _scrollController,
                                statecallback: newstate),
                            SizedBox(child: kcreateorderVerticalDivider),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                _pagecontroller.animateToPage(4,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.decelerate);
                                _scrollController.animateTo(screenWidth / 10,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.decelerate);
                                print(_scrollController.positions);
                              },
                              child: Container(
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '400',
                                      style: TextStyle(
                                          fontSize: screenHeight / 30),
                                    ),
                                    Text('Namkeen'),
                                    Text(categorytotal[4] != null
                                        ? '${categorytotal[4]}'
                                        : '0')
                                  ],
                                )),
                                height: screenHeight / 8,
                                width: screenWidth / 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        key: PageStorageKey<String>('Rs5Namkeen'),
                        controller: _pagecontroller,
                        children: [
                          ListView(
                            // dragStartBehavior: DragStartBehavior.down,
                            children: [
                              EditCreate5NamkeenRow(
                                callback1: callback,
                                category: 0,
                                order: orderdetails,
                              ),
                            ],
                          ),
                          ListView(
                            // dragStartBehavior: DragStartBehavior.down,
                            children: [
                              EditCreate5NamkeenRow(
                                callback1: callback1,
                                category: 1,
                                order: orderdetails,
                              ),
                            ],
                          ),
                          ListView(
                            // dragStartBehavior: DragStartBehavior.down,
                            children: [
                              EditCreate5NamkeenRow(
                                callback1: callback2,
                                category: 2,
                                order: orderdetails,
                              ),
                            ],
                          ),
                          ListView(
                            // dragStartBehavior: DragStartBehavior.down,
                            children: [
                              EditCreate5NamkeenRow(
                                callback1: callback3,
                                category: 3,
                                order: orderdetails,
                              ),
                            ],
                          ),
                          ListView(
                            // dragStartBehavior: DragStartBehavior.down,
                            children: [
                              EditCreate5NamkeenRow(
                                callback1: callback4,
                                category: 4,
                                order: orderdetails,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
