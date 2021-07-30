import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CGV Indochina Xuân Thủy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Cầu Giấy, Hà Nội',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 16.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
