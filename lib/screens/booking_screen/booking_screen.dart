import 'package:cinema/screens/booking_screen/custom_app_bar.dart';
import 'package:cinema/screens/booking_screen/date.dart';
import 'package:cinema/screens/booking_screen/pay.dart';
import 'package:cinema/screens/booking_screen/place.dart';
import 'package:cinema/screens/booking_screen/seat.dart';
import 'package:cinema/screens/booking_screen/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String movieName;

  BookingScreen({this.movieName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            //app bar
            CustomAppBar(widget.movieName),
            DateSelector(),
            //
            // //Time selector
            TimeSelector(),
            //
            // //Location and theatre
            Place(),
            //
            // //Seat selector
            SeatSelector(),
            //
            // //Pay button and seat categories
            PayButton(),
          ],
        ),
      ),
    );
  }
}
