import 'package:flutter/material.dart';
import 'package:flutter_films/src/models/actors_model.dart';
import 'package:flutter_films/src/models/film_model.dart';
import 'package:flutter_films/src/network/request/get_cast_request.dart';

class FilmDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Film film = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _createAppBar(film),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10.0),
                _PosterTitle(context, film),
                _description(film),
                _description(film),
                _description(film),
                _description(film),
                _description(film),
                _createCasting(film)
              ]),
            )
          ],
        ),
      ),
    );
  }
}

Widget _PosterTitle(BuildContext context, Film film) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      children: <Widget>[
        Hero(
          tag: film.uniqueId,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(film.getPosterImage()),
              height: 150.0,
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                film.originalTitle,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                film.originalTitle,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border),
                  Text(film.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subhead)
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _description(Film film) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    child: Text(
      film.overview,
      textAlign: TextAlign.justify,
    ),
  );
}

Widget _createCasting(film) {
  final GetCastRequest _getCastRequest = GetCastRequest();

  return FutureBuilder(
    future: _getCastRequest.getCast(film.id.toString()),
    builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
      if (snapshot.hasData) {
        return _createPageView(snapshot.data);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

Widget _createPageView(List<Actor> actors) {
  return SizedBox(
    height: 200.0,
    child: PageView.builder(
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: actors.length,
        itemBuilder: (context, i) {
          return _createActorCard(actors[i]);
        }),
  );
}

Widget _createActorCard(Actor actor) {
  return Container(
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            image: NetworkImage(actor.getProfileImage()),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          actor.name,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}

Widget _createAppBar(Film film) {
  return SliverAppBar(
    elevation: 2.0,
    backgroundColor: Colors.indigoAccent,
    expandedHeight: 200,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          film.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(film.getBackdropPath()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 500),
          fit: BoxFit.cover,
        )),
  );
}
