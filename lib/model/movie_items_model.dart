

class MovieItem {
  String _title;
  String _year;
  String _imdbID;
  String _poster;
  MovieItem(parsedJson){
    print('parsedJson ==${parsedJson}');
    _title = parsedJson['Title'];
    _year = parsedJson['Year'];
    _imdbID = parsedJson['imdbID'];
    _poster = parsedJson['Poster'];

  }
  String get title => _title;
  set title(String value) {
    _title = value;
  }
  String get year => _year;
  set year(String value) {
    _year = value;
  }
  String get imdbID => _imdbID;
  set imdbID(String value) {
    _imdbID = value;
  }

  String get poster => _poster;
  set poster(String value) {
    _poster = value;
  }
}