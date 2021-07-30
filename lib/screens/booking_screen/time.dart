import 'package:cinema/constants/color.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int timeIntexSelected = 1;

  var time = [
    ["09.30", 50000],
    ["11.30", 50000],
    ["13.30", 80000],
    ["15.30", 50000],
    ["17.00", 90000],
    ["18.30", 120000],
    ["21.00", 120000],
  ];

  Widget _timeItem(String time, int price, bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 20 * 0.75),
      decoration: BoxDecoration(
        border: Border.all(
          color: active ? Orange : Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
            text: time,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: active ? Orange : Colors.white,
            ),
          )),
          Text(
            "$price đ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 17,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.035),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: index == 0 ? 32 : 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    timeIntexSelected = index;
                  });
                },
                child: _timeItem(time[index][0], time[index][1],
                    index == timeIntexSelected ? true : false),
              ),
            );
          },
        ),
      ),
    );
  }
}
