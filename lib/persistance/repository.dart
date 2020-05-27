
import 'package:movieapp/model/login_model.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/persistance/api_provider.dart';
class Repository{
  ApiProvider appApiProvider = ApiProvider();
  Future<LoginResponse> fetchMovie(String name) => appApiProvider.fetchMovie(name);
  Future<MovieResponse> fetchMovieItems(String searchItem) => appApiProvider.fetchMovieItems(searchItem);
}