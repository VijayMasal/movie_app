class LoginResponse{
  String _title;
  String _year;

  LoginResponse.fromJson(Map<String, dynamic> parsedJson) {
    _title = parsedJson['Title'];
    _year = parsedJson['Year'];
  }

  String get title => _title;

  set title(String value) {
    _title = value;
    print('title ${_title}');
  }
  String get year => _year;
  set year(String value) {
    _year = value;
    print('_year ${_year}');
  }

}

