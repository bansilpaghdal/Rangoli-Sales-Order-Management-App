import 'dart:async';

import 'package:rangoli/admin/adminmainscreen.dart';
import 'package:rangoli/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/constants.dart';
import 'package:rangoli/components/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'user_details.dart';

class OtpScreen extends StatefulWidget {
  final phone;

  OtpScreen({@required this.phone});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String _verificationcode;
  late String otp;
  bool passwordStatus = false;
  bool showspin = false;
  late User user;
  var textcontrol = TextEditingController();
  bool otpstatus = false;
  late Timer _timer;
  late int _start;
  bool timerstatus = false;
  late int resend;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getotp();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timerstatus = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void getotp() async {
    setState(() {
      timerstatus = false;
      _start = 30;

      otpstatus = false;
    });

    print(widget.phone);
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91${widget.phone}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            setState(() {
              showspin = true;
              print(_verificationcode);

              textcontrol.text = credential.smsCode!;
            });

            try {
              await _auth.signInWithCredential(credential);
            } catch (e) {
              print(e);
              setState(() {
                showspin = false;
              });
              if (e.toString().contains('network-request-failed')) {
                await dialogshow(
                    title: 'Network Connection Failed',
                    content: 'Check Your Internet Connection',
                    context: context);
                Navigator.pop(context);
              } else {
                await dialogshow(
                    title: 'Unknown Error',
                    content: 'Please Try Again',
                    context: context);
                Navigator.pop(context);
              }
            }

            user = _auth.currentUser!;
            print(user.phoneNumber);
            if (kphonenumber.contains(user.phoneNumber.toString())) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AdminMainScreen.id,
                (route) => false,
              );
            } else if (user.displayName == null) {
              print(user.uid);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserDetails(phone: widget.phone)));
            } else {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("isLoggedIn", true);
              var status = prefs.getBool('isLoggedIn');
              print(status);

              // Navigator.pushNamedAndRemoveUntil(
              //     context, '/mainscreen', (route) => false,
              //     arguments: MainScreen(
              //       phone: widget.phone,
              //     ));
            }
            setState(() {
              showspin = false;
            });
            print('navigator done');
            print('auto login successful');
          },
          verificationFailed: (FirebaseAuthException e) async {
            print('erur : ${e.code}');
            if (e.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');

              await dialogshow(
                  title: 'Invalid Phone Number',
                  content: 'Check Your Phone Number',
                  context: context);
              Navigator.pop(context);
            } else if (e.code == 'too-many-requests') {
              await dialogshow(
                  title: 'Too Many Requests',
                  content: 'Try After Sometime',
                  context: context);
              Navigator.pop(context);
            } else if (e.code == 'network-request-failed') {
              await dialogshow(
                  title: 'Network Connection Failed',
                  content: 'Check Your Internet Connection And Try Again',
                  context: context);
              Navigator.pop(context);
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            startTimer();
            resend = resendToken!;
            _verificationcode = verificationId;
            setState(() {
              otpstatus = true;
            });

            // print("verification code : $verificationId");
            // Create a PhoneAuthCredential with the code
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          timeout: Duration(seconds: 30));
    } catch (e) {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspin,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpstatus
                  ? Text('Otp sent to ${widget.phone}')
                  : Shimmer.fromColors(
                      period: Duration(milliseconds: 1500),
                      baseColor: Colors.black,
                      highlightColor: Colors.black38,
                      child: Text('Sending OTP')),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: textcontrol,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  otp = value;
                  setState(() {
                    passwordStatus = false;
                  });
                  //Do something with the user input.
                },
                decoration: kinputdecoration.copyWith(
                  hintText: "Enter The OTP",
                  errorText:
                      passwordStatus ? 'Wrong Password Try Again!!!' : null,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Buttons(
                color: Color.fromARGB(255, 133, 220, 116),
                name: 'Submit',
                onpress: () async {
                  setState(() {
                    showspin = true;
                  });

                  try {
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: _verificationcode, smsCode: otp);

                    // Sign the user in (or link) with the credential
                    await _auth.signInWithCredential(phoneAuthCredential);
                    print('navigator initiated');
                    user = _auth.currentUser!;
                    print(user.phoneNumber);

                    if (kphonenumber.contains(user.phoneNumber.toString())) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AdminMainScreen.id,
                        (route) => false,
                      );
                    } else if (user.displayName == null) {
                      print(user.uid);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserDetails(phone: widget.phone)));
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("isLoggedIn", true);
                      var status = prefs.getBool('isLoggedIn');
                      print(status);
                      Navigator.pushNamed(context, '/mainscreen',
                          arguments: MainScreen(phone: widget.phone));
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/mainscreen', (route) => false,
                          arguments: MainScreen(
                            phone: widget.phone,
                          ));
                    }
                    setState(() {
                      showspin = false;
                    });

                    print('navigator done');
                    print('succesfully logged in');
                  } catch (e) {
                    setState(() {
                      showspin = false;
                    });

                    print('some error');
                    print(e);
                    if (e.toString().contains('network-request-failed')) {
                      await dialogshow(
                          title: 'Network Connection Failed',
                          content: 'Check Your Internet Connection',
                          context: context);
                      Navigator.pop(context);
                    }
                    print(e.toString().contains('network-request-failed'));
                    // print(e ==
                    //     '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred');
                    // print(e == 'firebase_auth/network-request-failed');
                    setState(() {
                      passwordStatus = true;
                    });
                  }
                },
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2.6,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                animationDuration: Duration(milliseconds: 300),
                onPressed: !timerstatus
                    ? null
                    : () {
                        setState(() {
                          getotp();
                        });
                      },
                color: Colors.lightBlueAccent,
                disabledColor: Colors.grey,
                child: Text(
                  timerstatus ? 'Resend OTP' : 'Resend OTP : $_start',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future dialogshow(
    {required String title,
    required String content,
    required BuildContext context}) {
  return showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        Center(
          child: MaterialButton(
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ),
      ],
    ),
  );
}
