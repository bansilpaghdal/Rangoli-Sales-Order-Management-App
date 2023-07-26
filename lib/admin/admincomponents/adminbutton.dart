// import 'package:auto_size_text/auto_size_text.dart';
import 'package:rangoli/screens/order/components/bouncing_button.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AdminButton extends StatefulWidget {
  IconData icon;
  String text;
  VoidCallback ontap;
  AdminButton({required this.text, required this.icon, required this.ontap});

  @override
  _AdminButtonState createState() => _AdminButtonState();
}

class _AdminButtonState extends State<AdminButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BounceButton(
        onTap: () {},
        child: MaterialButton(
          splashColor: Colors.purpleAccent[100],
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          color: Colors.purpleAccent,
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 80,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.text,
                // minFontSize: 22,
                maxLines: 2,
                textAlign: TextAlign.center,
              )
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: widget.ontap,
        ),
      ),
    );
  }
}
