import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/components/buttons.dart';
import 'package:rangoli/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  final String? phone;
  UserDetails({this.phone});
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User? user;
  bool nameerror = false, addresserror = false;
  bool isloading = false;

  String? username, useraddress;

  Future updateuserprofile(String name) async {
    user = _auth.currentUser;
    await user!.updateDisplayName(name);
    print(user!.displayName);
    print(widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isloading
          ? Center(child: CircularProgressIndicator.adaptive())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        nameerror = false;
                      });
                      if (value == '') {
                        setState(() {
                          username = '';
                          nameerror = true;
                        });
                      } else {
                        username = value.trim();
                      }

                      //Do something with the user input.
                    },
                    decoration: kinputdecoration.copyWith(
                      hintText: "Enter The Name",
                      errorText: nameerror ? 'Name cannot be empty' : null,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.streetAddress,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        addresserror = false;
                      });
                      if (value == '') {
                        setState(() {
                          useraddress = '';
                          addresserror = true;
                        });
                      } else {
                        useraddress = value.trim();
                      }

                      //Do something with the user input.
                    },
                    decoration: kinputdecoration.copyWith(
                        hintText: "Enter The Address",
                        errorText: addresserror ? 'Enter the address' : null),
                  ),
                ),
                Buttons(
                  name: "Confirm",
                  color: Colors.lightBlueAccent,
                  onpress: () async {
                    if (username == null || username == '') {
                      setState(() {
                        nameerror = true;
                      });
                    } else if (useraddress == null || useraddress == '') {
                      setState(() {
                        addresserror = true;
                      });
                    } else {
                      setState(() {
                        isloading = true;
                      });
                      await updateuserprofile(username!);
                      print(widget.phone);
                      await _firestore
                          .collection('Users')
                          .doc(widget.phone)
                          .set({
                        'phone': widget.phone,
                        'name': username,
                        'address': useraddress,
                        'uid': user!.uid
                      });

                      Navigator.pushNamedAndRemoveUntil(
                          context, '/mainscreen', (route) => false);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("isLoggedIn", true);
                    }
                  },
                )
              ],
            ),
    );
  }
}
