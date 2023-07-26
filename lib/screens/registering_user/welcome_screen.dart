import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rangoli/components/buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 50),
      vsync: this,
    );
    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.00);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
      // print(controller.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/real.jpg'),
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: Duration(milliseconds: 200),
                    // pause: Duration(seconds: ),
                    animatedTexts: [
                      TypewriterAnimatedText('Rangoli Sales',
                          speed: Duration(milliseconds: 200),
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 41, 89, 142),
                              fontSize: (MediaQuery.of(context).size.width) / 9,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'dancing'))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        color: Color.fromARGB(255, 79, 206, 54),
                        width: 2.0,
                        style: BorderStyle.solid)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(color: Colors.black),
                  ),
                )),
            Buttons(
              color: Color.fromARGB(255, 133, 220, 116),
              name: 'Register',
              onpress: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
          ],
        ),
      ),
    );
  }
}
