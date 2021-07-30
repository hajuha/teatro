import 'dart:ffi';

import 'package:cinema/components/widget.dart';
import 'package:flutter/material.dart';

class SeatSelector extends StatefulWidget {
  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  List<List<int>> _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 3, 3, 1, 1],
    [1, 1, 1, 2, 1, 1, 3],
    [2, 2, 2, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 3, 1, 1, 1, 1],
  ];

  void _selectSeat(i, x) {
    print('tap');
    if (_chairStatus[i][x - 1] == 1) {
      setState(() {
        _chairStatus[i][x - 1] = 3;
      });
    } else {
      setState(() {
        _chairStatus[i][x - 1] = 1;
      });
    }
    print(_chairStatus);
  }

  Widget _chairList() {
    Size size = MediaQuery.of(context).size;

    // 1 is free seats
    // 2 is selected seats
    // 3 is reserved seats

    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < 6; i++)
            Container(
              // margin: EdgeInsets.only(top: i == 3 ? size.height * .02 : 0),
              child: Row(
                children: <Widget>[
                  for (int x = 0; x < 9; x++)
                    Expanded(
                        flex: x == 0 || x == 8 ? 2 : 1,
                        child: x == 0 || x == 8
                            // (x == 4)
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  _selectSeat(i, x);
                                },
                                child: Container(
                                  height: size.width / 11 - 10,
                                  margin: EdgeInsets.all(5),
                                  child: _chairStatus[i][x - 1] == 1
                                      ? AppWidget.whiteChair()
                                      : _chairStatus[i][x - 1] == 2
                                          ? AppWidget.yellowChair()
                                          : AppWidget.yellowChair(),
                                ),
                              )),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 47,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: size.height * .1,
              child: Container(width: size.width, child: _chairList())),
        ],
      ),
    );
  }
}
