import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../create_order.dart';

class PriceContainer extends StatefulWidget {
  ScrollController scrollcontroller;
  PageController pagecontroller;
  int? total, pageno;
  String? price, category;
  Function statecallback;

  PriceContainer(
      {required this.total,
      required this.pagecontroller,
      required this.scrollcontroller,
      this.price,
      this.category,
      this.pageno,
      required this.statecallback});

  @override
  _PriceContainerState createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          currentTab = widget.pageno!;
        });
        widget.statecallback();
        widget.pagecontroller.animateToPage(widget.pageno!,
            duration: Duration(milliseconds: 600), curve: Curves.decelerate);
        // widget.scrollcontroller.animateTo(0,
        //     duration: Duration(milliseconds: 50), curve: Curves.decelerate);
        widget.scrollcontroller.animateTo(widget.pageno!.toDouble() * 15,
            duration: Duration(milliseconds: 400), curve: Curves.decelerate);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Material(
          animationDuration: Duration(milliseconds: 300),
          elevation: currentTab == widget.pageno ? 7 : 0,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            decoration: BoxDecoration(
                color: currentTab == widget.pageno
                    ? Color(0xFF2AD0D5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            height: screenHeight / 8,
            width: screenWidth / 5,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  widget.price!,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: screenHeight / 30, color: Colors.white),
                ),
                AutoSizeText(
                  widget.category!,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontFamily: 'button'),
                ),
                AutoSizeText(
                  widget.total != null ? '${widget.total}' : '0',
                  maxLines: 1,
                  style: TextStyle(
                      color:
                          widget.total != null ? Colors.black : Colors.white),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
