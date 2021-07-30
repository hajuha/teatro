import 'dart:convert';
import 'dart:ui';
import 'package:cinema/components/drawer.dart';
import 'package:cinema/components/widget.dart';
import 'package:cinema/data/movie_data.dart';
import 'package:cinema/model/login_model.dart';
import 'package:cinema/screens/detail_screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _movieData = MovieData();
  var user = LoginResponseModel();

  Size get _size => MediaQuery.of(context).size;

  double get _movieItemWidth => _size.width / 2 + 48;
  ScrollController _movieScrollController = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();
  int _movieIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      Map json = jsonDecode(prefs.getString('userData'));
      user = LoginResponseModel.fromJson(json);
      print(prefs.getString('date'));
    });
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
      drawer: new CustomDrawer(user: user),
    );
  }

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
