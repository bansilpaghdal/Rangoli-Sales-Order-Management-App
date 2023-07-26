import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rangoli/admin/admin_vieworder_calendar.dart';
// import 'package:rangoli/admin/admin_vieworder_list.dart';
import 'package:rangoli/admin/admincomponents/adminbutton.dart';
// import 'package:rangoli/screens/order/components/mainscreenbutton.dart';
// import 'package:rangoli/screens/registering_user/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../screens/registering_user/welcome_screen.dart';

class AdminMainScreen extends StatefulWidget {
  static const String id = '/adminmainscreen';

  @override
  _AdminMainScreenState createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: AdminButton(
                    icon: Icons.calendar_today_rounded,
                    ontap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AdminViewOrderCalendar())
                      //     );
                    },
                    text: 'View Orders',
                  ),
                ),
                Expanded(
                  child: AdminButton(
                    icon: Icons.list_alt,
                    ontap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AdminViewOrderList()));
                    },
                    text: 'View Orders',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                  child: AdminButton(
                    icon: Icons.logout_rounded,
                    ontap: () async {
                      await _auth.signOut();
                      Navigator.popAndPushNamed(context, WelcomeScreen.id);
                    },
                    text: 'Sign Out',
                  ),
                ),
                Expanded(
                  child: AdminButton(
                    icon: Icons.supervised_user_circle,
                    text: 'Users',
                    ontap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
