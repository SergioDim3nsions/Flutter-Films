import 'package:flutter/material.dart';
import 'package:flutter_films/src/pages/widget/card_swiper_widget.dart';
import 'package:flutter_films/src/providers/films_provider.dart';

class HomePage extends StatelessWidget {
  final FilmsProvider provider = FilmsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Films'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[_swipeCards()],
          ),
        ));
  }

  Widget _swipeCards() {
    return FutureBuilder(
      future: provider.getPlayingNow(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            films: snapshot.data,
          );
        } else {
          return Container(
            height: 400,
            child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
