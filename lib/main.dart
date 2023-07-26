import 'package:firebase_auth/firebase_auth.dart';
import 'package:rangoli/admin/adminmainscreen.dart';
// import 'package:flashchat/constants.dart';
// import 'package:flashchat/screens/view_order/view_order2.dart';
import 'package:flutter/material.dart';
import 'package:rangoli/screens/registering_user/welcome_screen.dart';
// import 'package:flashchat/screens/chat_screen.dart';
// import 'package:flashchat/screens/registering_user/login_screen.dart';
import 'package:rangoli/screens/registering_user/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rangoli/screens/registering_user/loading_screen.dart';
import 'package:rangoli/screens/main_screen.dart';
// import 'package:flashchat/screens/registering_user/user_details.dart';

var status;
bool isadmin = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  status = user != null;

  // status ? isadmin = kphonenumber.contains(user!.phoneNumber) : isadmin = false;
  print('app started');

  print(status);
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: status == true
          ? isadmin == true
              ? AdminMainScreen.id
              : '/mainscreen'
          : '/loadingscreen',
      routes: {
        '/loadingscreen': (context) => LoadingScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        '/first': (context) => RegistrationScreen(),
        // '/second': (context) => LoginScreen(),
        // '/third': (context) => ChatScreen(),
        // '/user_details': (context) => UserDetails(),
        '/mainscreen': (context) => MainScreen(),
        AdminMainScreen.id: (context) => AdminMainScreen()
      },
    );
  }
}
