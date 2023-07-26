import 'dart:async';
import 'dart:math';
import 'package:angles/angles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rangoli/constants.dart';
import 'package:rangoli/screens/order/components/create_order_database.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/screens/order/rows/namkeen5row.dart';
import 'package:rangoli/screens/order/create_order.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:rangoli/screens/order/components/data_connection.dart';
// import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'components/sliderbutton.dart';

class ReviewOrder extends StatefulWidget {
  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder>
    with SingleTickerProviderStateMixin {
  final _firestore = FirebaseFirestore.instance;

  late User user = FirebaseAuth.instance.currentUser!;
  bool progress = false;
  var isDataConnected = false; //checks if actually network available
  bool isNetorkConnected = false; //check if wifi or mobile data is enabled
  String demotext = 'a';
  var subscription, listener;
  var notification;
  var now = DateTime.now();
  var date, time;
  late AnimationController controller;
  late Animation<double> curve;
  Map<String, dynamic> cloudMap = {};

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    curve = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      DataConnectionChecker().checkInterval = Duration(milliseconds: 500);
      switch (status) {
        case DataConnectionStatus.connected:
          setState(() {
            // Future.delayed(Duration.zero, () {
            //   flushbar.dismiss(context);
            // });
            if (notification != null) {
              notification.dismiss();
            }
            isDataConnected = true;
          });
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          setState(() {
            notification = showSimpleNotification(
                Card(
                  child: ListTile(
                    title: AutoSizeText('No Internet Connection'),
                    leading: Icon(Icons.info_rounded),
                  ),
                  color: Colors.red,
                ),
                autoDismiss: false,
                elevation: 40,
                position: NotificationPosition.bottom,
                background: Colors.transparent);

            isDataConnected = false;
          });
          print('You are disconnected from the internet.');
          break;
      }
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      // Got a new connectivity status!
      if (result != ConnectivityResult.none) {
        print('connected to network');
        setState(() {
          isNetorkConnected = true;
        });
      }

      if (result == ConnectivityResult.none) {
        // isDataConnected = await DataConnectionChecker().hasConnection;

        setState(() {
          isNetorkConnected = false;
          isDataConnected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    subscription.cancel();
    listener.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final ProgressDialog pr = ProgressDialog(context,
    //     type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    // pr.style(
    //     message: 'Submitting Order...',
    //     borderRadius: 10.0,
    //     backgroundColor: Colors.white,
    //     progressWidget: CircularProgressIndicator(),
    //     elevation: 10.0,
    //     insetAnimCurve: Curves.easeInOut,
    //     progress: 0.0,
    //     maxProgress: 100.0,
    //     progressTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    //     messageTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return OverlaySupport.global(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 92, 189, 144),
            title: Text('Review Order'),
          ),
          body: Stack(
            children: [
              Opacity(
                opacity: progress ? 0.5 : 1,
                child: ListView(
                  children: [
                    total[0] == 0
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
                        children: ListBuilder(
                            screenWidth: screenWidth, itemNumber: 0),
                      ),
                    ),
                    total[1] == 0
                        ? SizedBox(height: 0, width: 0)
                        : HeaderRow(amount: 5, itemName: 'Waffer'),
                    total[1] == 0
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
                    total[2] == 0
                        ? SizedBox(height: 0, width: 0)
                        : HeaderRow(amount: 5, itemName: 'Krackers'),
                    total[2] == 0
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
                    total[3] == 0
                        ? SizedBox(height: 0, width: 0)
                        : HeaderRow(amount: 10, itemName: 'Namkeen'),
                    total[3] == 0
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
                    total[4] == 0
                        ? SizedBox(height: 0, width: 0)
                        : HeaderRow(amount: 400, itemName: 'Namkeen'),
                    total[4] == 0
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
                          'Total : $grandTotal',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 120),
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       CreateOrderDatabase offlinedata =
                    //           CreateOrderDatabase();
                    //       await offlinedata.init();
                    //       var userId = user.uid;
                    //       cloudMap['Store Name'] = user.displayName;
                    //       date = DateFormat('dd/MM/y').format(now);
                    //       time = DateFormat()
                    //           .add_jm()
                    //           .format(now); //DateFormat('hh:mm a').format(now);
                    //       cloudMap['Date'] = date;
                    //       cloudMap['Time'] = time;
                    //       cloudMap['DateTime'] = DateFormat('y-MM-dd HH:mm:ss')
                    //           .format(DateTime.now());
                    //       cloudMap['Total'] = grandTotal;
                    //       List orderlist = [];
                    //       for (int i = 0; i < 5; i++) {
                    //         List newList = [];

                    //         for (int j = 0; j < knamkeen[i].length; j++) {
                    //           Map newMap = {
                    //             'Number': j,
                    //             'Box': namkeenBox[i][j],
                    //             'Patti': namkeenPatti[i][j],
                    //             'Total': indiTotal[i][j]
                    //           };
                    //           newList.add(newMap);
                    //         }
                    //         orderlist.add({'$i': newList});
                    //         cloudMap['$i'] = newList;
                    //       }
                    //       // print(cloudMap);
                    //       print(orderlist);
                    //       // offlinedata.additem(
                    //       //     uid: userId,
                    //       //     storename: user.displayName,
                    //       //     date: date,
                    //       //     time: time,
                    //       //     datetime: '$now',
                    //       //     order: orderlist,
                    //       //     total: grandTotal);
                    //       showDialog(
                    //           context: context,
                    //           builder: (context) {
                    //             return Center(
                    //               child: CircularProgressIndicator(),
                    //             );
                    //           });

                    //       await _firestore
                    //           .collection('${user.displayName} $userId')
                    //           .doc(
                    //               '${user.displayName} ${DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now())}')
                    //           .set(cloudMap);

                    //       Navigator.of(context).pop();

                    //       showDialog(
                    //           context: context,
                    //           barrierDismissible: false,
                    //           builder: (BuildContext context) {
                    //             return StatefulBuilder(
                    //               builder: (ctx, setState) {
                    //                 controller.forward();
                    //                 controller.addListener(() {
                    //                   setState(() {});
                    //                   print(controller.value);
                    //                 });

                    //                 return Dialog(
                    //                   shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(20),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(8.0),
                    //                     child: Column(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       children: [
                    //                         SizedBox(height: 12),
                    //                         Container(
                    //                           color: Colors.transparent,
                    //                           height: 100,
                    //                           width: 100,
                    //                           child: CustomPaint(
                    //                             painter: CheckPainter(
                    //                                 value: curve.value),
                    //                           ),
                    //                         ),
                    //                         SizedBox(height: 12),
                    //                         Text(
                    //                           'Order Received',
                    //                           textAlign: TextAlign.center,
                    //                           style: TextStyle(fontSize: 20),
                    //                         ),
                    //                         SizedBox(height: 12),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 );
                    //               },
                    //             );
                    //           });
                    //       await Future.delayed(Duration(seconds: 3));
                    //       Navigator.popUntil(
                    //           context, ModalRoute.withName('mainscreen'));
                    //     },
                    //     child: Container(
                    //       color: Colors.amberAccent,
                    //       width: 50,
                    //       height: 50,
                    //       child: Center(
                    //         child: Text('$isDataConnected'),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaleFactor: screenWidth / 320),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        child: Center(
                          child: SliderButton(
                              width: screenWidth / 1.65,
                              disable: !isDataConnected,
                              dismissible: true,
                              backgroundColor: Colors.green[100]!,
                              baseColor: Colors.green,
                              boxShadow: BoxShadow(
                                  color: Colors.lightGreen,
                                  spreadRadius: 3,
                                  blurRadius: 3),
                              action: () async {
                                CreateOrderDatabase offlinedata =
                                    CreateOrderDatabase();
                                await offlinedata.init();
                                var userId = user.uid;
                                cloudMap['Store Name'] = user.displayName;
                                date = DateFormat('dd/MM/y').format(now);
                                time = DateFormat().add_jm().format(now);
                                cloudMap['Date'] = date;
                                cloudMap['Time'] = time;
                                cloudMap['DateTime'] = DateTime.now();
                                // '${DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now())}';
                                cloudMap['Total'] = grandTotal;
                                List orderlist = [];
                                for (int i = 0; i < 5; i++) {
                                  List newList = [];

                                  for (int j = 0; j < knamkeen[i].length; j++) {
                                    Map newMap = {
                                      'Number': j,
                                      'Box': namkeenBox[i][j],
                                      'Patti': namkeenPatti[i][j],
                                      'Total': indiTotal[i][j]
                                    };
                                    newList.add(newMap);
                                  }
                                  orderlist.add({'$i': newList});
                                  cloudMap['$i'] = newList;
                                }
                                // print(cloudMap);
                                print(orderlist);
                                // offlinedata.additem(
                                //     uid: userId,
                                //     storename: user.displayName,
                                //     date: date,
                                //     time: time,
                                //     datetime: '$now',
                                //     order: orderlist,
                                //     total: grandTotal);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                // await pr.show();

                                await _firestore
                                    .collection('${user.displayName} $userId')
                                    .doc(
                                        '${user.displayName} ${DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now())}')
                                    .set(cloudMap);

                                Navigator.of(context).pop();

                                // await pr.hide();

                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (ctx, setState) {
                                          controller.forward();
                                          controller.addListener(() {
                                            setState(() {});
                                            print(controller.value);
                                          });

                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 12),
                                                  Container(
                                                    color: Colors.transparent,
                                                    height: 100,
                                                    width: 100,
                                                    child: CustomPaint(
                                                      painter: CheckPainter(
                                                          value: curve.value),
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'Order Received',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(height: 12),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    });
                                await Future.delayed(Duration(seconds: 3));
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => MainScreen()),
                                //     (route) => false);

                                Navigator.popUntil(context,
                                    ModalRoute.withName('/mainscreen'));
                              },
                              label: Text(
                                "Slide To Confirm",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth / 23),
                              ),
                              icon: Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 50,
                              )),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: isDataConnected ? 0 : 70,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              progress
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  int amount;
  String? itemName;
  HeaderRow({required this.amount, this.itemName});

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

List<Widget> ListBuilder({double? screenWidth, int? itemNumber}) {
  return List.generate(
    knamkeen[itemNumber!].length,
    (int i) => indiTotal[itemNumber][i] == 0
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
                    width: screenWidth! / 3,
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
                        '${namkeenBox[itemNumber][i]}',
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
                      child: Text('${namkeenPatti[itemNumber][i]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'arima'))),
                  Container(
                      width: screenWidth / 5,
                      child: Text('${indiTotal[itemNumber][i]}',
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

class CheckPainter extends CustomPainter {
  late Paint _paint;
  late double value;

  late double _length;
  late double _offset;
  late double _secondOffset;
  late double _startingAngle;

  CheckPainter({required this.value}) {
    _paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    assert(value != null);

    _length = 60;
    _offset = 0;
    _startingAngle = 205;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Background canvas
    var rect = Offset(0, 0) & size;
    _paint.color = Colors.greenAccent.withOpacity(.05);

    double line1x1 = size.width / 2 +
        size.width * cos(Angle.degrees(_startingAngle).radians) * .5;
    double line1y1 = size.height / 2 +
        size.height * sin(Angle.degrees(_startingAngle).radians) * .5;
    double line1x2 = size.width * .45;
    double line1y2 = size.height * .65;

    double line2x1 =
        size.width / 2 + size.width * cos(Angle.degrees(320).radians) * .35;
    double line2y1 =
        size.height / 2 + size.height * sin(Angle.degrees(320).radians) * .35;

    canvas.drawArc(rect, Angle.degrees(_startingAngle).radians,
        Angle.degrees(360).radians, false, _paint);
    canvas.drawLine(Offset(line1x1, line1y1), Offset(line1x2, line1y2), _paint);
    canvas.drawLine(Offset(line2x1, line2y1), Offset(line1x2, line1y2), _paint);

    // animation painter

    double circleValue, checkValue;
    if (value < .5) {
      checkValue = 0;
      circleValue = value / .5;
    } else {
      checkValue = (value - .5) / .5;
      circleValue = 1;
    }

    _paint.color = const Color(0xff72d0c3);
    double firstAngle = _startingAngle + 360 * circleValue;

    canvas.drawArc(
        rect,
        Angle.degrees(firstAngle).radians,
        Angle.degrees(getSecondAngle(firstAngle, _length, _startingAngle + 360))
            .radians,
        false,
        _paint);

    double line1Value = 0, line2Value = 0;
    if (circleValue >= 1) {
      if (checkValue < .5) {
        line2Value = 0;
        line1Value = checkValue / .5;
      } else {
        line2Value = (checkValue - .5) / .5;
        line1Value = 1;
      }
    }

    double auxLine1x1 = (line1x2 - line1x1) * getMin(line1Value, .8);
    double auxLine1y1 =
        (((auxLine1x1) - line1x1) / (line1x2 - line1x1)) * (line1y2 - line1y1) +
            line1y1;

    if (_offset < 60) {
      auxLine1x1 = line1x1;
      auxLine1y1 = line1y1;
    }

    double auxLine1x2 = auxLine1x1 + _offset / 2;
    double auxLine1y2 =
        (((auxLine1x1 + _offset / 2) - line1x1) / (line1x2 - line1x1)) *
                (line1y2 - line1y1) +
            line1y1;

    if (checkIfPointHasCrossedLine(Offset(line1x2, line1y2),
        Offset(line2x1, line2y1), Offset(auxLine1x2, auxLine1y2))) {
      auxLine1x2 = line1x2;
      auxLine1y2 = line1y2;
    }

    if (_offset > 0) {
      canvas.drawLine(Offset(auxLine1x1, auxLine1y1),
          Offset(auxLine1x2, auxLine1y2), _paint);
    }

    // SECOND LINE

    double auxLine2x1 = (line2x1 - line1x2) * line2Value;
    double auxLine2y1 =
        ((((line2x1 - line1x2) * line2Value) - line1x2) / (line2x1 - line1x2)) *
                (line2y1 - line1y2) +
            line1y2;

    if (checkIfPointHasCrossedLine(Offset(line1x1, line1y1),
        Offset(line1x2, line1y2), Offset(auxLine2x1, auxLine2y1))) {
      auxLine2x1 = line1x2;
      auxLine2y1 = line1y2;
    }
    if (line2Value > 0) {
      canvas.drawLine(
          Offset(auxLine2x1, auxLine2y1),
          Offset(
              (line2x1 - line1x2) * line2Value + _offset * .75,
              ((((line2x1 - line1x2) * line2Value + _offset * .75) - line1x2) /
                          (line2x1 - line1x2)) *
                      (line2y1 - line1y2) +
                  line1y2),
          _paint);
    }
  }

  double getMax(double x, double y) {
    return (x > y) ? x : y;
  }

  double getMin(double x, double y) {
    return (x > y) ? y : x;
  }

  bool checkIfPointHasCrossedLine(Offset a, Offset b, Offset point) {
    return ((b.dx - a.dx) * (point.dy - a.dy) -
            (b.dy - a.dy) * (point.dx - a.dx)) >
        0;
  }

  double getSecondAngle(double angle, double plus, double max) {
    if (angle + plus > max) {
      _offset = angle + plus - max;
      return max - angle;
    } else {
      _offset = 0;
      return plus;
    }
  }

  @override
  bool shouldRepaint(CheckPainter old) {
    return old.value != value;
  }
}

// void showTopSnackBar(BuildContext context) => Flushbar(
//       flushbarPosition: FlushbarPosition.TOP,
//       title: 'No Network',
//       message: 'no network',
//       routeColor: Colors.amberAccent,
//     )..show(context);
