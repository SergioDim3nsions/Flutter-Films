import 'package:flutter/material.dart';
import 'package:flutter_films/src/models/film_model.dart';
import 'package:flutter_films/src/network/request/get_search_request.dart';

class DataSearch extends SearchDelegate {
  String selection = '';
  final GetSearchRequest getSearchRequest = GetSearchRequest();

  final films = [
    'Spiderman',
    'Batman',
    'Wonderwoman',
    'Lobezno',
    'Iron Man',
    'Superman',
    'Iron Man 2',
    'Iron Man 3',
    'Iron Man 4',
  ];

  final recentFilms = ['Spiderman', 'Batman'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions our icon appbar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon left appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder with results to show
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: getSearchRequest.getSearchedFilms(query),
      builder: (BuildContext conntext, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          final films = snapshot.data;

          return ListView(
              children: films.map((film) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(film.getPosterImage()),
                placeholder: AssetImage("assets/img/no-image.jpg"),
                width: 50.0,
                fit: BoxFit.contain,
              ),
              title: Text(film.title),
              subtitle: Text(film.originalTitle),
              onTap: () {
                film.uniqueId = '';
                Navigator.pushNamed(context, 'detail', arguments: film);
              },
            );
          }).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final suggestedList = (query.isEmpty)
  //       ? recentFilms
  //       : films
  //           .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
  //           .toList();

  //   // suggestions when the person writte
  //   return ListView.builder(
  //     itemCount: suggestedList.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(suggestedList[i]),
  //         onTap: () {
  //           selection = suggestedList[i];
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
  // }
}
