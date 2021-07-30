import 'dart:convert';
import 'dart:ui';
import 'package:cinema/components/drawer.dart';
import 'package:cinema/data/movie_data.dart';
import 'package:cinema/model/login_model.dart';
import 'package:cinema/screens/detail_screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var _movieData = MovieData();
  var user = LoginResponseModel();

  Size get _size => MediaQuery.of(context).size;
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
      backgroundColor: Colors.white,
      body: _movieListView(),
      drawer: new CustomDrawer(user: user),
    );
  }

  Widget _movieListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (context, i) {
        return _buildRow(i);
      },
    );
  }

  Widget _buildRow(index) {
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
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: _movieData.movieList[index].id,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: _movieData.movieList[index].image.image,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _movieData.movieList[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: _size.width - 180,
                        child: Text(
                          _movieData.movieList[index].storyLine,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
