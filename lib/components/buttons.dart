import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons({required this.color, required this.onpress, required this.name});
  final Color color;
  final String name;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        // animationDuration: Duration(milliseconds: 50),
        // elevation: 5.0,

        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

          elevation: 05,
          color: color,
          disabledColor: Colors.black,
          disabledTextColor: Colors.white,

          onPressed: onpress,

          // onPressed: () {

          //   Navigator.pushNamed(context, nextpage);
          //   //Go to login screen.
          // },
          minWidth: 200.0,
          height: 38.0,
          child: Text(
            name,
          ),
        ),
      ),
    );
  }
}
