import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/film.dart';

class FilmApi{
  static Future<List<Film>> fetchFilms() async {
    final response =
    await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=ba733207be91083f6e86d65d6dffd83d&language=en-US&page=1'));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final films = results.map((e) {
      return Film.fromMap(e);
    }).toList();
    return films;
  }
}