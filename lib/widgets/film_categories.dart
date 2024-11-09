import 'package:flutter/material.dart';
import 'package:movie_app/screens/film_detail_screen.dart';
import '../models/film.dart';

Widget buildFilmCategory(
  BuildContext context, {
  required Film film,
  double widthImage = 0,
  double heightImage = 0,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => buildFilmDetail(context, film: film)));
    },
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              film.fullImageUrl,
              fit: BoxFit.cover,
              height: heightImage,
              width: widthImage,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Container(
            height: 30,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary),
            child: Center(
              child: Text(
                '${film.voteAverage}',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
