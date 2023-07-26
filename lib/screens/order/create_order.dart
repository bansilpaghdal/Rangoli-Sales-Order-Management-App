import 'package:rangoli/constants.dart';

import 'package:rangoli/screens/order/rows/namkeen5row.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/screens/order/components/price_container.dart';

List<int> total = [0, 0, 0, 0, 0];
int? grandTotal;
int totalnetPatti = 0;
int currentTab = 0;

class CreateOrder extends StatefulWidget {
  final rs5list = knamkeen;

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

List<DataRow> rs5namkeen = [];

bool bottomflex = false;

class _CreateOrderState extends State<CreateOrder>
    with SingleTickerProviderStateMixin {
  bool togglecolor = true;
  DateTime currentBackPressTime = DateTime.now();
  final snackBar = SnackBar(
    content: Text('Press back again to leave'),
    duration: Duration(milliseconds: 1500),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    resetvalues();
  }

  void newstate() {
    setState(() {});
  }

  void callback(int newtotal) {
    setState(() {
      total[0] = newtotal;
    });
    getTotal();
  }

  void callback1(int newtotal) {
    setState(() {
      total[1] = newtotal;
    });
    getTotal();
  }

  void callback2(int newtotal) {
    setState(() {
      total[2] = newtotal;
    });
    getTotal();
  }

  void callback3(int newtotal) {
    setState(() {
      total[3] = newtotal;
    });
    getTotal();
  }

  void callback4(int newtotal) {
    setState(() {
      total[4] = newtotal;
    });
    getTotal();
  }

  void callback5(int newtotal) {
    setState(() {
      total[5] = newtotal;
    });
    getTotal();
  }

  void getTotal() {
    int tempTotal = 0;
    for (int i = 0; i < 5; i++) {
      tempTotal += total[i];
    }
    setState(() {
      grandTotal = tempTotal;
    });
  }

  @override
  void initState() {
    super.initState();
    currentTab = 0;
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
    final ScrollController listcontroller = ScrollController();
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (now.difference(currentBackPressTime) >
            Duration(milliseconds: 1500)) {
          currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          return Future.value(false);
        }
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        resetvalues();
        print('page  popped');
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Theme(
            data: ThemeData.light().copyWith(dividerColor: Colors.black),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.12),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: screenHeight / 3.4,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF6FFAA0), Color(0xFF00D194)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              color: Colors.transparent,
                              height: screenHeight / 8.8,
                              child: BottomPrice(
                                context1: context,
                                total: grandTotal,
                              )),
                          SingleChildScrollView(
                            // physics: RangeMaintainingScrollPhysics(),
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(child: kcreateorderVerticalDivider),
                                // GestureDetector(
                                //   behavior: HitTestBehavior.opaque,
                                //   onTap: () {
                                //     setState(() {
                                //       currentTab = 0;
                                //     });
                                //     _pagecontroller.animateToPage(0,
                                //         duration: Duration(milliseconds: 800),
                                //         curve: Curves.decelerate);
                                //     _scrollController.animateTo(0,
                                //         duration: Duration(milliseconds: 400),
                                //         curve: Curves.decelerate);
                                //   },
                                //   child: AnimatedContainer(
                                //     duration: Duration(milliseconds: 300),
                                //     color: currentTab == 0
                                //         ? Colors.amberAccent
                                //         : Colors.transparent,
                                //     child: Center(
                                //         child: Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         AutoSizeText(
                                //           '₹5',
                                //           maxLines: 1,
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: screenHeight / 30),
                                //         ),
                                //         AutoSizeText(
                                //           'Namkeen',
                                //           maxLines: 1,
                                //         ),
                                //         AutoSizeText(
                                //           total[0] != null
                                //               ? '${total[0]}'
                                //               : '0',
                                //           maxLines: 1,
                                //         )
                                //       ],
                                //     )),
                                //     height: screenHeight / 8,
                                //     width: screenWidth / 5,
                                //   ),
                                // ),
                                PriceContainer(
                                    pageno: 0,
                                    price: "₹5",
                                    category: "Namkeen",
                                    total: total[0],
                                    pagecontroller: _pagecontroller,
                                    scrollcontroller: _scrollController,
                                    statecallback: newstate),
                                const SizedBox(
                                  child: kcreateorderVerticalDivider,
                                  height:
                                      0, //we can use IntrinsicHeight if we want all of its childron to take up the height of the row
                                ),
                                PriceContainer(
                                    pageno: 1,
                                    price: '₹5',
                                    category: 'Waffers',
                                    total: total[1],
                                    pagecontroller: _pagecontroller,
                                    scrollcontroller: _scrollController,
                                    statecallback: newstate),
                                const SizedBox(
                                    child: kcreateorderVerticalDivider),
                                PriceContainer(
                                  pageno: 2,
                                  price: '₹5',
                                  category: 'Krackers',
                                  total: total[2],
                                  pagecontroller: _pagecontroller,
                                  scrollcontroller: _scrollController,
                                  statecallback: newstate,
                                ),
                                SizedBox(child: kcreateorderVerticalDivider),
                                PriceContainer(
                                    pageno: 3,
                                    price: '₹10',
                                    category: 'Namkeen',
                                    total: total[3],
                                    pagecontroller: _pagecontroller,
                                    scrollcontroller: _scrollController,
                                    statecallback: newstate),
                                SizedBox(child: kcreateorderVerticalDivider),
                                PriceContainer(
                                  pageno: 4,
                                  price: '400',
                                  category: 'Namkeen',
                                  total: total[4],
                                  pagecontroller: _pagecontroller,
                                  scrollcontroller: _scrollController,
                                  statecallback: newstate,
                                ),
                                SizedBox(child: kcreateorderVerticalDivider),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 25),
                                  child: AutoSizeText(
                                    'Total : ${grandTotal == null ? 0 : grandTotal}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'arima',
                                        fontWeight: FontWeight.bold),
                                    minFontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      onPageChanged: (int page) {
                        print(page);
                        setState(() {
                          currentTab = page;
                        });
                      },
                      // key: PageStorageKey<String>('Rs5Namkeen'),
                      controller: _pagecontroller,
                      children: [
                        ScrollConfiguration(
                          behavior: ScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: listcontroller,
                            // physics: ClampingScrollPhysics(),

                            key: PageStorageKey<String>('page1'),
                            // dragStartBehavior: DragStartBehavior.down,
                            child: Create5NamkeenRow(
                              callback1: callback,
                              category: 0,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          // dragStartBehavior: DragStartBehavior.down,
                          child: Create5NamkeenRow(
                            callback1: callback1,
                            category: 1,
                          ),
                        ),
                        SingleChildScrollView(
                          // dragStartBehavior: DragStartBehavior.down,
                          child: Create5NamkeenRow(
                            callback1: callback2,
                            category: 2,
                          ),
                        ),
                        SingleChildScrollView(
                          // dragStartBehavior: DragStartBehavior.down,
                          child: Create5NamkeenRow(
                            callback1: callback3,
                            category: 3,
                          ),
                        ),
                        SingleChildScrollView(
                          // dragStartBehavior: DragStartBehavior.down,
                          child: Create5NamkeenRow(
                            callback1: callback4,
                            category: 4,
                          ),
                        ),
                      ],
                    ),
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
