import 'dart:math';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rangoli/screens/view_order/view_order2.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rangoli/constants.dart';

import 'edit_order/edit_create_order_list.dart';

List<Appointment> _appointmentDetails = <Appointment>[];
List<Appointment> tempappointment = <Appointment>[];

class OrderList extends StatefulWidget {
  var uid;
  var name;
  OrderList({this.uid, this.name});
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final _firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool emptydoc = false;
  ScrollController? controller, scrollbarcontroller;
  ScrollNotification? scrollNotification;
  Key? sfcalendarkey;

  final _auth = FirebaseAuth.instance;
  late User user;
  late final order;

  // Widget orderWidget()

  @override
  void initState() {
    print(DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now()));
    Random random = Random();
    // TODO: implement initState
    super.initState();
    user = _auth.currentUser!;
    _appointmentDetails.clear();
    tempappointment.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final DateTime exceptionDate = DateTime(2021, 04, 20);

      setState(() {
        isLoading = true;
      });
      await _firestore
          .collection('${user.displayName} ${user.uid}')
          .orderBy('DateTime')
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            // order = doc;
            var parseddatetime =
                DateTime.parse(doc['DateTime'].toDate().toString());

            String time = doc['Time'];

            int finaltotal = doc['Total'];
            var day, month, year;
            day = parseddatetime.day;
            month = parseddatetime.month;
            year = parseddatetime.year;

            final Appointment recurrenceAppointment2 = Appointment(
              notes: '${DateFormat('d MMMM\n').format(parseddatetime)} $time',
              isAllDay: true,
              startTime: DateTime(year, month, day, 8),
              endTime: DateTime(year, month, day, 8),
              subject: 'Total : $finaltotal',
              id: doc.id,
              color: kcolor[random.nextInt(kcolor.length)],
            );
            tempappointment.add(recurrenceAppointment2);
          });
        } else {
          setState(() {
            isLoading = false;
            emptydoc = true;
          });
        }
        for (int i = 0; i < tempappointment.length; i++) {
          if (DateTime.now().day == tempappointment[i].startTime.day &&
              DateTime.now().month == tempappointment[i].startTime.month) {
            _appointmentDetails.add(tempappointment[i]);
          }
        }
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        MonthCellDetails monthCellDetails;

        _appointmentDetails =
            calendarTapDetails.appointments!.cast<Appointment>();
        print(_appointmentDetails);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ))
            : emptydoc
                ? Center(
                    child: Text('No Orders'),
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SfCalendar(
                          // key: UniqueKey(),
                          initialSelectedDate: DateTime.now(),
                          showNavigationArrow: true,
                          showDatePickerButton: true,
                          firstDayOfWeek: 3,
                          headerHeight: 70,
                          monthViewSettings: MonthViewSettings(
                            showTrailingAndLeadingDates: false,
                            numberOfWeeksInView: 6,
                            appointmentDisplayCount: 10,
                            agendaItemHeight: 80,
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.indicator,
                            showAgenda: false,
                          ),
                          view: CalendarView.month,
                          dataSource: _getDataSource(),
                          onTap: calendarTapped,
                        ),
                      ),
                      Expanded(
                          child: Container(
                              color: Colors.black12,
                              child: ListView.separated(
                                padding: const EdgeInsets.all(2),
                                itemCount: _appointmentDetails.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      // await _firestore
                                      //     .collection(
                                      //         '${user.displayName} ${user.uid}')
                                      //     .orderBy('DateTime')
                                      //     .get()
                                      //     .then((QuerySnapshot querySnapshot) {
                                      //   querySnapshot.docs.forEach((doc) {
                                      //     // var parseddatetime =
                                      //     //     DateTime.parse(doc['DateTime'].toDate().toString());
                                      //     // print(parseddatetime.day);
                                      //     // String time = doc['Time'];
                                      //     // print('$time');
                                      //     // int finaltotal = doc['Total'];
                                      //     // var day, month, year;
                                      //     // day = parseddatetime.day;
                                      //     // month = parseddatetime.month;
                                      //     // year = parseddatetime.year;
                                      //     // print(doc["DateTime"]);

                                      //     // final Appointment recurrenceAppointment2 = Appointment(
                                      //     //   notes: '${DateFormat('d MMMM\n').format(parseddatetime)} $time',
                                      //     //   isAllDay: true,
                                      //     //   startTime: DateTime(year, month, day, 8),
                                      //     //   endTime: DateTime(year, month, day, 8),
                                      //     //   subject: 'Total : $finaltotal',
                                      //     //   id: parseddatetime.toString(),
                                      //     //   color: Colors.purple,
                                      //     // );
                                      //     // tempappointment.add(recurrenceAppointment2);
                                      //     print(doc.id);
                                      //     print(_appointmentDetails[index].id);
                                      //     if (_appointmentDetails[index].id ==
                                      //         doc.id) {
                                      //       // setState(() {
                                      //       //   isLoading = false;
                                      //       // });
                                      //       setState(() {
                                      //         isLoading = false;

                                      //       });
                                      //     }
                                      //   });
                                      // });
                                      print("button");

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewOrder2(
                                                    order: _appointmentDetails[
                                                            index]
                                                        .id,
                                                  )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 3,
                                                offset: Offset(3, 3))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color:
                                              _appointmentDetails[index].color,
                                        ),
                                        height: 100,
                                        child: Center(
                                          child: ListTile(
                                            visualDensity: VisualDensity(
                                                horizontal: 0, vertical: 4),
                                            leading: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  child: AutoSizeText(
                                                    '${_appointmentDetails[index].notes}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                        height: 1.7),
                                                  ),
                                                ),
                                                // Text(
                                                //   _appointmentDetails[index].isAllDay
                                                //       ? 'All day'
                                                //       : '',
                                                //   style: TextStyle(
                                                //       height: 0.5, color: Colors.white),
                                                // ),
                                              ],
                                            ),
                                            trailing: GestureDetector(
                                                onTap: () {
                                                  print("edit pressed");
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditCreateOrder(
                                                                  orderid: _appointmentDetails[
                                                                          index]
                                                                      .id)));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 25, 25, 25),
                                                  color:
                                                      _appointmentDetails[index]
                                                          .color,
                                                  child: const Icon(
                                                    Icons
                                                        .mode_edit_outline_rounded,
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                            title: Container(
                                                child: Text(
                                                    _appointmentDetails[index]
                                                        .subject,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white))),
                                          ),
                                        )),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(
                                  height: 5,
                                ),
                              )))
                    ],
                  ),
      ),
    );
  }
}

