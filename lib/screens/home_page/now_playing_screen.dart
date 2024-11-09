import 'package:flutter/material.dart';

import '../../models/film.dart';
import '../../services/film_api.dart';
import '../../widgets/film_categories.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  List<Film> films = [];

  @override
  void initState() {
    super.initState();
    fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Movies'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: films.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final film = films[index];
            return buildFilmCategory(
              context,
              film: film,
              heightImage: 300,
              widthImage: 300,
            );
          },
        ),
      ),
    );
  }

  Future<void> fetchFilms() async {
    final response = await FilmApi.fetchFilms();
    setState(() {
      films = response;
    });
  }
}
