import 'package:movieapp/model/movie_items_model.dart';

class MovieResponse{
  List<MovieItem> _items;
  MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    List<MovieItem> items = [];
    for (int i = 0; i < parsedJson['Search'].length; i++) {
      MovieItem result = MovieItem(parsedJson['Search'][i]);
      items.add(result);
    }
    _items = items;
  }
  List<MovieItem> get items => _items;
  set items(List<MovieItem> value) {
    _items = value;
  }

}