import 'package:flutter/material.dart';
import 'package:movie_app/models/film.dart';
import 'package:movie_app/services/film_api.dart';
import 'package:movie_app/widgets/main_button.dart';

import '../../widgets/film_categories.dart';
import 'now_playing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Film> films = [];
  bool _isBell = false;

  @override
  void initState() {
    super.initState();
    fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Image.network(
                          films[0].fullImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.6),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                films[0].originalTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              Text(
                                films[0].releaseDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  buildMainButton(
                                    onPressed: () {},
                                    width: 62,
                                    height: 45,
                                    radius: 40,
                                    backgroudColor:
                                        Theme.of(context).colorScheme.primary,
                                    text: 'Play',
                                    textColor: Colors.white,
                                    fontSize: 15,
                                    borderColor:
                                        Theme.of(context).colorScheme.primary,
                                    isHaveIcon: true,
                                    icon: Icons.play_arrow,
                                    iconColor: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  buildMainButton(
                                    onPressed: () {},
                                    width: 85,
                                    height: 45,
                                    radius: 40,
                                    backgroudColor: Colors.black,
                                    text: 'My List',
                                    textColor:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 15,
                                    borderColor: Colors.grey,
                                    isHaveIcon: true,
                                    icon: Icons.add,
                                    iconColor:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 25, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Now Playing Movies',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NowPlayingScreen()));
                                },
                                child: Text(
                                  'See all',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: films.length,
                              itemBuilder: (context, index) {
                                final film = films[index];
                                return buildFilmCategory(
                                  context,
                                  film: film,
                                  heightImage: 200,
                                  widthImage: 150,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isBell = !_isBell;
                      });
                    },
                    child: iconBell(),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> fetchFilms() async {
    final response = await FilmApi.fetchFilms();
    setState(() {
      films = response;
    });
  }

  Widget iconBell() {
    return (_isBell)
        ? const Icon(Icons.notifications_active, color: Colors.yellow)
        : const Icon(
            Icons.notifications_none,
            color: Colors.white,
          );
  }
}
