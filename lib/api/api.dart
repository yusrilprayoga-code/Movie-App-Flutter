import 'dart:convert';

import 'package:Tixflix/constants/Movie_List.dart';
import 'package:Tixflix/constants/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.api_key}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.api_key}';

  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.api_key}';

  Future<List<MovieList>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => MovieList.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieList>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => MovieList.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieList>> getupComingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => MovieList.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
