import 'package:rangoli/constants.dart';
import 'package:rangoli/screens/order/components/bouncing_button.dart';
import 'package:rangoli/screens/order/create_order.dart';
import 'package:rangoli/screens/order/review_order.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';

List<List<int>> indiTotal = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List<List<int>> namkeenBox = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List<List<int>> namkeenPatti = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List textboxcontroller = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];
List textpatticontroller = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];
int grandBox = 0;
int grandPatti = 0;

class Create5NamkeenRow extends StatefulWidget {
  final Function? callback1;
  final itemslist = knamkeen;
  int total = 0;
  final int? category;
  Create5NamkeenRow({this.callback1, this.category});
  int currentTotal() {
    return total;
  }

  @override
  _Create5NamkeenRowState createState() => _Create5NamkeenRowState();
}

class _Create5NamkeenRowState extends State<Create5NamkeenRow> {
  // List indiTotal = List.filled(25, 0);
  // List namkeenBox = List.filled(25, 0);
  // List namkeenPatti = List.filled(25, 0);

  @override
  void initState() {
    super.initState();
    print('page created');
    // for (int i = 0; i < 25; i++) {
    //   _textboxcontroller[widget.category][i] = TextEditingController(
    //       text: namkeenBox[widget.category][i].toString() == '0'
    //           ? ''
    //           : namkeenBox[widget.category][i].toString());
    // }
  }

