import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:movieapp/model/login_model.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/persistance/api_exception.dart';
class ApiProvider{
  Client client = Client();
  Future<LoginResponse> fetchMovie(String name) async {
    //final _baseURL = "https://api.github.com/search/users?q=${name}&page=1";
    final _baseURL = "http://www.omdbapi.com/?apikey=2d1cd4c0&t=${name}";
    final response = await client.get("$_baseURL");
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
  Future<MovieResponse> fetchMovieItems(String searchItem) async {
    final _baseURL = "http://www.omdbapi.com/?apikey=2d1cd4c0&s=${searchItem}";
    final response = await client.get("$_baseURL");
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}