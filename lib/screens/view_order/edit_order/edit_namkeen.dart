import 'package:rangoli/constants.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'ReviewEditedOrder.dart';
import 'edit_create_order_list.dart';

import 'package:flutter/material.dart';

List<List<int>> indiTotal2 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List<List<int>> namkeenBox2 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List<List<int>> namkeenPatti2 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
List _textboxcontroller2 = [
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
List _textpatticontroller2 = [
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
int grandBox2 = 0;
int grandPatti2 = 0;
int initvariable = 0;
List<int> newinit = [0, 0, 0, 0, 0];

class EditCreate5NamkeenRow extends StatefulWidget {
  final Function callback1;
  final itemslist = knamkeen;
  int total = 0;
  final int category;
  final order;
  EditCreate5NamkeenRow(
      {required this.callback1, required this.category, required this.order});
  int currentTotal() {
    return total;
  }

  @override
  _EditCreate5NamkeenRowState createState() => _EditCreate5NamkeenRowState();
}

class _EditCreate5NamkeenRowState extends State<EditCreate5NamkeenRow>
    with AutomaticKeepAliveClientMixin {
  // List indiTotal = List.filled(25, 0);
  // List namkeenBox = List.filled(25, 0);
  // List namkeenPatti = List.filled(25, 0);
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();

    print('page created');

    int i = widget.category;

    for (int j = 0; j < knamkeen[i].length; j++) {
      if (newinit[i] == 0) {
        namkeenBox2[i][j] = widget.order.data()['$i'][j]['Box'];

        namkeenPatti2[i][j] = widget.order.data()['$i'][j]['Patti'];
        indiTotal2[i][j] = widget.order.data()['$i'][j]['Total'];
        // print(widget.order.data()['$i'][j]['Total'].runtimeType);

        // print(total[i]);
        // print('$grandBox2');
        // print('$grandPatti2');

        _textboxcontroller2[widget.category][j] = TextEditingController(
            text: namkeenBox2[widget.category][j].toString() == '0'
                ? ''
                : namkeenBox2[widget.category][j].toString());
        _textpatticontroller2[widget.category][j] = TextEditingController(
            text: namkeenPatti2[widget.category][j].toString() == '0'
                ? ''
                : namkeenPatti2[widget.category][j].toString());
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int j = 0; j < indiTotal2[i].toList().length; j++) {
        widget.total = widget.total + indiTotal2[i][j];
      }
      widget.callback1(widget.total);
      // Add Your Code here.
    });

    if (initvariable == 0) {
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < knamkeen[i].length; j++) {
          if (newinit[i] == 0) {
            namkeenBox2[i][j] = widget.order.data()['$i'][j]['Box'];

            namkeenPatti2[i][j] = widget.order.data()['$i'][j]['Patti'];
            indiTotal2[i][j] = widget.order.data()['$i'][j]['Total'];
            // print(widget.order.data()['$i'][j]['Total'].runtimeType);
            grandBox2 += namkeenBox2[i][j];
            grandPatti2 += namkeenPatti2[i][j];
            categorytotal[i] += indiTotal2[i][j];
          }
        }
      }
      initvariable = 1;
    }
  }

  DataRow createRow(int i, int j, int box, int patti) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenBottom = MediaQuery.of(context).viewInsets.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    return DataRow(cells: [
      DataCell(Container(
        width: MediaQuery.of(context).size.width / 3.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.itemslist[j][i]}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Text('(1 Box = 15 Patti)'),
          ],
        ),
      )),
      DataCell(Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
        width: screenWidth / 6,
        child: TextField(
          controller: _textboxcontroller2[j][i],
          maxLength: 3,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.end,
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue, width: 1)),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 3),
              ),
              hintText: 'Box',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
          onChanged: (value) {
            if (value == '') {
              setState(() {
                box = 0;
                namkeenBox2[j][i] = 0;
                grandBox2 = 0;
                indiTotal2[j][i] = 51 * namkeenPatti2[j][i];
                widget.total = 0;
                for (int i = 0; i < 5; i++) {
                  for (int k = 0; k < widget.itemslist[i].length; k++)
                    grandBox2 += namkeenBox2[i][k];
                }
                for (int i = 0; i < indiTotal2[j].toList().length; i++) {
                  widget.total = widget.total + indiTotal2[j][i];
                }
                widget.callback1(widget.total);
              });
            } else {
              setState(() {
                box = int.parse(value);
                namkeenBox2[j][i] = box;
                grandBox2 = 0;
                indiTotal2[j][i] = (box * 51 * 15) + namkeenPatti2[j][i] * 51;

                widget.total = 0;
                for (int i = 0; i < 5; i++) {
                  for (int k = 0; k < widget.itemslist[i].length; k++)
                    grandBox2 += namkeenBox2[i][k];
                }
                for (int i = 0; i < indiTotal2[j].toList().length; i++) {
                  widget.total = widget.total + indiTotal2[j][i];
                }
                widget.callback1(widget.total);
                print(widget.total);
              });
            }
          },
        ),
      )),
      DataCell(
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
          // height: 100,
          width: screenWidth / 6,
          child: TextField(
            controller: _textpatticontroller2[j][i],
            maxLength: 3,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                counterText: '',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                ),
                hintText: 'Patti',
                hintStyle: TextStyle(fontSize: 17),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            onChanged: (value) {
              if (value == '') {
                setState(() {
                  patti = 0;
                  grandPatti2 = 0;
                  namkeenPatti2[j][i] = 0;
                  indiTotal2[j][i] = 51 * 10 * namkeenBox2[j][i];
                  widget.total = 0;
                  for (int i = 0; i < 5; i++) {
                    for (int k = 0; k < widget.itemslist[i].length; k++)
                      grandPatti2 += namkeenPatti2[i][k];
                  }
                  for (int i = 0; i < indiTotal2[j].toList().length; i++) {
                    widget.total = widget.total + indiTotal2[j][i];
                  }
                  widget.callback1(widget.total);
                });
              } else {
                setState(() {
                  patti = int.parse(value);
                  grandPatti2 = 0;
                  namkeenPatti2[j][i] = patti;

                  for (int i = 0; i < 5; i++) {
                    for (int k = 0; k < widget.itemslist[i].length; k++)
                      grandPatti2 += namkeenPatti2[i][k];
                  }
                  indiTotal2[j][i] =
                      (patti * 51) + (namkeenBox2[j][i] * 51 * 15);
                  widget.total = 0;
                  for (int i = 0; i < indiTotal2[j].toList().length; i++) {
                    widget.total = widget.total + indiTotal2[j][i];
                  }
                  widget.callback1(widget.total);
                });
              }
            },
          ),
        ),
      ),
      DataCell(
        Container(
            width: screenWidth / 7,
            child: Text(
              indiTotal2[j][i] != null ? '${indiTotal2[j][i]}' : '0',
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
      columnSpacing: screenWidth / 25,
      decoration: BoxDecoration(color: Colors.white),
      headingTextStyle: TextStyle(color: Colors.black),
      dataTextStyle: TextStyle(color: Colors.black),
      dataRowHeight: 70,
      dividerThickness: 5,
      columns: [
        DataColumn(
          label: Text('FirstName'),
        ),
        DataColumn(
          label: Text('Last '),
        ),
        DataColumn(
          label: Text('Last '),
        ),
        DataColumn(
          label: Text('Total'),
        ),
      ],
      rows: List.generate(
          widget.itemslist[widget.category].length,
          (i) => createRow(i, widget.category, namkeenBox2[widget.category][i],
              namkeenPatti2[widget.category][i])),
    );
  }
}

