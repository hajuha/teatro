import 'dart:ui';

import 'package:cinema/components/rounded_button.dart';
import 'package:cinema/components/widget.dart';
import 'package:cinema/constants/color.dart';
import 'package:cinema/data/movie_data.dart';
import 'package:cinema/screens/detail_screen/detail.dart';
import 'package:cinema/screens/welcome/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://github.com/hajuha/ticket_booking_app';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _movieData = MovieData();
  String username = '';
  String avatarURL = '';
  String fullName = '';
  String email = '';

  Size get _size => MediaQuery.of(context).size;

  double get _movieItemWidth => _size.width / 2 + 48;
  ScrollController _movieScrollController = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();
  double _maxMovieTranslate = 65;
  int _movieIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.get('username').toString();
      email = prefs.get('email').toString();
      fullName = prefs.get('fullName').toString();
      avatarURL = prefs.get('avatarURL').toString();
    });
    print(email);
  }

  void _launchURL() async {
    await launch(_url);
  }

  @override
  Widget build(BuildContext context) {
    _movieScrollController.addListener(() {
      _backgroundScrollController.jumpTo(
          _movieScrollController.offset * (_size.width / _movieItemWidth));
    });
    // final user =
    AppBar _buildAppBar(BuildContext context) {
      return AppBar(
        title: Text(
          'Teatro',
          style: TextStyle(fontFamily: 'Euclid'),
        ),
        backgroundColor: Colors.transparent,
        actions: [],
      );
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backgroundListView(),
          _movieListView(),
          // _buyButton(context)
        ],
      ),
      drawer: Theme(
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
                          backgroundImage: NetworkImage('$avatarURL'),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[buildName(fullName, email)],
                          ),
                        ),
                      ],
                    ),
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
                    Navigator.pop(context);
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
                  trailing: Icon(Icons.movie_filter_rounded,
                      color: LightPrimaryColor),
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
                    data: '$username' + '$email',
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
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
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

  Widget _backgroundListView() {
    return ListView.builder(
      controller: _backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: true,
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Container(
          width: _size.width,
          height: _size.height - 20,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -_size.width / 3,
                right: -_size.width / 3,
                child: Image(
                  image: _movieData.movieList[index].image.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(.1),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.3),
                        Colors.black.withOpacity(.95)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.9]),
                ),
              ),
              // Container(
              //   height: _size.height * .25,
              //   padding:
              //       EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              //   child: Align(
              //     alignment: Alignment.center,
              //     child: Image(
              //       width: _size.width / 1.8,
              //       image: _movieData.movieList[index].imageText.image,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _movieListView() {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: Container(
        height: _size.height * .75,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ScrollSnapList(
            listController: _movieScrollController,
            onItemFocus: (item) {
              _movieIndex = item;
            },
            itemSize: _movieItemWidth,
            padding: EdgeInsets.zero,
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _movieItem(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _movieItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (ctx, a1, a2) => DetailScreen(
              movie: _movieData.movieList[_movieIndex],
              size: _size,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: _movieData.movieList[index].image.image,
                width: _size.width / 2,
              ),
            ),
            SizedBox(
              height: _size.height * .02,
            ),
            AnimatedBuilder(
              animation: _movieScrollController,
              builder: (context, child) {
                double activeOffset = index * _movieItemWidth;
                double opacity = _movieDescriptionOpacity(
                    _movieScrollController.offset, activeOffset);

                return Opacity(
                  opacity: opacity / 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        _movieData.movieList[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Euclid",
                            fontSize: _size.width / 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: _size.height * .01,
                      ),
                      AppWidget.genresFormat(
                          _movieData.movieList[index].genre, Colors.white),
                      SizedBox(
                        height: _size.height * .01,
                      ),
                      Text(
                        _movieData.movieList[index].rating.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _size.width / 16,
                        ),
                      ),
                      SizedBox(
                        height: _size.height * .005,
                      ),
                      AppWidget.starRating(_movieData.movieList[index].rating)
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  double _movieDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (_movieScrollController.offset + _movieItemWidth <= activeOffset) {
      opacity = 0;
    } else if (_movieScrollController.offset <= activeOffset) {
      opacity =
          ((_movieScrollController.offset - (activeOffset - _movieItemWidth)) /
              _movieItemWidth *
              100);
    } else if (_movieScrollController.offset < activeOffset + _movieItemWidth) {
      opacity = 100 -
          (((_movieScrollController.offset - (activeOffset - _movieItemWidth)) /
                  _movieItemWidth *
                  100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }
}
