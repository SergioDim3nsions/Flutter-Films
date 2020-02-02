import 'package:flutter/material.dart';
import 'package:flutter_films/src/models/film_model.dart';
import 'package:flutter_films/src/network/request/get_now_playing_films_request.dart';
import 'package:flutter_films/src/network/request/get_popular_films_request.dart';
import 'package:flutter_films/src/pages/widget/card_swiper_widget.dart';
import 'package:flutter_films/src/pages/widget/movie_horizontal.dart';
import 'package:flutter_films/src/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  final GetNowPlayingFilmsRequest _getNowPlayingFilmsRequest =
      GetNowPlayingFilmsRequest();
  final GetPopularFilmsRequest _getPopularFilmsRequest =
      GetPopularFilmsRequest();

  @override
  Widget build(BuildContext context) {

    _getPopularFilmsRequest.getPopularFilms();
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Films'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_swipeCards(), _footer(context)],
          ),
        ));
  }

  Widget _swipeCards() {
    return FutureBuilder(
      future: _getNowPlayingFilmsRequest.getNowPlayingFilms(),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            films: snapshot.data,
          );
        } else {
          return Container(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Popular',
                    style: Theme.of(context).textTheme.subhead)),
            SizedBox(
              height: 5.0,
            ),
            StreamBuilder(
              stream: _getPopularFilmsRequest.popularStream,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(
                    films: snapshot.data,
                    nextPage: _getPopularFilmsRequest.getPopularFilms,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