class EditBottomPrice extends StatefulWidget {
  final BuildContext context1;
  final int total;
  final orderid;
  EditBottomPrice(
      {required this.context1, required this.total, required this.orderid});
  @override
  _EditBottomPriceState createState() => _EditBottomPriceState();
}

class _EditBottomPriceState extends State<EditBottomPrice> {
  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              child: Icon(
                Icons.chevron_left_rounded,
                size: 40,
              ),
              onTap: () {
                Navigator.pop(context);
                indiTotal2 = [
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ]
                ];
                namkeenBox2 = [
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ]
                ];
                namkeenPatti2 = [
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ],
                  [
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                  ]
                ];
                _textboxcontroller2 = [
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
                _textpatticontroller2 = [
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
                grandBox2 = 0;
                grandPatti2 = 0;
                categorytotal = [0, 0, 0, 0, 0];
                grandTotal2 = 0;
                print(initvariable);
                initvariable = 0;
                newinit = [0, 0, 0, 0, 0];
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 4,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Box = $grandBox2',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 4,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Patti = $grandPatti2',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Text(
                      'Total : ${widget.total == null ? '0' : widget.total}',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewEditedOrder(
                                orderid: widget.orderid,
                              )));
                },
                child: Material(
                  borderRadius: BorderRadius.circular(55),
                  elevation: 8,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        widget.total == null || widget.total == 0
                            ? Colors.blueGrey
                            : Colors.blueAccent,
                        Color(0xFF3F82F9),
                      ]),
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 20),
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
