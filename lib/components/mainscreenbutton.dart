import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'bouncing_button.dart';

class MainScreenButton extends StatefulWidget {
  Function? onTap;
  String? buttonText;
  IconData? buttonIcon;
  Color? startColor, endColor;
  MainScreenButton(
      {this.onTap,
      this.buttonText,
      this.buttonIcon,
      this.startColor,
      this.endColor});

  @override
  _MainScreenButtonState createState() => _MainScreenButtonState();
}

class _MainScreenButtonState extends State<MainScreenButton> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return BounceButton(
      onTap: widget.onTap!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Material(
          borderRadius: BorderRadius.circular(screenheight / 5),
          color: Colors.transparent,
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    widget.startColor!,
                    // Colors.teal[400],
                    widget.endColor!
                  ]),
              // color: Colors.tealAccent,
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Center(
                child: ListTile(
                  leading: Icon(
                    widget.buttonIcon,
                    size: 45,
                  ),
                  title: AutoSizeText(
                    widget.buttonText!,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        fontFamily: 'button'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