_AppointmentDataSource _getDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    isAllDay: true,
    startTime: DateTime(2021, 8, 12),
    endTime: DateTime(2021, 8, 12),
    subject: 'Meeting',
    color: Colors.pink,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.addAll(tempappointment);
  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
  
//     return isLoading
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : Scaffold(
//             backgroundColor: Colors.white,
//             body: StreamBuilder(
//               stream: _firestore
//                   .collection('${widget.name} ${widget.uid}')
//                   .orderBy('DateTime')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   final orders = snapshot.data.docs;
//                   List<Widget> orderList = [];
//                   for (var order in orders) {
//                     final total = order.data()['Total'];
//                     final date = order.data()['Date'];
//                     final time = order.data()['Time'];

//                     final orderWidget = GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isLoading = true;
//                         });

//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ViewOrder(
//                                       order: order,
//                                     )));
//                         setState(() {
//                           isLoading = false;
//                         });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 15),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(25),
//                           elevation: 7,
//                           child: Container(
//                             height: 140,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//                                     Color(0xAF1589FF),
//                                     Color(0x9F6698FF)
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter),
//                               // border: Border.all(color: Colors.white, width: 1),
//                               // color: Colors.tealAccent,
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 4,
//                                   child: GestureDetector(
//                                     // onLongPress: () {
//                                     //   print('long pressed');
//                                     // },
//                                     // onLongPressEnd: (LongPressEndDetails) {

//                                     //   print('long press ended');
//                                     // },
//                                     onTap: () {
//                                       setState(() {
//                                         isLoading = true;
//                                       });

