import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rangoli/constants.dart';
import 'package:rangoli/screens/order/components/data_connection.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/components/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:overlay_support/overlay_support.dart';
import 'otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String phoneNumber, password;

  bool showSpinner = false;
  double conHeight = 42;
  bool containerColor = true;
  final _auth = FirebaseAuth.instance;
  var subscription, listener;
  var notification;
  var isDataConnected = false; //checks if actually network available
  bool isNetorkConnected = false;

  bool smallerinput = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
    // TODO: implement dispose
    super.dispose();

    subscription.cancel();
    listener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        home: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200.0,
                        child: Image.asset(
                          'assets/real.jpg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      phoneNumber = value;

                      setState(() {
                        smallerinput = false;
                      });
                      //Do something with the user input.
                    },
                    decoration: kinputdecoration.copyWith(
                        fillColor: Color.fromARGB(255, 133, 220, 116),
                        hintText: "Enter your Mobile Number",
                        errorText: smallerinput
                            ? 'Phone Number Should Be 10 digits Long'
                            : null),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),

                  // Buttons(
                  //   color: Colors.blueAccent,
                  //   name: 'Register',
                  //   onpress: () async {
                  //     // setState(() {
                  //     //   showSpinner = true;
                  //     // });
                  //     // try {
                  //     //   final newUser = await _auth.createUserWithEmailAndPassword(
                  //     //       email: phoneNumber, password: password);
                  //     //   print(phoneNumber);
                  //     //   print(password);
                  //     //   // print(newUser);
                  //     //   if (newUser != null) {
                  //     //     Navigator.pushNamed(context, '/third');
                  //     //   }
                  //     //   setState(() {
                  //     //     showSpinner = false;
                  //     //   });
                  //     // } catch (e) {
                  //     //   print(e);
                  //     // }
                  //   },
                  // ),
                  // Material(
                  //   elevation: 5.0,
                  //   borderRadius: BorderRadius.circular(30.0),
                  //   child: AnimatedContainer(
                  //     height: conHeight,
                  //     duration: Duration(milliseconds: 200),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(30.0),
                  //         gradient: LinearGradient(colors: [
                  //           containerColor ? Colors.teal[200] : Colors.teal,
                  //           Colors.tealAccent
                  //         ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  //     child: MaterialButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           if (containerColor == false) {
                  //             containerColor = true;
                  //           } else {
                  //             containerColor = false;
                  //           }
                  //         });
                  //       },

                  //       // onPressed: () {

                  //       //   Navigator.pushNamed(context, nextpage);
                  //       //   //Go to login screen.
                  //       // },
                  //       minWidth: 200.0,
                  //       // height: conHeight,
                  //       child: Text(
                  //         'Register',
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Buttons(
                      color: Color.fromARGB(255, 133, 220, 116),
                      name: 'Send OTP',
                      onpress: !isDataConnected
                          ? () {}
                          : () {
                              if (phoneNumber.length == 10) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpScreen(
                                              phone: phoneNumber,
                                            )));
                              } else {
                                setState(() {
                                  smallerinput = true;
                                });
                              }
                              // setState(() {
                              //   showSpinner = true;
                              // });
                            })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
