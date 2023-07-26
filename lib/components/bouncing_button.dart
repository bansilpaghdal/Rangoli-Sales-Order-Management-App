import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  final Widget child;
  final Function? onTap;

  BounceButton({required this.child, this.onTap});
  @override
  _BounceButtonState createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
        onTap: () async {
          widget.onTap!();
          _controller.forward();
          await Future.delayed(Duration(milliseconds: 100));
          _controller.reverse();
        },
        onTapCancel: () {
          _controller.reverse();
        },
        onTapDown: (TapDownDetails details) {
          _controller.forward();
        },
        onTapUp: (TapUpDetails details) {
          _controller.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ));
  }
}
