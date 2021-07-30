import 'dart:ui';

import 'package:cinema/constants/color.dart';
import 'package:cinema/model/login_model.dart';
import 'package:cinema/screens/favorite_screen/favorite.dart';
import 'package:cinema/screens/home_screen.dart';
import 'package:cinema/screens/welcome/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://github.com/hajuha/ticket_booking_app';

class CustomDrawer extends StatefulWidget {
  final user;

  CustomDrawer({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void _launchURL() async {
    await launch(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Drawer(
          child: Stack(
        children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: TextColor.withOpacity(0.5),
              ),
            ),
          ),
          ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: TextColor.withOpacity(0.2),
                ),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage('${widget.user.avatarURL}'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildName(widget.user.fullName, widget.user.email)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Homepage',
                  style: TextStyle(
                      fontFamily: 'Euclid',
                      color: LightPrimaryColor,
                      fontSize: 18),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                  // Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.pages,
                  color: LightPrimaryColor,
                ),
              ),
              ListTile(
                title: const Text(
                  'Favourite films',
                  style: TextStyle(
                      fontFamily: 'Euclid',
                      color: LightPrimaryColor,
                      fontSize: 18),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new FavoriteScreen()),
                  );
                  // Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.bookmark,
                  color: LightPrimaryColor,
                ),
              ),
              ListTile(
                title: const Text(
                  'My ticket',
                  style: TextStyle(
                      fontFamily: 'Euclid',
                      color: LightPrimaryColor,
                      fontSize: 18),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing:
                    Icon(Icons.movie_filter_rounded, color: LightPrimaryColor),
              ),
              ListTile(
                title: const Text(
                  'Scan QR Code',
                  style: TextStyle(
                      fontFamily: 'Euclid',
                      color: LightPrimaryColor,
                      fontSize: 18),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing: Icon(Icons.qr_code, color: LightPrimaryColor),
              ),
              ListTile(
                title: const Text(
                  'Rate this app',
                  style: TextStyle(
                      fontFamily: 'Euclid',
                      color: LightPrimaryColor,
                      fontSize: 18),
                ),
                onTap: _launchURL,
                trailing:
                    Icon(Icons.star_border_rounded, color: LightPrimaryColor),
              ),
              Center(
                child: QrImage(
                  data: '$widget.user.username' + '$widget.user.email',
                  size: 160,
                  backgroundColor: Colors.white,
                  version: QrVersions.auto,
                  embeddedImage: AssetImage('assets/image/logo.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(40, 40),
                  ),
                ),
              ),
              Divider(color: PrimaryColor, height: 40),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      backgroundColor: LightPrimaryColor.withOpacity(.85),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        fontFamily: 'Euclid',
                        color: AccentColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget buildName(fullName, email) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fullName,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(color: LightPrimaryColor),
          )
        ],
      );
}