//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => ViewOrder(
//                                                     order: order,
//                                                   )));
//                                       setState(() {
//                                         isLoading = false;
//                                       });
//                                     },
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 5),
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 12),
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Container(
//                                                         child: AutoSizeText(
//                                                       '$date $time',
//                                                       style: TextStyle(
//                                                           fontSize: 250,
//                                                           color: Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.w800),
//                                                       maxLines: 1,
//                                                       maxFontSize: 400,
//                                                     )
//                                                         // AutoSizeText.rich(
//                                                         //   TextSpan(
//                                                         //       style: TextStyle(
//                                                         //           fontSize:
//                                                         //               screenwidth /
//                                                         //                   20,
//                                                         //           color: Colors
//                                                         //               .white),
//                                                         //       children: [
//                                                         //         TextSpan(
//                                                         //             text:
//                                                         //                 '$date ',
//                                                         //             style: TextStyle(
//                                                         //                 fontSize:
//                                                         //                     200,
//                                                         //                 color: Colors
//                                                         //                     .white,
//                                                         //                 fontWeight:
//                                                         //                     FontWeight
//                                                         //                         .w800)),
//                                                         //         TextSpan(
//                                                         //             text: '$time',
//                                                         //             style: TextStyle(
//                                                         //                 color: Colors
//                                                         //                     .white,
//                                                         //                 fontWeight:
//                                                         //                     FontWeight
//                                                         //                         .w800))
//                                                         //       ]),
//                                                         //   textAlign:
//                                                         //       TextAlign.center,
//                                                         //   maxLines: 1,
//                                                         // ),
//                                                         ),
//                                                   ),
//                                                   // Expanded(
//                                                   //   child: AutoSizeText.rich(
//                                                   //     TextSpan(
//                                                   //         style: TextStyle(
//                                                   //             // fontSize:
//                                                   //             //     screenwidth /
//                                                   //             //         18,
//                                                   //             color:
//                                                   //                 Colors.white),
//                                                   //         children: [
//                                                   //           TextSpan(
//                                                   //               text: 'Time \n',
//                                                   //               style: TextStyle(
//                                                   //                   color: Color(0xFFFFCC66),
//                                                   //                   // fontSize:
//                                                   //                   //     screenwidth /
//                                                   //                   //         21,
//                                                   //                   fontWeight: FontWeight.w500)),
//                                                   //           TextSpan(
//                                                   //               text: '$time',
//                                                   //               style: TextStyle(
//                                                   //                   fontWeight:
//                                                   //                       FontWeight
//                                                   //                           .w800))
//                                                   //         ]),
//                                                   //     maxFontSize: 25,
//                                                   //     textAlign:
//                                                   //         TextAlign.center,
//                                                   //   ),
//                                                   // )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Center(
//                                             child: RichText(
//                                               textAlign: TextAlign.center,
//                                               text: TextSpan(
//                                                   style: TextStyle(
//                                                       fontSize: 23,
//                                                       color: Colors.black),
//                                                   children: [
//                                                     TextSpan(text: 'Total: '),
//                                                     TextSpan(
//                                                         text: '$total',
//                                                         style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w400))
//                                                   ]),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: GestureDetector(
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     EditCreateOrder(
//                                                         order: order)));
//                                       },
//                                       child: Icon(
//                                         Icons.edit,
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                     orderList.add(orderWidget);
//                   }
//                   return Scrollbar(
//                     controller: scrollbarcontroller,
//                     notificationPredicate: (scrollNotification) {
//                       // print(scrollNotification);
//                       return true;
//                     },
//                     radius: Radius.circular(15),
//                     interactive: true,
//                     thickness: 10,
//                     child: ListView(
//                       physics: orderList.length > 4
//                           ? BouncingScrollPhysics()
//                           : BouncingScrollPhysics(),
//                       // dragStartBehavior: DragStartBehavior.down,
//                       shrinkWrap:
//                           orderList.length * 150 > screenHeight ? false : true,
//                       reverse: true,
//                       children: orderList.reversed.toList(),
//                     ),
//                   );
//                 }
//               },
//             ),
//           );
//   }
// }