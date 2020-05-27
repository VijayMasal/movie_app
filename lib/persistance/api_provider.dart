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
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<dynamic> get(String searchItem) async {
    var responseJson;
    final _baseURL = "http://www.omdbapi.com/?apikey=2d1cd4c0&s=${searchItem}";
    try {
      final response = await client.get("$_baseURL");
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load movie');
    }
    return responseJson;
  }



  dynamic _returnResponse(response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }



}