  DataRow createRow(int i, int j, int box, int patti) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenBottom = MediaQuery.of(context).viewInsets.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor;
    return DataRow(cells: [
      DataCell(Container(
        width: MediaQuery.of(context).size.width / 3.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight / 80),
                child: Center(
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: widget.itemslist[j][i],
                      style: TextStyle(
                          color: Colors.black, fontSize: screenHeight / 48),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontSize: screenHeight / 35),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: AutoSizeText(
                  '(1 Box = ${knamkeenitem[j][i]} Patti)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                  maxLines: 2,
                  maxFontSize: 25,
                ),
              ),
            ),
          ],
        ),
      )),
      DataCell(Column(
        //Box Textfield
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
            width: screenWidth / 6,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              controller: textboxcontroller[j][i],
              maxLength: 2,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.end,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(fontSize: screenWidth / 19),
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: "Box",
                  labelStyle: TextStyle(fontSize: screenWidth / 25),
                  contentPadding: EdgeInsets.fromLTRB(20, 25, 10, 0),
                  counterText: "",
                  // counterStyle: TextStyle(fontSize: screenHeight / 60, height: 1.2),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Color(0xFF6FFAA0), width: 1)),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {
                if (value == '') {
                  setState(() {
                    box = 0;
                    namkeenBox[j][i] = 0;
                    grandBox = 0;
                    totalnetPatti = 0;
                    indiTotal[j][i] = 51 * namkeenPatti[j][i];
                    widget.total = 0;
                    for (int i = 0; i < 5; i++) {
                      for (int k = 0; k < widget.itemslist[i].length; k++) {
                        grandBox += namkeenBox[i][k];
                        totalnetPatti +=
                            (namkeenBox[i][k] * knamkeenitem[i][k]) +
                                namkeenPatti[i][k];
                      }
                    }
                    for (int i = 0; i < indiTotal[j].toList().length; i++) {
                      widget.total = widget.total + indiTotal[j][i];
                    }
                    widget.callback1!(widget.total);
                  });
                } else {
                  setState(() {
                    box = int.parse(value);
                    namkeenBox[j][i] = box;
                    grandBox = 0;
                    totalnetPatti = 0;
                    indiTotal[j][i] =
                        (box * knamkeenprice[j][i] * knamkeenitem[j][i]) +
                            namkeenPatti[j][i] * knamkeenprice[j][i];
                    print('${indiTotal[j][i]} + $j $i');
                    print(indiTotal[1][0]);
                    print(indiTotal[j][2]);
                    widget.total = 0;
                    for (int i = 0; i < 5; i++) {
                      for (int k = 0; k < widget.itemslist[i].length; k++) {
                        grandBox += namkeenBox[i][k];
                        totalnetPatti +=
                            (namkeenBox[i][k] * knamkeenitem[i][k]) +
                                namkeenPatti[i][k];
                      }
                    }
                    for (int i = 0; i < indiTotal[j].toList().length; i++) {
                      widget.total = widget.total + indiTotal[j][i];
                      widget.callback1!(widget.total);
                    }
                    print(widget.total);
                  });
                }
              },
            ),
          ),
          Center(
            child: Text(
              '${knamkeenprice[j][i] * knamkeenitem[j][i]} ₹',
              style: TextStyle(fontSize: screenHeight / 60, height: 1.2),
            ),
          )
        ],
      )),
      DataCell(
        //Patti textfield
        Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
              // height: 100,
              width: screenWidth / 5.7,
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                ],
                controller: textpatticontroller[j][i],
                maxLength: 3,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Patti",
                    labelStyle: TextStyle(fontSize: screenWidth / 25),
                    contentPadding: EdgeInsets.fromLTRB(15, 25, 10, 0),
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: Color.fromARGB(209, 111, 250, 160),
                            width: 1)),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                    ),
                    // hintText: 'patti',
                    // hintStyle: TextStyle(
                    //   fontSize: screenWidth / 22,
                    // ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                onChanged: (value) {
                  if (value == '') {
                    setState(() {
                      patti = 0;
                      grandPatti = 0;
                      totalnetPatti = 0;
                      namkeenPatti[j][i] = 0;
                      indiTotal[j][i] = knamkeenprice[j][i] *
                          knamkeenitem[j][i] *
                          namkeenBox[j][i];
                      widget.total = 0;
                      for (int i = 0; i < 5; i++) {
                        for (int k = 0; k < widget.itemslist[i].length; k++) {
                          grandPatti += namkeenPatti[i][k];
                          totalnetPatti +=
                              (namkeenBox[i][k] * knamkeenitem[i][k]) +
                                  namkeenPatti[i][k];
                        }
                      }
                      for (int i = 0; i < indiTotal[j].toList().length; i++) {
                        widget.total = widget.total + indiTotal[j][i];
                      }
                      widget.callback1!(widget.total);
                    });
                  } else {
                    setState(() {
                      patti = int.parse(value);
                      grandPatti = 0;
                      totalnetPatti = 0;
                      namkeenPatti[j][i] = patti;
                      print(namkeenPatti[j][i]);
                      print('$j $i');
                      print(namkeenPatti[j + 1][i]);
                      print(namkeenPatti[j + 1][i]);
                      for (int i = 0; i < 5; i++) {
                        for (int k = 0; k < widget.itemslist[i].length; k++) {
                          grandPatti += namkeenPatti[i][k];
                          totalnetPatti +=
                              (namkeenBox[i][k] * knamkeenitem[i][k]) +
                                  namkeenPatti[i][k];
                        }
                      }
                      indiTotal[j][i] = (patti * knamkeenprice[j][i]) +
                          (namkeenBox[j][i] *
                              knamkeenprice[j][i] *
                              knamkeenitem[j][i]);
                      widget.total = 0;
                      for (int i = 0; i < indiTotal[j].toList().length; i++) {
                        widget.total = widget.total + indiTotal[j][i];
                      }
                      widget.callback1!(widget.total);
                    });
                  }
                },
              ),
            ),
            Center(
              child: Text(
                '${knamkeenprice[j][i]} ₹',
                style: TextStyle(fontSize: screenHeight / 60, height: 1.2),
              ),
            )
          ],
        ),
      ),
      DataCell(
        Container(
            width: screenWidth / 7,
            child: Text(
              indiTotal[j][i] != null ? '${indiTotal[j][i]}' : '0',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )),
      ),
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('page disposed');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('page deactivated');
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenBottom = MediaQuery.of(context).viewInsets.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    return DataTable(
      headingRowHeight: 50,
      columnSpacing: screenWidth / 20,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      headingTextStyle: TextStyle(color: Colors.black),
      dataTextStyle: TextStyle(color: Colors.black),
      showBottomBorder: true,
      dataRowHeight: screenHeight / 7.5,
      dividerThickness: 1.7,
      columns: [
        DataColumn(
          label: Container(
            width: screenWidth / 3.8,
            // margin: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                'Item Name',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const DataColumn(
          label: Center(
            child: Text(
              '    Box',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Text('   Patti'),
        ),
        DataColumn(
          label: Text('   Total'),
        ),
      ],
      rows: List.generate(
          widget.itemslist[widget.category!].length,
          (i) => createRow(i, widget.category!, namkeenBox[widget.category!][i],
              namkeenPatti[widget.category!][i])),
    );
  }
}

class BottomPrice extends StatefulWidget {
  final BuildContext? context1;
  final int? total;
  BottomPrice({this.context1, this.total});
  @override
  _BottomPriceState createState() => _BottomPriceState();
}

class _BottomPriceState extends State<BottomPrice> {
  @override
  Widget build(BuildContext context1) {
    var screenHeight = MediaQuery.of(context1).size.height;
    var screenBottom = MediaQuery.of(context1).viewInsets.bottom;
    var screenWidth = MediaQuery.of(context1).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: BounceButton(
              child: Icon(
                Icons.chevron_left_rounded,
                size: 40,
              ),
              onTap: () {
                Navigator.pop(context);

                resetvalues();
              },
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 05, 5, 0),
                            child: DottedBorder(
                              dashPattern: [3, 0],
                              radius: Radius.circular(10),
                              color: Color.fromARGB(255, 99, 59, 145),
                              strokeCap: StrokeCap.butt,
                              strokeWidth: 4.5,
                              borderType: BorderType.RRect,
                              padding: EdgeInsets.all(0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                constraints: BoxConstraints(
                                    maxHeight: screenHeight / 18),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 3),
                                // margin: EdgeInsets.fromLTRB(0, 8, 8, 0),
                                child: Center(
                                  child: AutoSizeText(
                                    'Box = $grandBox',
                                    style: TextStyle(
                                        fontSize: screenWidth / 22,
                                        fontFamily: 'arima',
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 5, 0, 0),
                            child: DottedBorder(
                              dashPattern: [1, 0],
                              radius: Radius.circular(10),
                              color: Color.fromARGB(255, 76, 34, 125),
                              strokeCap: StrokeCap.butt,
                              strokeWidth: 4.5,
                              borderType: BorderType.RRect,
                              padding: EdgeInsets.all(0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                constraints: BoxConstraints(
                                  maxHeight: screenHeight / 18,
                                ),
                                // width: MediaQuery.of(context).size.width / 4,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Center(
                                  child: AutoSizeText(
                                    'Patti = $grandPatti',
                                    style: TextStyle(
                                        fontSize: screenWidth / 22,
                                        color: Colors.black,
                                        fontFamily: 'arima',
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20),
                        child: DottedBorder(
                          radius: Radius.circular(10),
                          color: Color.fromARGB(255, 76, 34, 125),
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2.5,
                          borderType: BorderType.RRect,
                          padding: EdgeInsets.all(0),
                          child: Container(
                            // width: screenWidth / 3,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: AutoSizeText(
                                'Total Patti : ${totalnetPatti == null ? '0' : totalnetPatti}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'arima',
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 10, 10),
              child: BounceButton(
                onTap: widget.total == 0 || widget.total == null
                    ? () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Total cannot be zero',
                            style: TextStyle(fontSize: 16),
                          ),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewOrder()));
                      },
                child: Material(
                  borderRadius: BorderRadius.circular(55),
                  elevation: widget.total == null || widget.total == 0 ? 4 : 10,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.total == null || widget.total == 0
                          ? Colors.blueGrey
                          : Color(0xFF3F82F9),
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Center(
                        child: AutoSizeText(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'button',
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
