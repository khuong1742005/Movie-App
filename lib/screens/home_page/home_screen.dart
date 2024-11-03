import 'package:flutter/material.dart';
import 'package:movie_app/models/film.dart';
import 'package:movie_app/services/film_api.dart';
import 'package:movie_app/widgets/main_button.dart';

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
        children: [
          Stack(
            children: [
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Image.network(
                  films[0].fullImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 500,
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
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 500,
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
                            borderColor: Theme.of(context).colorScheme.primary,
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
                            textColor: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                            borderColor: Colors.grey,
                            isHaveIcon: true,
                            icon: Icons.add,
                            iconColor: Theme.of(context).colorScheme.primary,
                          )
                        ],
                      )
                    ],
                  ),
                ),
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
