import 'package:movieapp/model/login_model.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/persistance/repository.dart';
import 'package:rxdart/rxdart.dart';
class MovieBloc{
  Repository _repository = Repository();
  final _itemsFetcher = PublishSubject<MovieResponse>();
  Observable<MovieResponse> get items => _itemsFetcher.stream;
  fetchUserItems(String searchItem) async {
    MovieResponse movieItemsResponse = await _repository.fetchMovieItems(searchItem);
    print('movieItemsResponse == ${movieItemsResponse}');
    _itemsFetcher.sink.add(movieItemsResponse);
  }
  dispose() {
    //_itemsFetcher.close();
  }
}
final movieBloc = MovieBloc();