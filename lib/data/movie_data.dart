import 'dart:convert';

import 'package:movie_web3/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieData {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZjIzYTEwOWM0MGUxM2IwZmE1YzEwNDI1MDlmYzU5NyIsIm5iZiI6MTcyNjYyMzM2NS42MTIwODEsInN1YiI6IjY2ZWEyNzI4YjY2NzQ2ZGQ3OTBiMTFhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ey_NwzvNgnyyilXfyeJVFCvLtHbYWK6onut_i_PE4UE';

  Future<List<MovieModel>> fetchTopRatedMovie() async {
    final response = await http
        .get(Uri.parse('$baseUrl/top_rated?language=en-US&page=1'), headers: {
      'Authorization': 'Bearer $bearerToken',
      'accept': 'application/json'
    });
    if (response.statusCode == 200) {
      print(response.body);
      return ((jsonDecode(response.body)['results']) as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load movie data");
    }
  }
}
