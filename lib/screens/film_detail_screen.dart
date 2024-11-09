import 'package:flutter/material.dart';
import 'package:movie_app/models/film.dart';
import 'package:movie_app/widgets/main_button.dart';

Widget buildFilmDetail(
  BuildContext context, {
  required Film film,
}) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: ListView(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Image.network(
                  film.fullImageUrl,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.5),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                film.originalTitle,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.bookmark_border),
                                SizedBox(width: 20),
                                Icon(Icons.share)
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildMainButton(
                              onPressed: () {},
                              backgroudColor:
                                  Theme.of(context).colorScheme.primary,
                              height: 45,
                              width: 125,
                              radius: 40,
                              text: 'Play',
                              textColor: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              borderColor:
                                  Theme.of(context).colorScheme.primary,
                              icon: Icons.play_arrow,
                              iconColor: Colors.white,
                              isHaveIcon: true,
                            ),
                            buildMainButton(
                              onPressed: () {},
                              backgroudColor: Colors.white,
                              height: 45,
                              width: 125,
                              radius: 40,
                              text: 'Download',
                              textColor: Theme.of(context).colorScheme.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              borderColor: Colors.grey,
                              icon: Icons.download,
                              iconColor: Theme.of(context).colorScheme.primary,
                              isHaveIcon: true,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(film.overview,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                )
              ],
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        )
      ],
    ),
  );
}
