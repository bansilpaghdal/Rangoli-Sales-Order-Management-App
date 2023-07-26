// import 'package:rangoli/screens/main_screen.dart';
import 'package:rangoli/screens/registering_user/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    animation =
        ColorTween(begin: Color.fromARGB(255, 127, 241, 172), end: Colors.white)
            .animate(controller);
    animation2 =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad);
    controller.addListener(() {
      setState(() {});
      // print(controller.value);
    });
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // var status = prefs.getBool('isLoggedIn') ?? false;

        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => WelcomeScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Center(
          child: Hero(
        tag: 'logo',
        child: Container(
          child: Image.asset(
            'assets/real.jpg',
            fit: BoxFit.fill,
            height: animation2.value * 300,
            width: animation2.value * 300,
          ),
        ),
      )),
    );
  }
}
